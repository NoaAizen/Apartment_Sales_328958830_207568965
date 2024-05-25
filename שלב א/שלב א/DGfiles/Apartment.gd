
[General]
Version=1

[Preferences]
Username=
Password=2373
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NECHAMA
Name=APARTMENT
Count=10..20

[Record]
Name=APARTMENT_ID
Type=NUMBER
Size=3
Data=Sequence(1, 1, 999)
Master=

[Record]
Name=APARTMENT_SIZE
Type=NUMBER
Size=3
Data=Random(30, 200)
Master=

[Record]
Name=NUM_FLOOR
Type=NUMBER
Size=
Data=Random(0, 8)
Master=

[Record]
Name=NUM_ROOMS
Type=NUMBER
Size=
Data=Random(1, 20)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=
Data=Sequence(1000000, 50000, 1000000000)
Master=

[Record]
Name=SELLER_ID
Type=NUMBER
Size=3
Data=List(select Seller_ID from Seller)
Master=

[Record]
Name=CITY_ID
Type=NUMBER
Size=3
Data=List(select City_ID from City)
Master=

