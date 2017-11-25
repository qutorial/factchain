curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsAgency",
   "agencyId": "1",
   "name": "Bloomberg",
   "info": "Bloomberg agency"
 }' 'http://localhost:3000/api/NewsAgency'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsAgency",
   "agencyId": "2",
   "name": "Bild",
   "info": "Das Bild"
 }' 'http://localhost:3000/api/NewsAgency'


curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsAgency",
   "agencyId": "3",
   "name": "Fox News",
   "info": "string"
 }' 'http://localhost:3000/api/NewsAgency'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsItem",
   "newsItemId": "1",
   "author": "resource:org.acme.sample.NewsAgency#1",
   "title": "The price of Apple hist a new record",
   "votes": 35,
   "contentUrl": "apple.com",
   "contentHash": "123abc",
   "timestamp": "2017-11-25T10:02:26.041Z"
 }' 'http://localhost:3000/api/NewsItem'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsItem",
   "newsItemId": "2",
   "author": "resource:org.acme.sample.NewsAgency#2",
   "title": "Angela Merkel resigns finally",
   "votes": -20,
   "contentUrl": "www.bild.de/politik/inland/grosse-koalition/so-weit-sind-wir-von-einer-regierung-entfernt-53978324.bild.html",
   "contentHash": "123abc",
   "timestamp": "2017-11-25T10:12:26.041Z"
 }' 'http://localhost:3000/api/NewsItem'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsItem",
   "newsItemId": "3",
   "author": "resource:org.acme.sample.NewsAgency#3",
   "title": "Nobel Prize of Peace might go to Donald Trump",
   "votes": -17,
   "contentUrl": "fox.com/trump",
   "contentHash": "123abc",
   "timestamp": "2017-11-25T10:22:26.041Z"
 }' 'http://localhost:3000/api/NewsItem'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "$class": "org.acme.sample.NewsItem",
   "newsItemId": "4",
   "author": "resource:org.acme.sample.NewsAgency#1",
   "title": "iPhone X announced to be the best selling device in 2017",
   "votes": 34,
   "contentUrl": "engadget.com/iphonex",
   "contentHash": "123abc",
   "timestamp": "2017-11-25T10:22:26.041Z"
 }' 'http://localhost:3000/api/NewsItem'
