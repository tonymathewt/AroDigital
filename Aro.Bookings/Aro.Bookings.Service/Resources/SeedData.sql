/*
	Initial data seeding; meant to be called while startup
*/

USE Bookings
GO

DELETE FROM Choice
DELETE FROM Feature
DELETE FROM RoomType
DELETE FROM Hotel

DECLARE @Choice_Good_BF uniqueidentifier = NEWID(),				@Choice_NO_Prepayment uniqueidentifier = NEWID(),				@Choice_Good_BFIncluded uniqueidentifier = NEWID(),
	@FreeCancellationUntilDayBefore uniqueidentifier = NEWID(),

	@Feature_Wifi uniqueidentifier = NEWID(),
	@Feature_Flatscreen uniqueidentifier = NEWID(),				@Feature_PrivateBathroom uniqueidentifier = NEWID(),			@Feature_Coffeemachine uniqueidentifier = NEWID(),
	@Feature_Freetoiletries uniqueidentifier = NEWID(),			@Feature_Hardwood uniqueidentifier = NEWID(),					@Feature_Ironing uniqueidentifier = NEWID(),
	@Feature_Microwave uniqueidentifier = NEWID(),				@Feature_Cablechannels uniqueidentifier = NEWID(),				@Feature_Toaster uniqueidentifier = NEWID(),
	@Feature_Diningarea uniqueidentifier = NEWID(),				@Feature_UpperfloorsByElevator uniqueidentifier = NEWID(),		@Feature_Toiletpaper uniqueidentifier = NEWID(),
	@Feature_Refrigerator uniqueidentifier = NEWID(),			@Feature_SocketNearBed uniqueidentifier = NEWID(),				@Feature_Clothesrack uniqueidentifier = NEWID(),	

	@RoomType_DoubleSharedBath uniqueidentifier = NEWID(),		@RoomType_StandardTwinSharedBath uniqueidentifier = NEWID(),	@RoomType_DoublePrivateBath uniqueidentifier = NEWID(),
	@RoomType_TwinPrivateBath uniqueidentifier = NEWID(),		@RoomType_FamilyPrivateBath uniqueidentifier = NEWID(),			@RoomType_FamilySharedBath uniqueidentifier = NEWID(),
	@RoomType_QuadruplePrivateBath uniqueidentifier = NEWID(),	@RoomType_King uniqueidentifier = NEWID(),						@RoomType_LoftStudio uniqueidentifier = NEWID(),
	@RoomType_SuperiorStudio uniqueidentifier = NEWID(),		@RoomType_SuperiorTwin uniqueidentifier = NEWID(),				@RoomType_DeluxeDouble uniqueidentifier = NEWID(),
	@RoomType_DeluxeTwin uniqueidentifier = NEWID(),			@RoomType_DeluxeDoubleSingle uniqueidentifier = NEWID(),		@RoomType_ExecutiveKing uniqueidentifier = NEWID(),
	@RoomType_ExecutiveDoubleDouble uniqueidentifier = NEWID(),	@RoomType_DeluxeKing uniqueidentifier = NEWID(),				@RoomType_Double uniqueidentifier = NEWID(),
	@RoomType_TwinRoom uniqueidentifier = NEWID(),				@RoomType_DoubleBunkBed uniqueidentifier = NEWID(),				@RoomType_DoubleDisabilityAccess uniqueidentifier = NEWID(),
	@RoomType_CozyKing uniqueidentifier = NEWID(),
	
	@Room_DoubleSharedBath uniqueidentifier = NEWID(),			@Room_StandardTwinSharedBath uniqueidentifier = NEWID(),		@Room_DoublePrivateBath uniqueidentifier = NEWID(),
	@Room_TwinPrivateBath uniqueidentifier = NEWID(),			@Room_FamilyPrivateBath uniqueidentifier = NEWID(),				@Room_FamilySharedBath uniqueidentifier = NEWID(),
	@Room_QuadruplePrivateBath uniqueidentifier = NEWID(),		@Room_King uniqueidentifier = NEWID(),							@Room_LoftStudio uniqueidentifier = NEWID(),
	@Room_SuperiorStudio uniqueidentifier = NEWID(),			@Room_SuperiorTwin uniqueidentifier = NEWID(),					@Room_DeluxeDouble uniqueidentifier = NEWID(),
	@Room_DeluxeTwin uniqueidentifier = NEWID(),				@Room_DeluxeDoubleSingle uniqueidentifier = NEWID(),			@Room_ExecutiveKing uniqueidentifier = NEWID(),
	@Room_ExecutiveDoubleDouble uniqueidentifier = NEWID(),		@Room_DeluxeKing uniqueidentifier = NEWID(),					@Room_Double uniqueidentifier = NEWID(),
	@Room_TwinRoom uniqueidentifier = NEWID(),					@Room_DoubleBunkBed uniqueidentifier = NEWID(),					@Room_DoubleDisabilityAccess uniqueidentifier = NEWID(),
	@Room_CozyKing uniqueidentifier = NEWID(),
	
	@Hotel_CharingCross uniqueidentifier = NEWID(),				@Hotel_JurysInnGalway uniqueidentifier = NEWID(),				@Hotel_MarlinStephensGreen uniqueidentifier = NEWID(),
	@Hotel_TheHendrickSmithfieldOpens uniqueidentifier = NEWID(),																@Hotel_GraftonStreetStudios uniqueidentifier = NEWID(),
	@Hotel_Blooms uniqueidentifier = NEWID(),					@Hotel_TrinityCity uniqueidentifier = NEWID(),					@Hotel_EddieCottage uniqueidentifier = NEWID(),
	@Hotel_DonegalEstuaryHoliday uniqueidentifier = NEWID(),	@Hotel_DunmillApartment uniqueidentifier = NEWID(),				@Hotel_ClybaunHotel uniqueidentifier = NEWID(),
	@Hotel_Flannery uniqueidentifier = NEWID(),					@Hotel_Number53 uniqueidentifier = NEWID(),						@Hotel_GalwayCityHostel uniqueidentifier = NEWID();

INSERT INTO Choice (Id, [Name], DerivePromotionString)
SELECT Id, [Name], Derrive
FROM (VALUES (
	@Choice_Good_BF, 'Good breakfast', 0
),
(
	@Choice_NO_Prepayment, 'NO PREPAYMENT NEEDED – pay at the property', 0
),
(
	@Choice_Good_BFIncluded, 'Very good break fast - included', 0
),
(
	@FreeCancellationUntilDayBefore, 'FreeCancellationUntilDayBefore', 1
)) AS v(Id, [Name], Derrive)

INSERT INTO Feature (Id, [Name], [Key], HotelFeature)
SELECT Id, [Name], [Key], HotelFeature
FROM (VALUES (
	@Feature_Wifi, 'Free WiFi', 1, 0
),
(
	@Feature_Flatscreen, 'Flat-screen TV', 1, 0
),
(
	@Feature_PrivateBathroom, 'Private Bathroom', 1, 0
),
(
	@Feature_Coffeemachine, 'Coffee machine', 1, 0
),
(
	@Feature_Freetoiletries, 'Free toiletries', 0, 0
),
(
	@Feature_Hardwood, 'Hardwood or parquet floors', 0, 0
),
(
	@Feature_Ironing, 'Ironing facilities', 0, 0
),
(
	@Feature_Microwave, 'Microwave', 0, 0
),
(
	@Feature_Cablechannels, 'Cable channels', 0, 0
),
(
	@Feature_Toaster, 'Toaster', 0, 0
),
(
	@Feature_Diningarea, 'Dining area', 0, 0
),
(
	@Feature_UpperfloorsByElevator, 'Upper floors accessible by elevator', 0, 0
),
(
	@Feature_Toiletpaper, 'Toilet paper', 0, 0
),
(
	@Feature_Refrigerator, 'Refrigerator', 0, 0
),
(
	@Feature_SocketNearBed, 'Socket near the bed', 0, 0
),
(
	@Feature_Clothesrack, 'Clothes rack', 0, 0
)) AS v(Id, [Name], [Key], HotelFeature)

INSERT INTO RoomType(Id, [Name])
SELECT Id, [Name]
FROM (VALUES (
	@RoomType_DoubleSharedBath, 'Double Room with Shared Bathroom'
),
(
	@RoomType_StandardTwinSharedBath, 'Standard Twin Room with Shared Bathroom'
),
(
	@RoomType_TwinPrivateBath, 'Twin Room with Private Bathroom'
),
(
	@RoomType_FamilySharedBath, 'Family Room with Shared Bathroom'
),
(
	@RoomType_FamilyPrivateBath, 'Family Room with Private Bathroom'
),
(
	@RoomType_QuadruplePrivateBath, 'Quadruple Room with Private Bathroom'
),
(
	@RoomType_King, 'King Room'
),
(
	@RoomType_LoftStudio, 'Loft Studio'
),
(
	@RoomType_SuperiorStudio, 'Superior Studio'
),
(
	@RoomType_SuperiorTwin, 'Superior Twin Room'
),
(
	@RoomType_DeluxeDouble, 'Deluxe Double Room'
),
(
	@RoomType_DeluxeTwin, 'Deluxe Twin Room'
),
(
	@RoomType_DeluxeDoubleSingle, 'Deluxe Double & Single Room'
),
(
	@RoomType_ExecutiveKing, 'Executive King Room'
),
(
	@RoomType_ExecutiveDoubleDouble, 'Executive Double Double Room'
),
(
	@RoomType_DeluxeKing, 'Deluxe King Room'
),
(
	@RoomType_Double, 'Double Room'
),
(
	@RoomType_TwinRoom, 'Twin Room'
),
(
	@RoomType_DoubleBunkBed, 'Double with Bunk Bed'
),
(
	@RoomType_DoubleDisabilityAccess, 'Double Room - Disability Access'
),
(
	@RoomType_DoublePrivateBath, 'Double Room with Private Bath'
),
(
	@RoomType_CozyKing, 'Cozy King Room'
)
) AS v(Id, [Name])

INSERT INTO [RoomTypeBed] (Id, [RoomTypeId], [Bed], [NumberOfBeds])
SELECT Id, [RoomTypeId], [Bed], [NumberOfBeds]
FROM (VALUES (
	NEWID(), @RoomType_DoubleSharedBath, 2, 1
),
(
	NEWID(), @RoomType_StandardTwinSharedBath, 1, 2
),
(
	NEWID(), @RoomType_DoublePrivateBath, 2, 1
),
(
	NEWID(), @RoomType_TwinPrivateBath, 2, 2
),
(
	NEWID(), @RoomType_FamilyPrivateBath, 0, 1
),
(
	NEWID(), @RoomType_FamilySharedBath, 0, 1
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, 2, 2
),
(
	NEWID(), @RoomType_King, 0, 1
),
(
	NEWID(), @RoomType_LoftStudio, 1, 1
),
(
	NEWID(), @RoomType_SuperiorStudio, 1, 1
),
(
	NEWID(), @RoomType_SuperiorStudio, 3, 1
),
(
	NEWID(), @RoomType_SuperiorTwin, 1, 2
),
(
	NEWID(), @RoomType_DeluxeDouble, 2, 2
),
(
	NEWID(), @RoomType_DeluxeTwin, 1, 2
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, 2, 1
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, 3, 1
),
(
	NEWID(), @RoomType_ExecutiveKing, 0, 1
),
(
	NEWID(), @RoomType_DeluxeKing, 0, 1
),
(
	NEWID(), @RoomType_Double, 2, 1
),
(
	NEWID(), @RoomType_TwinRoom, 3, 2
),
(
	NEWID(), @RoomType_DoubleBunkBed, 3, 2
),
(
	NEWID(), @RoomType_CozyKing, 0, 1
)) AS v(Id, [RoomTypeId], [Bed], [NumberOfBeds])

INSERT INTO [Room] (Id, RoomTypeId, AdultCount, ChildCount, Price, Size, TotalAvailable)
SELECT Id, RoomTypeId, AdultCount, ChildCount, Price, Size, TotalAvailable
FROM (VALUES (
	@Room_DoubleSharedBath, @RoomType_DoubleSharedBath, 2, 0, 196, 13, 20
),
(
	@Room_StandardTwinSharedBath, @RoomType_StandardTwinSharedBath, 2, 0, 210, 18, 10
),
(
	@Room_DoublePrivateBath, @RoomType_DoublePrivateBath, 2, 1, 220, 21, 10
),
(
	@Room_TwinPrivateBath, @RoomType_TwinPrivateBath, 2, 0, 198, 19, 15
),
(
	@Room_FamilyPrivateBath, @RoomType_FamilyPrivateBath, 2, 2, 240, 21, 5
),
(
	@Room_FamilySharedBath, @RoomType_FamilySharedBath, 2, 2, 220, 20, 7
),
(
	@Room_QuadruplePrivateBath, @RoomType_QuadruplePrivateBath, 4, 0, 200, 18, 10
),
(
	@Room_King, @RoomType_King, 1, 0, 240, 20, 20
),
(
	@Room_LoftStudio, @RoomType_LoftStudio, 1, 0, 190, 20, 15
),
(
	@Room_SuperiorStudio, @RoomType_SuperiorStudio, 2, 0, 200, 21, 6
),
(
	@Room_SuperiorTwin, @RoomType_SuperiorTwin, 2, 0, 200, 25, 10
),
(
	@Room_DeluxeDouble, @RoomType_DeluxeDouble, 2, 0, 180, 17, 25
),
(
	@Room_DeluxeTwin, @RoomType_DeluxeTwin, 2, 0, 200, 15, 18
),
(
	@Room_DeluxeDoubleSingle, @RoomType_DeluxeDoubleSingle, 2, 1, 210, 18, 10
),
(
	@Room_ExecutiveKing, @RoomType_ExecutiveKing, 2, 2, 250, 25, 10
),
(
	@Room_ExecutiveDoubleDouble, @RoomType_ExecutiveDoubleDouble, 4, 0, 310, 20, 15
),
(
	@Room_DeluxeKing, @RoomType_DeluxeKing, 2, 0, 270, 18, 12
),
(
	@Room_Double, @RoomType_Double, 2, 0, 170, 14, 20
),
(
	@Room_TwinRoom, @RoomType_TwinRoom, 2, 0, 180, 18, 10
),
(
	@Room_DoubleBunkBed, @RoomType_DoubleBunkBed, 2, 0, 168, 12, 21
),
(
	@Room_DoubleDisabilityAccess, @RoomType_DoubleDisabilityAccess, 2, 0, 200, 17, 5
),
(
	@Room_CozyKing, @RoomType_CozyKing, 1, 0, 265, 24, 8
)) AS v(Id, RoomTypeId, AdultCount, ChildCount, Price, Size, TotalAvailable)

INSERT INTO [RoomTypeFeature] (Id, RoomTypeId, FeatureId)
SELECT Id, RoomTypeId, FeatureId
FROM (VALUES (
	NEWID(), @RoomType_DoubleSharedBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_DoubleSharedBath, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DoubleSharedBath, @Feature_Diningarea
),
(
	NEWID(), @RoomType_DoubleSharedBath, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DoubleSharedBath, @Feature_SocketNearBed
),
(
	NEWID(), @RoomType_StandardTwinSharedBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_StandardTwinSharedBath, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_StandardTwinSharedBath, @Feature_Diningarea
),
(
	NEWID(), @RoomType_StandardTwinSharedBath, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_Ironing
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_Toaster
),
(
	NEWID(), @RoomType_DoublePrivateBath, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_TwinPrivateBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_TwinPrivateBath, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_TwinPrivateBath, @Feature_Ironing
),
(
	NEWID(), @RoomType_TwinPrivateBath, @Feature_Toaster
),
(
	NEWID(), @RoomType_TwinPrivateBath, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_SocketNearBed
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Toaster
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Hardwood
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Diningarea
),
(
	NEWID(), @RoomType_FamilyPrivateBath, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_SocketNearBed
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Toaster
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Hardwood
),
(
	NEWID(), @RoomType_FamilySharedBath, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, @Feature_Wifi
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, @Feature_Freetoiletries
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, @Feature_Refrigerator
),
(
	NEWID(), @RoomType_QuadruplePrivateBath, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_King, @Feature_Wifi
),
(
	NEWID(), @RoomType_King, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_King, @Feature_Freetoiletries
),
(
	NEWID(), @RoomType_King, @Feature_Microwave
),
(
	NEWID(), @RoomType_King, @Feature_Diningarea
),
(
	NEWID(), @RoomType_King, @Feature_Refrigerator
),
(
	NEWID(), @RoomType_King, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_King, @Feature_Hardwood
),
(
	NEWID(), @RoomType_King, @Feature_SocketNearBed
),
(
	NEWID(), @RoomType_King, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_King, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_King, @Feature_Ironing
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_Wifi
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_Microwave
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_Wifi
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_LoftStudio, @Feature_Ironing
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Wifi
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Microwave
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Wifi
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Ironing
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_SuperiorStudio, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Wifi
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Ironing
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_SuperiorTwin, @Feature_Toaster
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Wifi
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Microwave
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Diningarea
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Ironing
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_DeluxeDouble, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Wifi
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Microwave
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Diningarea
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Ironing
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeTwin, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Wifi
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Microwave
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Diningarea
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Ironing
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DeluxeDoubleSingle, @Feature_Toaster
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Wifi
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Microwave
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Diningarea
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Hardwood
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_ExecutiveKing, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Wifi
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Diningarea
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Microwave
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Refrigerator
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Ironing
),
(
	NEWID(), @RoomType_ExecutiveDoubleDouble, @Feature_Toaster
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Wifi
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Microwave
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Diningarea
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Hardwood
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_DeluxeKing, @Feature_UpperfloorsByElevator
),
(
	NEWID(), @RoomType_Double, @Feature_Wifi
),
(
	NEWID(), @RoomType_Double, @Feature_Freetoiletries
),
(
	NEWID(), @RoomType_Double, @Feature_Microwave
),
(
	NEWID(), @RoomType_Double, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_Double, @Feature_Toaster
),
(
	NEWID(), @RoomType_Double, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Wifi
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Freetoiletries
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Microwave
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Toaster
),
(
	NEWID(), @RoomType_TwinRoom, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Wifi
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Freetoiletries
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Refrigerator
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Toiletpaper
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Clothesrack
),
(
	NEWID(), @RoomType_DoubleBunkBed, @Feature_Toaster
),
(
	NEWID(), @RoomType_DoubleDisabilityAccess, @Feature_Wifi
),
(
	NEWID(), @RoomType_DoubleDisabilityAccess, @Feature_Coffeemachine
),
(
	NEWID(), @RoomType_DoubleDisabilityAccess, @Feature_Flatscreen
),
(
	NEWID(), @RoomType_DoubleDisabilityAccess, @Feature_Cablechannels
),
(
	NEWID(), @RoomType_CozyKing, @Feature_Wifi
),
(
	NEWID(), @RoomType_CozyKing, @Feature_Microwave
),
(
	NEWID(), @RoomType_CozyKing, @Feature_Refrigerator
),
(
	NEWID(), @RoomType_CozyKing, @Feature_Diningarea
),
(
	NEWID(), @RoomType_CozyKing, @Feature_PrivateBathroom
),
(
	NEWID(), @RoomType_CozyKing, @Feature_UpperfloorsByElevator
)) AS v(Id, RoomTypeId, FeatureId)

INSERT INTO [RoomChoice] ([Id],[RoomId],[ChoiceId])
SELECT Id, [RoomId], [ChoiceId]
FROM (VALUES (
	NEWID(), @Room_DoubleSharedBath, @Choice_Good_BF
),
(
	NEWID(), @Room_DoubleSharedBath, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_StandardTwinSharedBath, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DoublePrivateBath, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DoublePrivateBath, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_TwinPrivateBath, @Choice_Good_BFIncluded
),
(
	NEWID(), @Room_QuadruplePrivateBath, @Choice_Good_BFIncluded
),
(
	NEWID(), @Room_SuperiorStudio, @Choice_Good_BF
),
(
	NEWID(), @Room_SuperiorStudio, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DeluxeTwin, @Choice_Good_BF
),
(
	NEWID(), @Room_ExecutiveDoubleDouble, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_ExecutiveDoubleDouble, @Choice_Good_BF
),
(
	NEWID(), @Room_ExecutiveDoubleDouble, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_TwinRoom, @Choice_Good_BF
),
(
	NEWID(), @Room_CozyKing, @Choice_Good_BFIncluded
),
(
	NEWID(), @Room_CozyKing, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_CozyKing, @FreeCancellationUntilDayBefore
),
(
	NEWID(), @Room_FamilyPrivateBath, @Choice_Good_BF
),
(
	NEWID(), @Room_King, @Choice_Good_BF
),
(
	NEWID(), @Room_King, @Choice_Good_BF
),
(
	NEWID(), @Room_SuperiorTwin, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DeluxeDoubleSingle, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DeluxeDoubleSingle, @Choice_Good_BF
),
(
	NEWID(), @Room_DeluxeKing, @Choice_Good_BF
),
(
	NEWID(), @Room_DoubleBunkBed, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_FamilySharedBath, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_LoftStudio, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DeluxeDouble, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_DeluxeDouble, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_ExecutiveKing, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_Double, @Choice_NO_Prepayment
),
(
	NEWID(), @Room_Double, @Choice_Good_BF
),
(
	NEWID(), @Room_DoubleDisabilityAccess, @Choice_Good_BF
)) AS v(Id, [RoomId], [ChoiceId])

INSERT INTO [Hotel] (Id, [Name], [Description], [Address], [Location])
SELECT Id, [Name], [Description], [Address], [Location]
FROM (VALUES (
	@Hotel_CharingCross, 'Charing Cross Hotel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'310 Renfrew Street, Central Glasgow', 'Glasgow'
),
(
	@Hotel_JurysInnGalway, 'Jurys Inn Galway', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Quay Street, Galway, Ireland', 'Galway'
),
(
	@Hotel_MarlinStephensGreen, 'Marlin Hotel Stephens Green', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'11 Bow Lane East, St Stephens Green, Dublin, Ireland', 'Dublin'
),
(
	@Hotel_TheHendrickSmithfieldOpens, 'The Hendrick Smithfield', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Smithfield Hendrick Street, Dublin, Ireland', 'Dublin'
),
(
	@Hotel_GraftonStreetStudios, 'Grafton Street Studios', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Dublin, Ireland', 'Dublin'
),
(
	@Hotel_Blooms, 'Blooms Hotel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Anglesea Street, Temple Bar, D2 Dublin, Ireland', 'D2 Dublin'
),
(
	@Hotel_TrinityCity, 'Trinity City Hotel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Anglesea Street, Temple Bar, D2 Dublin, Ireland', 'D2 Dublin'
),
(
	@Hotel_EddieCottage, 'Eddie''s Cottage', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Crohyboyle, Donegal, Ireland', 'Donegal'
),
(
	@Hotel_DonegalEstuaryHoliday, 'Donegal Estuary Holiday Homes', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Rossylongan, Donegal, Ireland', 'Donegal'
),
(
	@Hotel_DunmillApartment, 'Dunmill Apartment', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Apartment 11 Mill Park Hotel, Doonin, Donegal, Ireland', 'Donegal'
),
(
	@Hotel_ClybaunHotel, 'Clybaun Hotel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Clybaun Road, Knocknacarra, Salthill, Galway, Ireland', 'Galway'
),
(
	@Hotel_Flannery, 'Flannerys Hotel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Dublin Road, . Galway, Ireland', 'Galway'
),
(
	@Hotel_Number53, 'Number 53', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'53 Newcastle Road, Galway, Ireland', 'Galway'
),
(
	@Hotel_GalwayCityHostel, 'Galway City Hostel', 'Located in the heart of Glasgow, just yards from the city’s Charing Cross railway station, this guest house offers a range of affordable accommodations with a full cooked Scottish breakfast.
		<br>Free WIFI is available throughout, and there is a 24-hour reception with luggage storage and tour desk available.
		<br>Close to the very heart of the city center, the Charing Cross Hotel has a great location for visiting Glasgow. Buchanan Galleries is a 15 minute walk away, while Gallery of Modern Art is a 20 minute walk from the property. Both the SECC and SSE Hydro are just 20 minutes away for a great selection of live music and comedy. Glasgow Airport is 14.8 km away.
		<br>All that Glasgow has to offer is within easy reach, including shops, attractions and nightlife.',
		'Frenchville Lane, Eyre Square, Galway, Ireland', 'Galway'
)
) AS v(Id, [Name], [Description], [Address], [Location])

INSERT INTO [HotelRoom] (Id, HotelId, RoomId)
SELECT Id, HotelId, RoomId
FROM (VALUES(
	NEWID(), @Hotel_CharingCross, @Room_DoubleSharedBath
),
(
	NEWID(), @Hotel_CharingCross, @Room_StandardTwinSharedBath
),
(
	NEWID(), @Hotel_JurysInnGalway, @Room_DoublePrivateBath
),
(
	NEWID(), @Hotel_JurysInnGalway, @Room_TwinPrivateBath
),
(
	NEWID(), @Hotel_JurysInnGalway, @Room_QuadruplePrivateBath
),
(
	NEWID(), @Hotel_TheHendrickSmithfieldOpens, @Room_SuperiorStudio
),
(
	NEWID(), @Hotel_Blooms, @Room_DeluxeTwin
),
(
	NEWID(), @Hotel_DonegalEstuaryHoliday, @Room_ExecutiveDoubleDouble
),
(
	NEWID(), @Hotel_Flannery, @Room_TwinRoom
),
(
	NEWID(), @Hotel_TrinityCity, @Room_FamilyPrivateBath
),
(
	NEWID(), @Hotel_TrinityCity, @Room_King
),
(
	NEWID(), @Hotel_DunmillApartment, @Room_SuperiorTwin
),
(
	NEWID(), @Hotel_Number53, @Room_DeluxeDoubleSingle
),
(
	NEWID(), @Hotel_MarlinStephensGreen, @Room_DeluxeKing
),
(
	NEWID(), @Hotel_MarlinStephensGreen, @Room_DoubleBunkBed
),
(
	NEWID(), @Hotel_GraftonStreetStudios, @Room_FamilySharedBath
),
(
	NEWID(), @Hotel_EddieCottage, @Room_LoftStudio
),
(
	NEWID(), @Hotel_ClybaunHotel, @Room_DeluxeDouble
),
(
	NEWID(), @Hotel_ClybaunHotel, @Room_ExecutiveKing
),
(
	NEWID(), @Hotel_ClybaunHotel, @Room_Double
),
(
	NEWID(), @Hotel_GalwayCityHostel, @Room_DoubleDisabilityAccess
))AS v(Id, HotelId, RoomId)