IF OBJECT_ID('USERACCOUNT') IS NOT NULL DROP TABLE USERACCOUNT;
IF OBJECT_ID('GAME') IS NOT NULL DROP TABLE GAME;
IF OBJECT_ID('GAMESEQ') IS NOT NULL DROP SEQUENCE GAMESEQ;
IF OBJECT_ID('ADD_USER') IS NOT NULL DROP PROCEDURE ADD_USER;
IF OBJECT_ID('VIEW_USER') IS NOT NULL DROP PROCEDURE VIEW_USER;
IF OBJECT_ID('VIEW_USERS') IS NOT NULL DROP PROCEDURE VIEW_USERS;
IF OBJECT_ID('ADD_GAME') IS NOT NULL DROP PROCEDURE ADD_GAME;
IF OBJECT_ID('END_GAME') IS NOT NULL DROP PROCEDURE END_GAME;
IF OBJECT_ID('VIEW_GAMES') IS NOT NULL DROP PROCEDURE VIEW_GAMES;
GO

CREATE TABLE USERACCOUNT(
USERNAME  NVARCHAR(100)
, PASSWORD  NVARCHAR(100)
, ROLE NVARCHAR(100)
, PRIMARY KEY(USERNAME)
);

CREATE TABLE GAME(
    GAMEID INT
    ,GAMEVENUE NVARCHAR(100)
    ,GAMEDATE NVARCHAR(100)
    ,GAMEtIME NVARCHAR(100)
    ,GAMEENDED NVARCHAR(2)
    ,GAMECOST INT
    ,USERNAME NVARCHAR(100)
    ,PRIMARY KEY(GAMEID)
)
CREATE SEQUENCE GAMESEQ START WITH 1 INCREMENT BY 1
GO

CREATE PROCEDURE ADD_USER @PUSERNAME NVARCHAR(100),@PPASSWORD NVARCHAR(100) AS   
BEGIN TRY
BEGIN TRANSACTION ADD_USER
IF @PUSERNAME = (SELECT USERNAME FROM UserAccount WHERE USERNAME = @PUSERNAME)
THROW 5001,'account with that username already exists',1
ELSE
INSERT INTO USERACCOUNT(USERNAME,PASSWORD,ROLE) VALUES (@PUSERNAME,@PPASSWORD,'MEMBER')
COMMIT TRANSACTION ADD_USER
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION ADD_USER
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO
CREATE PROCEDURE VIEW_USER @PUSERNAME NVARCHAR(100) AS 
BEGIN TRY
BEGIN TRANSACTION VIEW_USER
IF (SELECT USERNAME FROM USERACCOUNT WHERE USERNAME = @PUSERNAME) IS NULL
THROW 5002, 'user not found',1
SELECT * FROM USERACCOUNT WHERE USERNAME = @PUSERNAME
COMMIT TRANSACTION VIEW_USER
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION VIEW_USER
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO

CREATE PROCEDURE VIEW_USERS AS 
BEGIN TRY
BEGIN TRANSACTION VIEW_USERS
SELECT * FROM USERACCOUNT
COMMIT TRANSACTION VIEW_USERS
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION VIEW_USERS
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO

CREATE PROCEDURE ADD_GAME @PVENUE NVARCHAR(100),@PDATE NVARCHAR(100) ,@PTIME NVARCHAR(100) AS   
BEGIN TRY
BEGIN TRANSACTION ADD_GAME
DECLARE @PID INT
SET @PID = NEXT VALUE FOR GAMESEQ
INSERT INTO GAME(GAMEID,GAMEVENUE,GAMEDATE,GAMEtIME,GAMECOST,GAMEENDED,USERNAME) VALUES (@PID,@PVENUE,@PDATE,@PTIME,0,'N','')
COMMIT TRANSACTION ADD_GAME
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION ADD_GAME
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO

CREATE PROCEDURE END_GAME @PGAMEID NVARCHAR(100),@PCOST INT AS   
BEGIN TRY
BEGIN TRANSACTION END_GAME
IF (SELECT GAMEENDED FROM GAME WHERE GAMEID = @PGAMEID) = 'Y'
THROW 5005, 'shout already ended',1
else
UPDATE GAME SET GAMEENDED='Y',GAMECOST=@PCOST WHERE GAMEID = @PGAMEID
COMMIT TRANSACTION END_GAME
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION END_GAME
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO

CREATE PROCEDURE VIEW_GAMES AS 
BEGIN TRY
BEGIN TRANSACTION VIEW_GAMES
SELECT * FROM GAME WHERE GAMEENDED ='N' 
COMMIT TRANSACTION VIEW_GAMES
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION VIEW_GAMES
DECLARE @ERRORMESSAGE NVARCHAR(MAX) = ERROR_MESSAGE();
DECLARE @ERRORNUMBER INT = ERROR_NUMBER();
THROW @ERRORNUMBER, @ERRORMESSAGE, 1
END CATCH;

GO

EXECUTE ADD_GAME 'NOWHERE','27/11/2020','9:21am'
SELECT * FROM GAME
INSERT INTO USERACCOUNT(USERNAME,PASSWORD,ROLE) VALUES ('USER1','PASSWORD','manager')