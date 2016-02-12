module Go.View where

import Html exposing (..)
import Html.Attributes exposing (..)

import Go.Model exposing (Game, Action)


view : Signal.Address Action -> Game -> Html
view address game =
    div [ class "board" ]
        ((topRow game) ++ (middleRows game) ++ (bottomRow game))
        -- , middleRows game
        -- , bottomRow game

topRow : Game -> List Html
topRow game = [ cell "top-left" ] ++ topMiddle game ++ [ cell "top-right" ]

bottomRow : Game -> List Html
bottomRow game = [ cell "bottom-left" ] ++ bottomMiddle game ++ [ cell "bottom-right" ]

topMiddle : Game -> List Html
topMiddle game = List.repeat (game.board.dimensions - 2) (cell "top-middle")

bottomMiddle : Game -> List Html
bottomMiddle game = List.repeat (game.board.dimensions - 2) (cell "bottom-middle")

middleRows : Game -> List Html
middleRows game = List.concat <| List.repeat (game.board.dimensions - 2) (middleRow game)

middleRow : Game -> List Html
middleRow game = [ cell "middle-left" ] ++ middle game ++ [ cell "middle-right" ]

middle : Game -> List Html
middle game = List.repeat (game.board.dimensions - 2) (cell "middle")

cell : String -> Html
cell className = div [ class className ] []

-- middleRows : Game -> Html
-- middleRows game = div [] []
--
-- bottomRow : Game -> Html
-- bottomRow game = div [] []
