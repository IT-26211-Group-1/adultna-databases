import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { features } from "../db/features.js";

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

export async function seedFeatures() {
  const db = await getDbConnection();
  console.log("Seeding features...");

  const allFeatures = [
    { id: "1", name: "dashboard" as const, description: "Overview / Dashboard" },
    { id: "2", name: "roadmap" as const, description: "Roadmap" },
    { id: "3", name: "ai_gabay_agent" as const, description: "AI Gabay Agent" },
    { id: "4", name: "gov_guides" as const, description: "GovGuides" },
    { id: "5", name: "filebox" as const, description: "Adulting Filebox" },
    { id: "6", name: "resume_builder" as const, description: "Resume Builder" },
    { id: "7", name: "cover_letter" as const, description: "Cover Letter Helper" },
    { id: "8", name: "mock_interview_coach" as const, description: "Mock Interview Coach" },
    { id: "9", name: "job_board" as const, description: "Job Board" },
    { id: "10", name: "profile" as const, description: "Profile Settings" },
    { id: "11", name: "general" as const, description: "General / Other" },
  ];

  const existing = await db.select().from(features);
  const existingNames = new Set(existing.map((f) => f.name));

  const newFeatures = allFeatures.filter((f) => !existingNames.has(f.name));

  if (newFeatures.length > 0) {
    await db.insert(features).values(newFeatures);
    console.log(
      `✓ Created ${newFeatures.length} new features:`,
      newFeatures.map((f) => f.name).join(", ")
    );
  } else {
    console.log("⊘ All features already exist");
  }

  console.log("✅ Features seeded");
}
