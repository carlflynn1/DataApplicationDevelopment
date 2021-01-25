getwd()

setwd("C:\Users\CarlF\OneDrive\Desktop\DAD CA1\DAD CA1")
#Loading Package
install.packages("tidyverse")
library(tidyverse)

#Importing Properties file
PropertiesBought <- read.csv("2015PropertiesDub.csv", header = TRUE)

#Importing Pitch Files
Pitches <- read.csv("DCCPitchesDub.csv", header = TRUE)
FingalPitches <- read.csv("FingalPitches.csv", header = TRUE)
DLRpitches <- read.csv("DLRpitches.csv", header = TRUE)
SDCCPitches <- read.csv("SDCCPitches.csv", header = TRUE)

#Adding new blank columns
Pitches$PITCH.POSTAL.CODE = 0
FingalPitches$PITCH.POSTAL.CODE = 0
DLRpitches$AREA = 0
DLRpitches$PITCH.POSTAL.CODE = 0
SDCCPitches$PITCH.POSTAL.CODE = 0

#Removing Unneeded columns from the datasets
Pitches <- Pitches[,-which(names(Pitches) %in% c("LEAGUE","CLUBNAME"))]
FingalPitches <- FingalPitches[,-which(names(FingalPitches) %in% c("LAT","LONG","FACILITY_TYPE"))]
PropertiesBought <- PropertiesBought[,-which(names(PropertiesBought) %in% c("Property.Size.Description","Description.of.Property","VAT.Exclusive","Not.Full.Market.Price"))]
SDCCPitches <- SDCCPitches[,-which(names(SDCCPitches) %in% c("ï..ID","PitchNumber","ClubType","Astro","GrassTurf","Allocated","Playable","ShapeSTArea"))]
DLRpitches <- DLRpitches[,-which(names(DLRpitches) %in% c("Number","Size","Latitude","Longitude"))]


#Renaming Columns
PropertiesBought <- rename(PropertiesBought, Date.of.Sale = Date.of.Sale..dd.mm.yyyy.)
PropertiesBought <- rename(PropertiesBought, Price = Price....)
FingalPitches <- rename(FingalPitches, AREA = LOCATION)
FingalPitches <- rename(FingalPitches, PARK = FACILITY_NAME)
SDCCPitches <- rename(SDCCPitches, AREA = ClubName)
SDCCPitches <- rename(SDCCPitches, PARK = GroupName)
DLRpitches <- rename(DLRpitches, PARK = Location)

#Changing all post codes to uniform identifiers
PropertiesBought$Postal.Code <- sub("Dublin 1", "D1", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 2", "D2", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 3", "D3", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 4", "D4", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 5", "D5", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 6", "D6", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 7", "D7", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 8", "D8", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 9", "D9", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 10", "D10", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 11", "D11", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 12", "D12", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 13", "D13", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 14", "D14", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 15", "D15", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 16", "D16", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 17", "D17", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 18", "D18", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 19", "D19", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 20", "D20", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 21", "D21", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 22", "D22", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 23", "D23", PropertiesBought$Postal.Code)
PropertiesBought$Postal.Code <- sub("Dublin 24", "D24", PropertiesBought$Postal.Code)

#A lot of rows have no data for the post code as a lot of them are in places like Swords/Malahide/Lucan
#Which is in county Dublin so I will change these values
PropertiesBought$Postal.Code[PropertiesBought$Postal.Code==""]<-"CoDub"

#Removing Duplicate Postal Code in the Address
PropertiesBought$Address <- sub("DUBLIN 1", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 2", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 3", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 4", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 5", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 6", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 7", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 8", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 9", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 10", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 11", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 12", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 13", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 14", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 15", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 16", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 17", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 18", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 19", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 20", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 21", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 22", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 23", "", PropertiesBought$Address)
PropertiesBought$Address <- sub("DUBLIN 24", "", PropertiesBought$Address)

#Removing outliers and invalid data
PropertiesBought <- PropertiesBought[-which(PropertiesBought$Price == "35045714"), ]
PropertiesBought <- PropertiesBought[-which(PropertiesBought$Price == "28050000"), ]
PropertiesBought <- PropertiesBought[-which(PropertiesBought$Postal.Code == "Dubin 8"), ]

#Copying data for transformation
Pitches$PITCH.POSTAL.CODE <- Pitches$PARK

#Changing Park date in post code column data to Postal Codes that the parks are located in so comparing is easier
Pitches$PITCH.POSTAL.CODE <- sub("ALBERT COLLEGE", "D9", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ALFIE BYRNE", "D3", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ARDMORE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ASHINGTON", "D7", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BALCURRIS PARK", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BEECHILL", "D4", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BELCAMP", "D17", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BENMADIGAN", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BRICKFIELDS", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BUNTING ROAD", "D8", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("BUSHY", "D6", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("CHERRY ORCHARD", "D10", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("CLONTURK", "D9", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("COULTRY", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DARNDALE", "D17", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DARTRY", "D6", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DOLPHIN", "D8", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DONAGHMEDE", "D13", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DONNYCARNEY", "D3", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("DUNDANIEL", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("EDENMORE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ELLENFIELD", "D9", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("FAIRVIEW", "D3", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("FARNHAM", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("FR. COLLINS", "D13", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("GALTYMORE", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("GLIN ROAD", "D17", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("GREENDALE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("HERBERT", "D4", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("IRISHTOWN", "D4", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("JOHN PAUL", "D7", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("JOHNSTOWN", "D9", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("KILDONAN", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("KILMORE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("LE FANU", "D10", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("LEIN ROAD", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MARINO", "D3", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MARKIEVICZ", "D2", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MARTIN SAVAGE", "D7", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MC AULEY", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MELLOWES", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MILLBROOK", "D13", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("MOUNT OLIVE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("NAUL", "CoDub", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("NORTHWAY", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("NORTH", "", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("OSCAR TRAYNOR", "D17", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("PEARSE PARK", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("PLUNKETT AVENUE", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("POPPINTREE", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("POPPINTREE NORTH", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("RINGSEND", "D4", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ROCKFIELD", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ROSEGLEN", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("SEAN MOORE", "D4", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("SPRINGDALE", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ST ANNES", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ST. ANNES", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("ST  ANNES", "D5", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("STANNAWAY", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("STREAMVILLE", "D17", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("SUNDRIVE", "D8", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("THE RANCH", "D10", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("TOLKA VALLEY", "D11", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("WALKINSTOWN", "D12", Pitches$PITCH.POSTAL.CODE)
Pitches$PITCH.POSTAL.CODE <- sub("WOODBINE AVE", "CoDub", Pitches$PITCH.POSTAL.CODE)

#Copying data to transform into post codes
FingalPitches$PITCH.POSTAL.CODE <- FingalPitches$AREA

#subbing post codes into the data
FingalPitches$PITCH.POSTAL.CODE <- sub("Swords", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("St. Catherines Demesne, Lucan", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Sutton", "D13", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Skerries", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Swords", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Rush", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Portmarnock", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Porterstown", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Mulhuddart", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Malahide", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Lusk", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Howth", "D13", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Hartstown", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Dublin 15", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Donabate", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Corduff", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Clonee", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Castleknock", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Castaheany", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Brackenstown, ", "", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Blanchardstown", "D15", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Balrothery", "CoDub", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Baldoyle", "D13", FingalPitches$PITCH.POSTAL.CODE)
FingalPitches$PITCH.POSTAL.CODE <- sub("Balbriggan", "CoDub", FingalPitches$PITCH.POSTAL.CODE)

#Removing blank values
FingalPitches <- FingalPitches[-which(FingalPitches$AREA == ""), ]

#Copying data for transformation
DLRpitches$AREA <- DLRpitches$PARK

#Changing values
DLRpitches$AREA <- sub("Kilbogget Park", "Cabinteely", DLRpitches$AREA)
DLRpitches$AREA <- sub("Shanganagh Park", "Shankill", DLRpitches$AREA)
DLRpitches$AREA <- sub("Shanganagh Cliffs", "Shankill", DLRpitches$AREA)
DLRpitches$AREA <- sub("Shanganagh Castle", "Shankill", DLRpitches$AREA)
DLRpitches$AREA <- sub("Rockfield Park(NTPL)", "Blackrock", DLRpitches$AREA)
DLRpitches$AREA <- sub("Dunedin (jun)", "Monkstown", DLRpitches$AREA)
DLRpitches$AREA <- sub("Soldiers & Sailors", "Monkstown", DLRpitches$AREA)
DLRpitches$AREA <- sub("Meadowvale", "Deansgrange", DLRpitches$AREA)
DLRpitches$AREA <- sub("Holly Park", "Blackrock", DLRpitches$AREA)
DLRpitches$AREA <- sub("Hyde Park", "Dalkey", DLRpitches$AREA)
DLRpitches$AREA <- sub("Hundson Road", "Dalkey", DLRpitches$AREA)
DLRpitches$AREA <- sub("Thomastown Road", "Glenageary", DLRpitches$AREA)
DLRpitches$AREA <- sub("Loughlinstown Park", "Loughlinstown", DLRpitches$AREA)
DLRpitches$AREA <- sub("Mount Albany", "Blackrock", DLRpitches$AREA)

#all pitches that are located in Count Dublin Postal Code
DLRpitches$PITCH.POSTAL.CODE <- sub("0", "CoDub", DLRpitches$PITCH.POSTAL.CODE)


#Copying data for transformatiom
SDCCPitches$AREA <- SDCCPitches$PARK

#Removing Brackets
SDCCPitches$AREA <- gsub("\\(|\\)", "", SDCCPitches$AREA)

#Changing Values
SDCCPitches$AREA <- sub("Woodstown/Ballycullen Park", "Knocklyon", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Tymon Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Willsbrook Park Lucan", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Whitechurch Open Space", "Rathfarnham", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Tymonville Open Space", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("St. Annes Allenton", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Sean Walsh Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Rathcoole Park", "Rathcoole", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Quarryvale Open Space", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Knockmitten Open Space", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Kingswood Open Space", "Kingswood", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Kilnamanagh Open Space", "Kilnamanagh", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Killinarden Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Kennedy's Field", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Jobstown Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Hillcrest Open Space Lucan", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Hermitage Park, Lucan", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Griffeen Valley Park", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Greentrees Park", "Walkinstown", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Greenhills Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Glenlyon/Ballycullen", "Ballycullen", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Glenaulin Park Ballymount", "Chapelizod", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Firhouse Community Centre Open Space", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Fettercairn Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Elkwood Open Space", "Rathfarnham", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Doddsborough Open Space", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Dodder Valley Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Dodder Valley", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Delaford Open Space", "Knocklyon", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Corkagh Park", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Collinstown Park", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Clondalkin Community Centre", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Castle Park", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Carrigmore Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Butler Magee Park Fettercairn", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Brady's Field", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Beechfield Park", "Walkinstown", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Beech Park, Lucan", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Bancroft Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Ballyowen Park", "Lucan", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Ballymount Lands", "Ballymount", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Ballycragh Park", "Tallaght", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Aylesbury Open Space", "Glenageary", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Ashwood", "Clondalkin", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Old Bawn End", "", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Cherryfield End", "", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Stadium", "", SDCCPitches$AREA)
SDCCPitches$AREA <- sub("Old Bawn", "", SDCCPitches$AREA)

#Removing invalid values
SDCCPitches <- SDCCPitches[-which(SDCCPitches$AREA == "SC9"), ]

#Copying data to transform
SDCCPitches$PITCH.POSTAL.CODE <- SDCCPitches$AREA

#Assigning Post codes
SDCCPitches$PITCH.POSTAL.CODE <- sub("Tallaght", "D24", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Walkinstown", "D12", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Rathfarnham", "D14", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Rathcoole", "CoDub", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Lucan", "CoDub", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Knocklyon", "D16", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Kingswood", "D24", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Kilnamanagh", "D24", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Glenageary", "CoDub", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Clondalkin", "D22", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Chapelizod", "D20", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Ballymount", "D12", SDCCPitches$PITCH.POSTAL.CODE)
SDCCPitches$PITCH.POSTAL.CODE <- sub("Ballycullen", "D16", SDCCPitches$PITCH.POSTAL.CODE)

#Merging all pitch datasets into one
AllPitches <- rbind(Pitches, FingalPitches, DLRpitches, SDCCPitches)

#Removing Whitespace
AllPitches$PITCH.POSTAL.CODE <- trimws(AllPitches$PITCH.POSTAL.CODE, which = c("both"))
PropertiesBought$Postal.Code <- trimws(PropertiesBought$Postal.Code, which = c("both"))

#Creating Graphs with data
library(ggplot2)
qplot(PropertiesBought$Price,
      geom="histogram",
      binwidth = 50000,  
      main = "Histogram for Property Prices", 
      ylab = "Count",
      xlab = "Prices",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(50000,1000000))

ggplot(PropertiesBought$Postal.Code,
      geom="histogram",
      main = "Histogram for Property Prices", 
      ylab = "Count",
      xlab = "Prices",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2))

ggplot(PropertiesBought, 
       aes(x = Postal.Code)) +
  geom_bar(fill = "blue", col = "red", alpha=I(.2), main = "Frequency of Post Code")

ggplot(AllPitches, aes(x = PITCH.POSTAL.CODE)) +
  geom_bar(fill = "blue", col = "red", alpha=I(.2))











