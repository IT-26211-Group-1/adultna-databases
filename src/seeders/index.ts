import { seedRoles } from "./roles.seeder.js";

async function runAllSeeders() {
  try {
    // Run roles seeder
    await seedRoles();
  } catch (error) {
    console.error("\n💥 Seeding process failed:", error);
    throw error;
  }
}

// Main execution
async function main() {
  try {
    await runAllSeeders();
    process.exit(0);
  } catch (error) {
    console.error("Database seeding failed:", error);
    process.exit(1);
  }
}

// Run if this is the main module
if (require.main === module) {
  main();
}

export { runAllSeeders };
