module Places exposing (..)

import Json.Decode exposing (..)


type alias Coordinates =
  { lat : Float
  , lng : Float }

-- Places
type alias Place =
  { name : String
  , location : Coordinates
  }


places : List Place
places = case (decodeString decodePlaces jsonPlaces) of
  Ok value -> value
  Err error -> []


decodePlace: Decoder Place
decodePlace =
  object2 Place 
    ( "name" := string )
    (object2 Coordinates
      ( "lat" := float )
      ( "lon" := float )
    ) 

decodePlaces: Decoder (List Place)
decodePlaces =
  at ["places"] (list decodePlace)


jsonPlaces: String
jsonPlaces = """
{ "places":
  [
      {
          "name": "Pomme de Pain",
          "lat": 43.603250,
          "lon": 1.4439305
      },
      {
          "name": "Ras la Tasse",
          "lat": 43.6018272,
          "lon": 1.443905
      }, 
      {
          "name": "Gazette Café",
          "lat": 43.604564,
          "lon": 3.878420
      },
      {
          "name": "Tennis la Jalade",
          "lat": 43.628174,
          "lon": 3.863447
      },
      {
          "name": "Grand Escalier",
          "lat": 43.301308,
          "lon": 5.3805723
      },
      {
          "name": "Le Môle",
          "lat": 43.29531,
          "lon": 5.36180
      },
      {
          "name": "Le Tasse Livre",
          "lat": 45.7687415,
          "lon": 4.830928
      },
      {
          "name": "La Folie Douce",
          "lat":  45.7724217,
          "lon": 4.8343591
      },
      {
          "name": "Le Garage Moderne",
          "lat": 44.86527,
          "lon": -0.55104
      },
      {
          "name": "French Coffee Shop",
          "lat": 44.8405389,
          "lon": -0.5732745
      }

  ]
}
"""