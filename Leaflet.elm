port module Leaflet exposing (..)
import Html exposing (Html, text, ul, li)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id, attribute)
import LeafletData as Data



-- Main

main : Program Never
main = program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }



-- Init


type alias Model = Data.Town


init : (Model, Cmd Msg)
init =
  ( Data.defaultTown
  , Cmd.batch
    [ portActiveTown Data.defaultTown
    , portPlaces Data.places
    ]
  )



-- UPDATE


port portActiveTown : Data.Town -> Cmd msg
port portPlaces : List Data.Place -> Cmd msg


type Msg
  = SelectTown Data.Town


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
    townsLi : List Data.Town -> List (Html Msg)
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
    ul [id "towns"] (townsLi Data.towns)
