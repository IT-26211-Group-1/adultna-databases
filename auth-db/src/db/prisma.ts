import { PrismaClient } from "@prisma/client";

let prisma: PrismaClient | null = null;

export async function getPrismaClient() {
  if (prisma) return prisma;

  process.env.DATABASE_URL;

  prisma = new PrismaClient();
  await prisma.$connect();

  return prisma;
}
