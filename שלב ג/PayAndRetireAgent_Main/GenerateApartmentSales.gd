
[General]
Version=1

[Preferences]
Username=
Password=2647
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NECHAMA
Name=APARTMENT_SALE
Count=20

[Record]
Name=SALE_ID
Type=NUMBER
Size=3
Data=Random(100, 200)
Master=

[Record]
Name=FINAL_COST
Type=NUMBER
Size=10
Data=Sequence(1000000000, 1000500, 9000000000)
Master=

[Record]
Name=AGENT_FEE
Type=NUMBER
Size=6
Data=Random(10000, 100000)
Master=

[Record]
Name=SIGN_DATE
Type=DATE
Size=
Data=Random(01/01/2020, 01/01/2030)
Master=

[Record]
Name=VISIT_ID
Type=NUMBER
Size=3
Data=List(select Visit_ID from Visit)
Master=

