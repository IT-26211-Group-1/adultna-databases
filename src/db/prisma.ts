import { PrismaClient } from "@prisma/client";
import { getDbCredentials } from "../lib/secretsManager";

let prisma: PrismaClient | null = null;

export async function getPrismaClient() {
  if (prisma) return prisma;

  const secretName = process.env.DB_SECRET_NAME!;
  const region = process.env.AWS_REGION!;

  const { host, username, password, port, dbname } = await getDbCredentials(
    secretName,
    region
  );

  process.env.DATABASE_URL = `mysql://${username}:${encodeURIComponent(
    password
  )}@${host}:${port}/${dbname}`;

  prisma = new PrismaClient();
  await prisma.$connect();

  return prisma;
}
