import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { roles } from "../db/roles.js";

// Database connection
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

// Seed data for roles
const rolesData = [
  { roleName: "user" },
  { roleName: "technical_admin" },
  { roleName: "verifier_admin" },
];

export async function seedRoles() {
  try {
    const db = await getDbConnection();

    const existingRoles = await db.select().from(roles);

    if (existingRoles.length > 0) {
      return;
    }

    // Insert seed roles
    await db.insert(roles).values(rolesData);
  } catch (error) {
    console.error("Error seeding roles:", error);
    throw error;
  }
}

// Main execution
async function main() {
  try {
    await seedRoles();
    process.exit(0);
  } catch (error) {
    console.error("Roles seeding failed:", error);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}
