//import "dotenv/config";
import fastify from "fastify";
import cors from "@fastify/cors";
import { stockRoutes } from "./routes/stock";
import jwt from "@fastify/jwt";

import { resolve } from "node:path";
const app = fastify();

app.register(cors, {
  origin: true,
});

app.register(stockRoutes);

app.register(jwt, {
  secret: "spacetime",
});

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log("HTTP Server is running on port http://localhost:3333");
  });
