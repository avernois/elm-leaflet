port module Leaflet exposing (..)
import Html exposing (Html, text, ul, li)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id, attribute)



-- Main

main : Program Never
main = program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }



-- Init


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


type alias Model = Town


init : (Model, Cmd Msg)
init = 
  ( Town "Montpellier" {lat = 43.610769, lng = 3.876716}, Cmd.none )




-- UPDATE


type Msg
  = SelectTown Town


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectTown town ->
       (town, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- View



view : Model -> Html Msg
view model =
  let
    townsLi : List Town -> List (Html Msg)
    townsLi towns =
      List.map 
        (\town ->
          li 
            [ attribute "data-selected" (toString (town.name == model.name))
            , onClick (SelectTown town)
            ]
            [text town.name]
        ) towns
  in
    ul [id "towns"] (townsLi towns)
