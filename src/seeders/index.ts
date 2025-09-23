import { seedRoles } from "./roles.seeder.js"; // note the .js extension

async function runAllSeeders() {
  await seedRoles();
  console.log("✅ Seeding completed");
}

// Run immediately
runAllSeeders()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error("💥 Seeding failed:", err);
    process.exit(1);
  });
