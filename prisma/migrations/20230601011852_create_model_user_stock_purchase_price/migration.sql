-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "login" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "avatarUrl" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME
);

-- CreateTable
CREATE TABLE "Stock" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "stock" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PurchaseTable" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userId" TEXT NOT NULL,
    "stockID" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "datePurchase" DATETIME NOT NULL,
    "quantity" INTEGER NOT NULL,
    CONSTRAINT "PurchaseTable_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PurchaseTable_stockID_fkey" FOREIGN KEY ("stockID") REFERENCES "Stock" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PriceActual" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "stockID" TEXT NOT NULL,
    "actualPrice" REAL NOT NULL,
    "dateUpdate" DATETIME NOT NULL,
    CONSTRAINT "PriceActual_stockID_fkey" FOREIGN KEY ("stockID") REFERENCES "Stock" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
