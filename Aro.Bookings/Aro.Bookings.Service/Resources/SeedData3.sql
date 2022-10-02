/*
	Initial data seeding; meant to be called while startup
*/

USE Bookings
GO

DELETE FROM Feature WHERE [Name] IN ('Travel Sustainable Property', 'Managed by a private host', '50 m from center', '500 m from center')

DECLARE @Hotel_CharingCross uniqueidentifier,			@Hotel_JurysInnGalway uniqueidentifier,				@Hotel_TheHendrickSmithfieldOpens uniqueidentifier,
@Hotel_Blooms uniqueidentifier,							@Hotel_DonegalEstuaryHoliday uniqueidentifier,		@Hotel_Flannery uniqueidentifier,
@Hotel_TrinityCity uniqueidentifier,					@Hotel_DunmillApartment uniqueidentifier,			@Hotel_Number53 uniqueidentifier,
@Hotel_MarlinStephensGreen uniqueidentifier,			@Hotel_GraftonStreetStudios uniqueidentifier,		@Hotel_EddieCottage uniqueidentifier,
@Hotel_ClybaunHotel uniqueidentifier,					@Hotel_GalwayCityHostel uniqueidentifier;

DECLARE @Feature_TravelSustainableproperty uniqueidentifier = NEWID(),										@Feature_500mFromCenter	uniqueidentifier = NEWID(),
@Feature_ManagedPrivateHost	uniqueidentifier = NEWID(),	@Feature_50MFromCenter uniqueidentifier = NEWID()

SELECT @Hotel_CharingCross = Id FROM HOTEL WHERE [Name] = 'Charing Cross Hotel'
SELECT @Hotel_JurysInnGalway = Id FROM HOTEL WHERE [Name] = 'Jurys Inn Galway'
SELECT @Hotel_TheHendrickSmithfieldOpens = Id FROM HOTEL WHERE [Name] = 'The Hendrick Smithfield'
SELECT @Hotel_Blooms = Id FROM HOTEL WHERE [Name] = 'Blooms Hotel'
SELECT @Hotel_DonegalEstuaryHoliday = Id FROM HOTEL WHERE [Name] = 'Donegal Estuary Holiday Homes'
SELECT @Hotel_Flannery = Id FROM HOTEL WHERE [Name] = 'Flannerys Hotel'
SELECT @Hotel_TrinityCity = Id FROM HOTEL WHERE [Name] = 'Trinity City Hotel'
SELECT @Hotel_DunmillApartment = Id FROM HOTEL WHERE [Name] = 'Dunmill Apartment'
SELECT @Hotel_Number53 = Id FROM HOTEL WHERE [Name] = 'Number 53'
SELECT @Hotel_MarlinStephensGreen = Id FROM HOTEL WHERE [Name] = 'Marlin Hotel Stephens Green'
SELECT @Hotel_GraftonStreetStudios = Id FROM HOTEL WHERE [Name] = 'Grafton Street Studios'
SELECT @Hotel_EddieCottage = Id FROM HOTEL WHERE [Name] = 'Eddie''s Cottage'
SELECT @Hotel_ClybaunHotel = Id FROM HOTEL WHERE [Name] = 'Clybaun Hotel'
SELECT @Hotel_GalwayCityHostel = Id FROM HOTEL WHERE [Name] = 'Galway City Hostel'

INSERT INTO Feature (Id, [Name], [Key], HotelFeature)
SELECT Id, [Name], [Key], HotelFeature
FROM (VALUES (
	@Feature_TravelSustainableproperty, 'Travel Sustainable Property', 0, 1
),
(
	@Feature_ManagedPrivateHost, 'Managed by a private host', 0, 1
),
(
	@Feature_50MFromCenter, '50 m from center', 0, 1
),
(
	@Feature_500mFromCenter, '500 m from center', 0, 1
)) AS v(Id, [Name], [Key], HotelFeature)

INSERT INTO HotelFeature(Id, HotelId, FeatureId)
SELECT Id, HotelId, FeatureId
FROM (VALUES (
	NEWID(), @Hotel_CharingCross, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_JurysInnGalway, @Feature_ManagedPrivateHost
),
(
	NEWID(), @Hotel_JurysInnGalway, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_TheHendrickSmithfieldOpens, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_Blooms, @Feature_50MFromCenter
),
(
	NEWID(), @Hotel_DonegalEstuaryHoliday, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_Flannery, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_TrinityCity, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_DunmillApartment, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_Number53, @Feature_500mFromCenter
),
(
	NEWID(), @Hotel_MarlinStephensGreen, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_GraftonStreetStudios, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_GraftonStreetStudios, @Feature_500mFromCenter
),
(
	NEWID(), @Hotel_EddieCottage, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_ClybaunHotel, @Feature_TravelSustainableproperty
),
(
	NEWID(), @Hotel_GalwayCityHostel, @Feature_TravelSustainableproperty
)) AS v(Id, HotelId, FeatureId)