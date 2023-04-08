USE [FinalProject]
GO

-- Check for seating capacity greater than 0

ALTER TABLE [dbo].[Bus]
ADD CHECK (Seating_capacity > 0)

-- Check for distance AND hours greater than 0

ALTER TABLE [dbo].[Route]
ADD CONSTRAINT CHK_ROUTE CHECK (distance > 0 AND hours > 0)
 
---- Check for Ticket price must be greater than 0

ALTER TABLE [dbo].[Ticket]
ADD CHECK (price > 0)

-- Check for zip code, phone number and email id format should be correct

ALTER TABLE [dbo].[Passenger]
ADD CONSTRAINT chk_zipcode CHECK (LEN(zipcode) = 5),
ADD CONSTRAINT Ph_len_chk CHECK  (len([phone])=10),
ADD CONSTRAINT email_chk CHECK (emailid LIKE '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'), 

-- Check for feedback rating must be in 1 to 5

ALTER TABLE [dbo].[feedback] 
ADD CONSTRAINT CHK_Rating CHECK (rating >= 1 AND rating <= 5);