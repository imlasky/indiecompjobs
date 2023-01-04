-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_id_fkey";

-- AlterTable
ALTER TABLE "Location" ADD COLUMN     "jobId" TEXT;

-- AddForeignKey
ALTER TABLE "Location" ADD CONSTRAINT "Location_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;
