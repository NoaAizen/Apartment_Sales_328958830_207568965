
[General]
Version=1

[Preferences]
Username=
Password=2554
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NECHAMA
Name=VISIT
Count=10..20

[Record]
Name=VISIT_ID
Type=NUMBER
Size=3
Data=Sequence(1, 1, 999)
Master=

[Record]
Name=DATE_OF_VISIT
Type=DATE
Size=
Data=Random(01/01/2000, 12/12/2023)
Master=

[Record]
Name=HOUR_OF_VISIT
Type=NUMBER
Size=2
Data=Random(9, 18)
Master=

[Record]
Name=APARTMENT_ID
Type=NUMBER
Size=3
Data=List(select Apartment_ID from Apartment)
Master=

[Record]
Name=BUYER_ID
Type=NUMBER
Size=3
Data=List(select Buyer_ID from Buyer)
Master=

