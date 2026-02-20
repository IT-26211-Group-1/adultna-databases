import { seedRoles } from "./roles.seeder.js"; // note the .js extension
import { seedAdminUsers } from "./admin-users.seeder.js";
import { seedReportStatus } from "./report-status.seeder.js";
import { seedFeatures } from "./features.seeder.js";
import { seedOnboardingQuestions } from "./onboarding-questions.seeder.js";

async function runAllSeeders() {
  console.log("🌱 Starting database seeding...\n");

  await seedRoles();
  await seedFeatures();
  await seedReportStatus();
  await seedAdminUsers();
  await seedOnboardingQuestions();

  console.log("\n✅ All seeding completed");
}

// Run immediately
runAllSeeders()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error("💥 Seeding failed:", err);
    process.exit(1);
  });
