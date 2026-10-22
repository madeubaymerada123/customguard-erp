const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const hsKain = await prisma.hsCode.upsert({
    where: { code: "5208.11" },
    update: {},
    create: { code: "5208.11", description: "ini adalah kain", bmRate: 10, ppnRate: 11, pph22Rate: 2.5 },
  });

  const hsKancing = await prisma.hsCode.upsert({
    where: { code: "9606.21" },
    update: {},
    create: { code: "9606.21", description: "ini adalah kancing", bmRate: 10, ppnRate: 11, pph22Rate: 2.5 },
  });

  const hsBaju = await prisma.hsCode.upsert({
     where: { code: "6205.20" },
    update: {},
    create: { code: "6205.20", description: "ini adalah baju", bmRate: 25, ppnRate: 11, pph22Rate: 2.5 },
  });
}

main()
  .catch((e) => {console.error(e); process.exit(1); })
  .finally(() => prisma.$disconnect());