module Places exposing (..)



-- Places


type alias Place =
  { name : String
  , location : { lat : Float, lng : Float }
  }


places : List Place
places =
  [ Place "Pomme de Pain" {lat = 43.603250, lng = 1.448835}
  , Place "Ras la Tasse" {lat = 43.6018272, lng = 1.4439305}
  , Place "Gazette Café" {lat = 43.604564, lng = 3.878420}
  , Place "Tennis la Jalade" {lat = 43.628174, lng = 3.863447}
  , Place "Grand Escalier" {lat = 43.301308, lng = 5.3805723}
  , Place "Le Môle" {lat = 43.29531, lng = 5.36180}
  , Place "Le Tasse Livre" {lat = 45.7687415, lng = 4.830928}
  , Place "La Folie Douce" {lat = 45.7724217, lng = 4.8343591}
  , Place "Le Garage Moderne" {lat = 44.86527, lng = -0.55104}
  , Place "French Coffee Shop" {lat = 44.8405389, lng = -0.5732745}
  ]