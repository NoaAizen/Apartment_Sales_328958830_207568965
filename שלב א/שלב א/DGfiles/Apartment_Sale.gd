
[General]
Version=1

[Preferences]
Username=
Password=2088
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NECHAMA
Name=APARTMENT_SALE
Count=10..20

[Record]
Name=SALE_ID
Type=NUMBER
Size=3
Data=Sequence(1, 1, 999)
Master=

[Record]
Name=FINAL_COST
Type=NUMBER
Size=10
Data=Sequence(1000000, 50000, 1000000000)
Master=

[Record]
Name=AGENT_FEE
Type=NUMBER
Size=6
Data=Sequence(10000, 500, 100000)
Master=

[Record]
Name=SIGN_DATE
Type=DATE
Size=
Data=Random(01/01/2024, 01/01/2029)
Master=

[Record]
Name=VISIT_ID
Type=NUMBER
Size=3
Data=List(select Visit_ID from Visit)
Master=

