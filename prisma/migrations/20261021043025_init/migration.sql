-- CreateTable
CREATE TABLE "hs_codes" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(12) NOT NULL,
    "description" TEXT,
    "bm_rate" DECIMAL(5,2) NOT NULL,
    "ppn_rate" DECIMAL(5,2) NOT NULL,
    "pph22_rate" DECIMAL(5,2) NOT NULL,

    CONSTRAINT "hs_codes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "hs_codes_code_key" ON "hs_codes"("code");
