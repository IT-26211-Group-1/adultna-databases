import "dotenv/config";
import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";
import { users } from "../db/users.js";
import { userRoles } from "../db/userRoles.js";
import { roles } from "../db/roles.js";
import { eq } from "drizzle-orm";
import { randomUUID } from "crypto";

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

export async function seedAdminUsers() {
  const db = await getDbConnection();

  console.log("Seeding admin users...");

  const allRoles = await db.select().from(roles);
  const technicalAdminRole = allRoles.find(
    (r) => r.roleName === "technical_admin"
  );
  const verifierAdminRole = allRoles.find(
    (r) => r.roleName === "verifier_admin"
  );

  if (!technicalAdminRole || !verifierAdminRole) {
    console.error("❌ Required roles not found. Run role seeder first.");
    return;
  }

  const defaultPassword =
    "$2b$12$SwPH1BHsl0v6.k965eGKt.10b.a.lXVCBSg5RLi9hEDGMZ4//3cR.";

  const adminAccounts = [
    {
      id: randomUUID(),
      email: "admin@gmail.com",
      roleId: technicalAdminRole.id,
      roleName: "technical_admin",
    },
    {
      id: randomUUID(),
      email: "verifier@gmail.com",
      roleId: verifierAdminRole.id,
      roleName: "verifier_admin",
    },
  ];

  for (const account of adminAccounts) {
    const existingUser = await db
      .select()
      .from(users)
      .where(eq(users.email, account.email));

    if (existingUser.length === 0) {
      await db.insert(users).values({
        id: account.id,
        email: account.email,
        password: defaultPassword,
        emailVerified: true,
        acceptedTerms: true,
        status: "active",
      });

      await db.insert(userRoles).values({
        userId: account.id,
        roleId: account.roleId,
      });

      console.log(`✓ Created ${account.roleName}: ${account.email}`);
    } else {
      console.log(`⊘ User already exists: ${account.email}`);
    }
  }

  console.log("✅ Admin users seeded");
}
