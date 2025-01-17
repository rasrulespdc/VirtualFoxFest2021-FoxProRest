CLEAR
DO wwhttp
DO wwJsonSerializer

#DEFINE MAX_ITEMS  3  && Show only 3 items

loHttp = CREATEOBJECT("wwhttp")
lcJson = loHttp.Get("https://albumviewer.west-wind.com/api/albums")

* ShowJson(lcJson)

loSer = CREATEOBJECT("wwJsonSerializer")
loAlbums = loSer.Deserialize(lcJson) && collection of artists

lnCount = 0
FOR EACH loAlbum IN loAlbums FOXOBJECT
    lnCount = lnCount + 1

    IF lnCount > MAX_ITEMS
        EXIT
    ENDIF
	? loAlbum.Title  + " (" + loAlbum.Artist.ArtistName + ")"

	FOR EACH loTrack IN loAlbum.Tracks
		? " - " + loTrack.SongName  + " " + loTrack.Length
	ENDFOR
ENDFOR
