
[General]
Version=1

[Preferences]
Username=
Password=2785
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=NECHAMA
Name=AGENT_PERSON
Count=10..20

[Record]
Name=AGENT_ID
Type=NUMBER
Size=3
Data=Sequence(1, 1, 999)
Master=

[Record]
Name=AGENT_NAME
Type=VARCHAR2
Size=15
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=PHONE_NUMBER
Type=NUMBER
Size=5
Data=Random(10000, 99999)
Master=

