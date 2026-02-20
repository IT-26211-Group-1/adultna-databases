import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { onboardingQuestions } from "../db/onboardingQuestions.js";
import { answerOptions } from "../db/answerOptions.js";
import { outcomeTag } from "../db/outcomeTag.js";
import { eq } from "drizzle-orm";

async function getDbConnection() {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST!,
    port: 3306,
    user: process.env.DB_USER!,
    password: process.env.DB_PASSWORD!,
    database: process.env.DB_NAME!,
  });
  return drizzle(connection);
}

export async function seedOnboardingQuestions() {
  const db = await getDbConnection();
  console.log("📝 Seeding onboarding questions...");

  try {
    // First, seed outcome tags
    console.log("📋 Creating outcome tags...");

    const outcomeTags = [
      { name: "job_search" },
      { name: "career_development" },
      { name: "student" },
      { name: "gov_guides" },
      { name: "resume" },
      { name: "cover_letter" },
      { name: "general" },
      { name: "filebox" },
    ];

    const createdTags: Record<string, number> = {};

    for (const tag of outcomeTags) {
      const [existingTag] = await db
        .select()
        .from(outcomeTag)
        .where(eq(outcomeTag.name, tag.name))
        .limit(1);

      if (existingTag) {
        createdTags[tag.name] = existingTag.tag_id;
        console.log(
          `ℹ️  Tag '${tag.name}' already exists with ID: ${existingTag.tag_id}`,
        );
      } else {
        const [newTag] = await db.insert(outcomeTag).values(tag).$returningId();
        createdTags[tag.name] = newTag.tag_id;
        console.log(`✅ Created tag '${tag.name}' with ID: ${newTag.tag_id}`);
      }
    }

    // Insert Life Stage question
    const [lifeStageQuestion] = await db
      .insert(onboardingQuestions)
      .values({
        question: "Which Stage best describes you?",
        category: "life_stage",
        status: "accepted",
      })
      .$returningId();

    console.log(
      `✅ Created life stage question with ID: ${lifeStageQuestion.id}`,
    );

    // Insert answer options for Life Stage question
    await db.insert(answerOptions).values([
      {
        questionId: lifeStageQuestion.id,
        optionText: "Job Seeker",
        outcomeTagId: createdTags["job_search"],
      },
      {
        questionId: lifeStageQuestion.id,
        optionText: "Newly Employed",
        outcomeTagId: createdTags["career_development"],
      },
      {
        questionId: lifeStageQuestion.id,
        optionText: "Graduating Student",
        outcomeTagId: createdTags["student"],
      },
    ]);

    console.log("✅ Created 3 answer options for life stage question");

    // Insert Priorities question
    const [prioritiesQuestion] = await db
      .insert(onboardingQuestions)
      .values({
        question: "What do you want to work on first?",
        category: "priorities",
        status: "accepted",
      })
      .$returningId();

    console.log(
      `✅ Created priorities question with ID: ${prioritiesQuestion.id}`,
    );

    // Insert answer options for Priorities question
    await db.insert(answerOptions).values([
      {
        questionId: prioritiesQuestion.id,
        optionText: "Government IDs",
        outcomeTagId: createdTags["gov_guides"],
      },
      {
        questionId: prioritiesQuestion.id,
        optionText: "Find a Job",
        outcomeTagId: createdTags["job_search"],
      },
      {
        questionId: prioritiesQuestion.id,
        optionText: "Resume Making",
        outcomeTagId: createdTags["resume"],
      },
      {
        questionId: prioritiesQuestion.id,
        optionText: "Cover Letter",
        outcomeTagId: createdTags["cover_letter"],
      },
      {
        questionId: prioritiesQuestion.id,
        optionText: "Just Exploring",
        outcomeTagId: createdTags["general"],
      },
      {
        questionId: prioritiesQuestion.id,
        optionText: "Document Storage",
        outcomeTagId: createdTags["filebox"],
      },
    ]);

    console.log("✅ Created 6 answer options for priorities question");
    console.log("✅ Onboarding questions seeded successfully");
  } catch (error: any) {
    if (error.code === "ER_DUP_ENTRY") {
      console.log("ℹ️  Onboarding questions already exist, skipping...");
    } else {
      console.error("❌ Error seeding onboarding questions:", error);
      throw error;
    }
  }
}
