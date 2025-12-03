import { seedRoles } from "./roles.seeder.js"; // note the .js extension
import { seedAdminUsers } from "./admin-users.seeder.js";
import { seedReportStatus } from "./report-status.seeder.js";

async function runAllSeeders() {
  console.log("🌱 Starting database seeding...\n");

  await seedRoles();
  await seedReportStatus();
  await seedAdminUsers();

  console.log("\n✅ All seeding completed");
}

// Run immediately
runAllSeeders()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error("💥 Seeding failed:", err);
    process.exit(1);
  });
