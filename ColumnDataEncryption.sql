
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'BusDatabase';

CREATE CERTIFICATE PassCert
WITH SUBJECT = 'Transparent Data Encryption for Passenger Table';

CREATE SYMMETRIC KEY PassSymKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE PassCert;

OPEN SYMMETRIC KEY PassSymKey
DECRYPTION BY CERTIFICATE PassCert;

Select * from Passenger

-- Encrytping the password field ---
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'PasswordJohnDoe')) WHERE Passenger_ID=1;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'PasswordJaneDoe123')) WHERE Passenger_ID=2;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'PasswordBobJ@345')) WHERE Passenger_ID=3;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'PasswordSaraLee')) WHERE Passenger_ID=4;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'Tomj@123')) WHERE Passenger_ID=5;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'MariaG123')) WHERE Passenger_ID=6;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'DavidJones123')) WHERE Passenger_ID=7;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'LucyS12345')) WHERE Passenger_ID=8;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'Password@123')) WHERE Passenger_ID=9;
UPDATE Passenger set  [password] = EncryptByKey(Key_GUID('PassSymKey'), CONVERT(varchar, 'Pass123')) WHERE Passenger_ID=10;

Select * from Passenger

Select [passenger_id],
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