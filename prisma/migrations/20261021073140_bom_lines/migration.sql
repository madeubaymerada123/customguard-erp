-- CreateTable
CREATE TABLE "bom_lines" (
    "id" SERIAL NOT NULL,
    "fg_item_id" INTEGER NOT NULL,
    "raw_item_id" INTEGER NOT NULL,
    "qty_per_unit" DECIMAL(12,4) NOT NULL,
    "scrap_pct" DECIMAL(5,2) NOT NULL DEFAULT 0,

    CONSTRAINT "bom_lines_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "bom_lines_fg_item_id_raw_item_id_key" ON "bom_lines"("fg_item_id", "raw_item_id");

-- AddForeignKey
ALTER TABLE "bom_lines" ADD CONSTRAINT "bom_lines_fg_item_id_fkey" FOREIGN KEY ("fg_item_id") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bom_lines" ADD CONSTRAINT "bom_lines_raw_item_id_fkey" FOREIGN KEY ("raw_item_id") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
