module Go where

import Html
import StartApp.Simple as StartApp

import Go.Model exposing (initialGame)
import Go.View exposing (view)
import Go.Update exposing (update)


main : Signal Html.Html
main =
  StartApp.start
    { model = initialGame
    , view = view
    , update = update
    }
