-- CreateEnum
CREATE TYPE "MovementType" AS ENUM ('INBOUND', 'PROD_CONSUME', 'PROD_OUTPUT', 'SCRAP', 'OUTBOUND_EXPORT', 'OUTBOUND_LOCAL');

-- CreateEnum
CREATE TYPE "TaxStatus" AS ENUM ('DITANGGUHKAN', 'DIBEBASKAN', 'DIBAYAR');

-- CreateTable
CREATE TABLE "stock_movements" (
    "id" BIGSERIAL NOT NULL,
    "item_id" INTEGER NOT NULL,
    "movement_type" "MovementType" NOT NULL,
    "qty" DECIMAL(14,4) NOT NULL,
    "customs_doc_id" INTEGER,
    "batch_id" INTEGER,
    "tax_status" "TaxStatus",
    "moved_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "stock_movements_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "stock_movements_item_id_moved_at_idx" ON "stock_movements"("item_id", "moved_at");

-- AddForeignKey
ALTER TABLE "stock_movements" ADD CONSTRAINT "stock_movements_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock_movements" ADD CONSTRAINT "stock_movements_customs_doc_id_fkey" FOREIGN KEY ("customs_doc_id") REFERENCES "customs_documents"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock_movements" ADD CONSTRAINT "stock_movements_batch_id_fkey" FOREIGN KEY ("batch_id") REFERENCES "production_batches"("id") ON DELETE SET NULL ON UPDATE CASCADE;
