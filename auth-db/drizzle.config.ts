import "dotenv/config";
import { defineConfig } from "drizzle-kit";

export default defineConfig({
  out: "./drizzle",
  schema: "./src/db/*.ts",
  dialect: "mysql",
  dbCredentials: {
    host: "127.0.0.1",
    port: 3307,
    user: "admin",
    password: "lRAl&6VCI*848fU}lVYy9q;Xr]TSwM!.",
    database: "auth_db",
  },
});
