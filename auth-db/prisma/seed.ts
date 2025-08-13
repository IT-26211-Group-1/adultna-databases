import { getPrismaClient } from "../src/db/prisma";

async function initRoles() {
  let prisma;
  const roles = ["User", "Verifier Admin", "Technical Admin"];

  try {
    prisma = await getPrismaClient();

    for (const roleName of roles) {
      await prisma.role.upsert({
        where: { roleName },
        update: {},
        create: { roleName },
      });
    }
  } catch (error) {
    console.error("An error occurred during database initialization:", error);
  } finally {
    if (prisma) {
      await prisma.$disconnect();
    }
  }
}

initRoles();
