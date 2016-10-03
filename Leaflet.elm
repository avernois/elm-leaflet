port module Leaflet exposing (..)
import Html exposing (text, ul, li)
import Html.Attributes exposing (id)

main =
  ul [id "towns"] 
    [ li [] [text "Montpellier"]
    , li [] [text "Toulouse"]
    , li [] [text "Lyon"]
    , li [] [text "Bordeaux"]
    ]
