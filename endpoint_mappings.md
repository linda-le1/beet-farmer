## CUISINES:
* All cuisine endpoints should be returning playlists that are then filtered for spotify
* All cuisine queries should limit=50 to include enough results to filter for spotify


* Italian
  - param: 'ital'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=ital
  - returns: 21

* Mexican
  - param: 'mexi'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=mexi
  - returns: 26

* Indian
  - param: 'india desi' / 'india&20desi'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=india&20desi
  - returns: 41

* American
  - param: 'america'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=america
  - returns: 16

* Thai
  - param: 'thai'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=thai
  - returns: 4

* Greek
  - param: 'greece'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=greece
  - returns: 2
  (looking for ways to expand)
  - param: 'greek dinner' / 'greek&20dinner'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=greek&20dinner
  - returns: 0

* Chinese
  - param: 'chine'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=chine
  - returns: 5

* Japanese
  - param: 'japan'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=japan
  - returns: 23

* Vietnamese
  - param: 'viet'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=viet
  - returns: 15

* Latin
  - param: 'latin'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=latin
  - 30

* Korean
  - param: 'korean'
  - full endpoint: https://api.spotify.com/v1/search?type=playlist&limit=50&q=korean
  - returns: 7

* BBQ
  - param: 'bbq'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=bbq
  - 7

* French (?)
  - difficulty finding decent selection between france/french/paris - returns a lot of artist names (looking into better ways for this one)


## MOODS:
* All mood endpoints should be returning playlists that are then filtered for spotify
* All mood queries should limit=50 to include enough results to filter for spotify


* Party
  - param: 'party'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=party
  - 31

* Chill
  - param: 'chill'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=chill
  - 37

* Happy
  - param: 'happy'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=party
  - 29

* Jazzy
  - param: 'jazz'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=jazz
  - 39

* Glum
  - param: 'sad'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=sad
  - 14

* Classy
  - param: 'classical'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=classical
  - 37

* Romantic
  - still working out the best solution here

* Folksy
  - param: 'folk'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=folk
  - 34

* Sunshiny (might change this one)
  - param: 'sunshine'
  - https://api.spotify.com/v1/search?type=playlist&limit=50&q=summer
  - 31


## COMBO:
* All combo endpoints should combine the params from cuisine + mood (ie. 'ital&20happy')
* For cuisine params that have more than one word, use the first word (ie. 'india desi' => 'india&20party')
* Combo return values should NOT be filtered for spotify - these should return user generated playlists
* All combo queries should be limited at 10-20 to ensure higher quality - spotify is ranking results by popularity
