# Data Models

**Publishers**  
PublisherID: int  
Name: varchar(30)  
Affiliation: varchar(5)  

**Songwriters**  
SongwriterID: int  
LastName: varchar(20)  
FirstName: varchar(10)  
Publisher: int  
Affiliation: int  

**Songs**  
SongID: int  
SongTitle: varchar(60)  
CreationDate: timestamp  
Worktape: varchar(3)  
Lyrics: varchar(3)  
Demo: varchar(3)  
Songwriters: int  

**Affiliations**  
AffilationID: int  
Name: varchar(30)  
