-- CreateTable
CREATE TABLE "customs_documents" (
    "id" SERIAL NOT NULL,
    "doc_type" VARCHAR(10) NOT NULL,
    "doc_number" VARCHAR(50) NOT NULL,
    "doc_date" DATE NOT NULL,

    CONSTRAINT "customs_documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "production_batches" (
    "id" SERIAL NOT NULL,
    "fg_item_id" INTEGER NOT NULL,
    "qty_produced" DECIMAL(12,2) NOT NULL,
    "produced_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "production_batches_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "customs_documents_doc_number_key" ON "customs_documents"("doc_number");

-- AddForeignKey
ALTER TABLE "production_batches" ADD CONSTRAINT "production_batches_fg_item_id_fkey" FOREIGN KEY ("fg_item_id") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
