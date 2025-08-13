import {
  SecretsManagerClient,
  GetSecretValueCommand,
} from "@aws-sdk/client-secrets-manager";

export async function getDbCredentials(secretName: string, region: string) {
  const client = new SecretsManagerClient({ region });
  const command = new GetSecretValueCommand({ SecretId: secretName });
  const response = await client.send(command);

  if (!response.SecretString) throw new Error("Secret is empty");

  return JSON.parse(response.SecretString) as {
    host: string;
    username: string;
    password: string;
    port: number;
    dbname: string;
  };
}
