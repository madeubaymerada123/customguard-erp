-- CreateEnum
CREATE TYPE "ItemType" AS ENUM ('RAW', 'FG', 'SCRAP');

-- CreateTable
CREATE TABLE "items" (
    "id" SERIAL NOT NULL,
    "sku" VARCHAR(50) NOT NULL,
    "name" TEXT NOT NULL,
    "item_type" "ItemType" NOT NULL,
    "uom" VARCHAR(10) NOT NULL,
    "hs_code_id" INTEGER,

    CONSTRAINT "items_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "items_sku_key" ON "items"("sku");

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_hs_code_id_fkey" FOREIGN KEY ("hs_code_id") REFERENCES "hs_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
