User Stories
=============


## Creating new records in the database

<pre>
#####As a Publisher I want to be able to add a new songwriter to the database so that I can run reports on their music catalog.

Usage: ./hippublisher addWriter "FirstName" "LastName"

Acceptance Criteria:
* Asks for first and last name of songwriter to begin adding writer.
* Prints out a series of questions about the songwriter
* At the end it shows all the data inputed for writer and a prompt to confirm correct.
</pre>

<pre>
#####As a Publisher I want to be able to add a new song to the database so that I can run reports on the music catalog.

Usage: ./hippublisher addSong "Title"

Acceptance Criteria:
* Asks for Song Title to begin process of adding song.
* Prints out a series of questions about the song to be answered
* At the end it shows all the song data inputed for song and a prompt to confirm correct.
</pre>

<pre>
#####As a Publisher I want to be able to add new Publishers to the database so that I can run a search on a co-writer's publishing company.

Usage: ./hippublisher addPublisher "PublisherName"

Acceptance Criteria:
* Asks for Publisher Name to begin process of adding Publisher info.
* Prints out a series of questions about the Publisher to be answered.
* At the end it shows all the song data inputed for Publisher and a prompt to confirm correct.
</pre>


## Updating records in the database
<pre>
#####As a Publisher I want to be able to update existing songwriter records so that I can have current information on them.

Usage: ./hippublisher editWriter "FirstName" "LastName"

Acceptance Criteria:
* Asks for first and last name of songwriter to begin editing writer.
* Prints songwriter record and then prompts which field to edit.
</pre>

<pre>
#####As a Publisher I want to be able to update existing song records so that I can have current information on them.

Usage: ./hippublisher editSong "Title"

Acceptance Criteria:
* Asks for Song Title to begin process of adding song.
* Prints song record and then prompts which field to edit.
</pre>

<pre>
#####As a Publisher I want to be able to update an existing publisher records so that I can have current information on them.

Usage: ./hippublisher editPublisher "PublisherName"

Acceptance Criteria:
* Asks for Publisher Name to begin process of adding Publisher info.
* Prints publisher record and then prompts which field to edit.
</pre>


## Deleting records in the database
<pre>
#####As a Publisher I want to be able to delete an existing songwriter record

Usage: ./hippublisher deleteWriter "FirstName" "LastName"

Acceptance Criteria:
* Asks for first and last name of songwriter to delete songwriter
* Prints songwriter record and then prompts to confirm delete
</pre>

<pre>
#####As a Publisher I want to be able to delete an existing song record

Usage: ./hippublisher deleteSong "Title"

Acceptance Criteria:
* Asks for Song Title to begin process of deleting song
* Prints song record and then prompts to confirm delete
</pre>

<pre>
#####As a Publisher I want to be able to delete an existing publisher records

Usage: ./hippublisher deletePublisher "PublisherName"

Acceptance Criteria:
* Asks for Publisher Name to begin process of of deleting publisher
* Prints publisher record and then prompts to confirm delete
</pre>


## Reading records from the database (Creating Reports)
<pre>
#####As a Publisher I want to dig into a songwriter's catalog and create a report of all the songs that are missing information so that I know what I need them to still submit to me for updating later.

Usage: ./hippublisher missing "FirstName" "LastName"

Acceptance Criteria:
* Prints out songs missing data grouped by field type missing.
</pre>

<pre>
#####As a Publisher I want to dig into a songwriter's catalog and create a report of all the songs in a particular range of dates. Knowing this information will help me know what songs were completed within a particular contract period.

Usage: ./hippublisher range "1 2008" "1 2009"

Acceptance Criteria:
* Prints out songs created with in a certain date range.
</pre>

<pre>
#####As a Publisher I want to dig into a songwriter's catalog and create a report of all their songs

Usage: ./hippublisher catalog "FirstName" "LastName"

Acceptance Criteria:
* Prints out song catalog of songwriter inputed.
</pre>

<pre>
#####As a Publisher I want to dig into a songwriter's catalog and create a report of all the songs that were written with a particular co-writer.

Usage: ./hippublisher coWrite "FirstName" "LastName"

Acceptance Criteria:
* Asks for Songwriter Name, then prompts for co-writer name
* Prints out song catalog of songs written between the two writers
</pre>

<pre>
#####As a Publisher I want to find out which publishers belong to a song.

Usage: ./hippublisher songPublishers "SongTitle"

Acceptance Criteria:
* Prints out publishers that own the particular song queried
</pre>
