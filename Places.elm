module Places exposing (..)

type alias Coordinates =
  { lat : Float
  , lng : Float }

-- Places
type alias Place =
  { name : String
  , location : Coordinates
  }


places : List Place
places =
  [ Place "Pomme de Pain" (Coordinates 43.603250 1.448835)
  , Place "Ras la Tasse" (Coordinates 43.6018272 1.4439305)
  , Place "Gazette Café" (Coordinates 43.604564 3.878420)
  , Place "Tennis la Jalade" (Coordinates 43.628174 3.863447)
  , Place "Grand Escalier" (Coordinates 43.301308 5.3805723)
  , Place "Le Môle" (Coordinates 43.29531 5.36180)
  , Place "Le Tasse Livre" (Coordinates 45.7687415 4.830928)
  , Place "La Folie Douce" (Coordinates 45.7724217 4.8343591)
  , Place "Le Garage Moderne" (Coordinates 44.86527 -0.55104)
  , Place "French Coffee Shop" (Coordinates 44.8405389 -0.5732745)
  ]