module Go.View where

import Html exposing (..)
import Html.Attributes exposing (..)

import Go.Model exposing (Game, Action)


view : Signal.Address Action -> Game -> Html
view address game =
    div [ class "board" ] <| boardCells game

boardCells : Game -> List Html
boardCells game = row game "top" ++ middleRows game ++ row game "bottom"

row : Game -> String -> List Html
row game classPrefix =
    let middleRowClassName = case classPrefix of
                                 "middle" -> Nothing
                                 x -> Just x
    in
        [ cell <| classPrefix ++ "-left" ]
          ++ middleCells game middleRowClassName
          ++ [ cell <| classPrefix ++ "-right" ]

middleCells : Game -> Maybe String -> List Html
middleCells game mprefix =
    let className = case mprefix of
                        Just prefix -> prefix ++ "-middle"
                        Nothing -> "middle"
    in
        List.repeat (game.board.dimensions - 2) (cell className)

middleRows : Game -> List Html
middleRows game = List.concat <| List.repeat (game.board.dimensions - 2) (row game "middle")

cell : String -> Html
cell className = div [ class <| "cell " ++ className ] []
