## Beet Farmer

Beet Farmer is a microservice designed to be consumed by [Turnip the Beet](https://github.com/linda-le1/turnip-the-beet). It takes mood and cuisine queries to return a JSON response with customized playlists.

### Example JSON Response

```
{
  "data": {
    "mood": {
      "type": "Chill",
      "playlists": [
        {
          "id": "37i9dQZF1DWTvNyxOwkztu",
          "name": "Chillout Lounge"
        },
        {
          "id": "37i9dQZF1DX0SM0LYsmbMT",
          "name": "Jazz Vibes"
        },
        {
          "id": "37i9dQZF1DX0FJ8JYkqiJu",
          "name": "Just Chill"
        },
        {
          "id": "37i9dQZF1DWXrDQedVqw6q",
          "name": "Reading Chill Out"
        },
        {
          "id": "37i9dQZF1DWVYHdtUb7Wil",
          "name": "Chilled Hits"
        }
      ]
    },
    "cuisine": {
      "type": "Italian",
      "playlists": [
        {
          "id": "37i9dQZF1DX6PSDDh80gxI",
          "name": "Indie Italia"
        },
        {
          "id": "37i9dQZF1DX3sDhLvLnzj8",
          "name": "Estate Italiana"
        },
        {
          "id": "37i9dQZF1DWTqE3nGpRCBE",
          "name": "Best of Indie Italia 2019"
        },
        {
          "id": "37i9dQZF1DX01NP73ErE8b",
          "name": "Italia in Alta Rotazione"
        },
        {
          "id": "37i9dQZF1DX3kkOVvCOkIe",
          "name": "80s Italia"
        }
      ]
    },
    "combos": {
      "type": "Chill Italian",
      "playlists": [
        {
          "id": "7wzGz49nfMw16QoANectLF",
          "name": "Classy Italian/Evening Chill"
        },
        {
          "id": "4nNTxy19OWTKNNGTRDbQ3k",
          "name": "Italian chill hits"
        },
        {
          "id": "6VTgtDYzNQhpbJf4PoUhf9",
          "name": "Chill italiana"
        },
        {
          "id": "4aMMd35iE1VeHvjcKjvTC8",
          "name": "in italiano 🇮🇹 Chill Out_Cocktail_Lounge [in Italian]"
        },
        {
          "id": "5a72JzFH04K2T458MURSqr",
          "name": "Mil Pasos - Wine and Cheese"
        }
      ]
    }
  }
}
```

### Endpoints

 `GET /api/v1/recommend`

### Query Params
| Params | Usage |
| --- | --- |
| token | Required. A valid access token from the Spotify Accounts service: see the [Web API Authorization Guide](https://developer.spotify.com/documentation/general/guides/authorization-guide/) for details. |
| mood | Optional. Valid values are: `party`, `chill`, `happy`, `jazzy`, `glum`, `classy`, `romantic`, `folksy`, `sunny`, `frisky`|
| cuisine | Optional. Valid values are: `italian`, `mexican`, `indian`, `american`, `thai`, `greek`, `chinese`, `japanese`, `vietnamese`, `latin`, `korean`, `bbq`, `french` |
