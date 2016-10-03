port module Leaflet exposing (..)
import Html exposing (Html, text, ul, li)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id, attribute)
import LeafletData exposing (..)



-- Main

main : Program Never
main = program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }



-- Init


type alias Model = Town


init : (Model, Cmd Msg)
init =
  let
    defaultTown = LeafletData.defaultTown
  in
    ( defaultTown
    , Cmd.batch
      [ portActiveTown defaultTown
      , portPlaces places
      ]
    )



-- UPDATE


port portActiveTown : Town -> Cmd msg
port portPlaces : List Place -> Cmd msg


type Msg
  = SelectTown Town


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectTown town ->
       (town, portActiveTown town)



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
