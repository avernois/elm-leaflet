module Towns exposing (..)



-- Towns


type alias Town =
  { name : String
  , location : { lat : Float, lng : Float }
  }


defaultTown : Town
defaultTown =
  Maybe.withDefault
    (Town "noWhere" { lat = 47.059407, lng = -0.879787 })
    (List.head towns)


towns : List Town
towns =
  [ Town "Montpellier" {lat = 43.610769, lng = 3.876716}
  , Town "Bordeaux" {lat = 44.837789, lng = -0.579180}
  , Town "Toulouse" {lat = 43.604652, lng = 1.444209}
  , Town "Cholet" {lat = 47.059407, lng = -0.879787}
  , Town "Marseille" {lat = 43.296482, lng = 5.369780}
  , Town "Lyon" {lat = 45.764043, lng = 4.835659}
  , Town "Nantes" {lat = 47.215586, lng = -1.541820 }
  ]
