import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { roles } from "../db/roles.js"; // adjust path if needed

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

export async function seedRoles() {
  // ✅ must be exported
  const db = await getDbConnection();
  const existing = await db.select().from(roles);
  if (existing.length === 0) {
    await db
      .insert(roles)
      .values([
        { roleName: "user" },
        { roleName: "technical_admin" },
        { roleName: "verifier_admin" },
      ]);
  }
}
