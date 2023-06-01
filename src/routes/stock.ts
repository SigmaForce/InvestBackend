import { FastifyInstance } from "fastify";
import { z } from "zod";
import { prisma } from "../lib/prisma";

export async function stockRoutes(app: FastifyInstance) {
  app.get("/stock", async (request) => {
    const memories = await prisma.stock.findMany();
    console.log(memories);
    return memories.map((memory) => {
      return {
        id: memory.id,
        nome: memory.nome,
        stock: memory.stock,
      };
    });
  });
}
