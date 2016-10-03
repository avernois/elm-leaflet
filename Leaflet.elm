port module Leaflet exposing (..)
import Html exposing (Html, text, ul, li)
import Html.Attributes exposing (id)
import Set

type alias Town =
  { name : String
  , location : { lat : Float, lng : Float }
  }
towns : List Town
towns =
  [ Town "Montpellier" {lat = 43.610769, lng = 3.876716}
  , Town "Bordeaux" {lat = 44.837789, lng = -0.579180}
  , Town "Toulouse" {lat = 43.604652, lng = 1.444209}
  , Town "Cholet" {lat = 47.059407, lng = -0.879787}
  , Town "Marseille" {lat = 43.296482, lng = 5.369780}
  , Town "Lyon" {lat = 47.215586, lng = -1.541820 }
  ]

main =
  let
    townsLi : List Town -> List (Html String)
    townsLi towns =
      List.map (\town -> li [] [text town.name]) towns
  in
    ul [id "towns"] (townsLi towns)
