-- CreateTable
CREATE TABLE `StudentInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `branchName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubjectInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subjectName` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `facultyId` INTEGER NOT NULL,
    `academicId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentonSubject` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `studentId` INTEGER NOT NULL,
    `subjectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AcademicInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `class` VARCHAR(191) NOT NULL,
    `semester` VARCHAR(191) NOT NULL,
    `academicYear` VARCHAR(191) NOT NULL,
    `studentId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Attendance` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dateoflecture` DATETIME(3) NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `studentId` INTEGER NOT NULL,
    `subjectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FacultyInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `department` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SubjectInfo` ADD CONSTRAINT `SubjectInfo_facultyId_fkey` FOREIGN KEY (`facultyId`) REFERENCES `FacultyInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubjectInfo` ADD CONSTRAINT `SubjectInfo_academicId_fkey` FOREIGN KEY (`academicId`) REFERENCES `AcademicInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentonSubject` ADD CONSTRAINT `StudentonSubject_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `StudentInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentonSubject` ADD CONSTRAINT `StudentonSubject_subjectId_fkey` FOREIGN KEY (`subjectId`) REFERENCES `SubjectInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AcademicInfo` ADD CONSTRAINT `AcademicInfo_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `StudentInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `StudentInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Attendance` ADD CONSTRAINT `Attendance_subjectId_fkey` FOREIGN KEY (`subjectId`) REFERENCES `SubjectInfo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
