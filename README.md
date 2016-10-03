# elm-leaflet
This is an example showing how integrate Leaflet via Elm's ports.

## Goal
- Display a Html town's list from Elm's data
- Display an OSM map of a specific town
- Place some markers for each town
- Change map by clicking on town's list

- All data are store in Elm's records


## Transpile JS to Elm

```bash
$ elm-make Leaflet.elm --output build/elm-Leaflet.js
```