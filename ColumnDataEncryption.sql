ALTER TABLE dbo.Passenger
ADD [username] [varchar](50),
    [password] [varbinary](400);

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'BusDatabase';

CREATE CERTIFICATE PassCert
WITH SUBJECT = 'Transparent Data Encryption for Passenger Table';

CREATE SYMMETRIC KEY PassSymKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE PassCert;

OPEN SYMMETRIC KEY PassSymKey
DECRYPTION BY CERTIFICATE PassCert;

UPDATE dbo.Passenger
SET [username] = 'lname',
    [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varbinary, 'Password123'));

SELECT [passenger_id],
       [fname],
       [lname],
       [address],
       [street_name],
       [city],
       [state],
       [country],
       [zipcode],
       [phone],
       [emailid],
       [dob],
       [gender],
       [username],
       CONVERT(varchar, DecryptByKey([password])) AS 'Decrypted Password'
FROM dbo.Passenger;