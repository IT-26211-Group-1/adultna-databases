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

  const existing = await db.select().from(features);
  if (existing.length === 0) {
    await db.insert(features).values([
      { id: "1", name: "govmap" },
      { id: "2", name: "filebox" },
      { id: "3", name: "process_guides" },
      { id: "4", name: "ai_gabay_agent" },
      { id: "5", name: "mock_interview_coach" },
    ]);
    console.log(
      "✓ Created features: govmap, filebox, process_guides, ai_gabay_agent, mock_interview_coach"
    );
  } else {
    console.log("⊘ Features already exist");
  }

  console.log("✅ Features seeded");
}
