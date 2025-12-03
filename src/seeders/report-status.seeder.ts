import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { reportStatus } from "../db/reportStatus.js";

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

export async function seedReportStatus() {
  const db = await getDbConnection();
  console.log("Seeding report status...");

  const existing = await db.select().from(reportStatus);
  if (existing.length === 0) {
    await db.insert(reportStatus).values([
      { id: "1", name: "pending" },
      { id: "2", name: "resolved" },
    ]);
    console.log("✓ Created report statuses: pending, resolved");
  } else {
    console.log("⊘ Report status already exist");
  }

  console.log("✅ Report status seeded");
}
