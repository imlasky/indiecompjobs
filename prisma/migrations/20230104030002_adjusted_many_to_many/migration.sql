/*
  Warnings:

  - You are about to drop the column `jobId` on the `Location` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_jobId_fkey";

-- AlterTable
ALTER TABLE "Location" DROP COLUMN "jobId";

-- CreateTable
CREATE TABLE "_JobToLocation" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_JobToLocation_AB_unique" ON "_JobToLocation"("A", "B");

-- CreateIndex
CREATE INDEX "_JobToLocation_B_index" ON "_JobToLocation"("B");

-- AddForeignKey
ALTER TABLE "_JobToLocation" ADD CONSTRAINT "_JobToLocation_A_fkey" FOREIGN KEY ("A") REFERENCES "Job"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobToLocation" ADD CONSTRAINT "_JobToLocation_B_fkey" FOREIGN KEY ("B") REFERENCES "Location"("id") ON DELETE CASCADE ON UPDATE CASCADE;
