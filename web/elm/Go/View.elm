module Go.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Go.Model exposing (..)


view : Signal.Address Action -> Game -> Html
view address game =
  div []
      [ div [ class "board" ] <| boardCells address game
      , currentPlayerText game
      ]

currentPlayerText : Game -> Html
currentPlayerText {currentPlayer} =
  case currentPlayer of
    White -> text "White's turn"
    Black -> text "Black's turn"

boardCells : Signal.Address Action -> Game -> List Html
boardCells address ({board} as game) =
  let n = tiles board
  in
    List.map (cell address game) [0..n]

tiles : Board -> Int
tiles {dimensions} = (dimensions ^ 2) - 1

cell : Signal.Address Action -> Game -> Int -> Html
cell address game i =
  let className = prefix i ++ "-" ++ suffix i
      events = if hasAnyStone game i then
                 []
               else
                 [onClick address <| PlaceStone i]
  in
    div ([ classList [ ("cell", True)
                    , (className, True)
                    , ("white", hasStone White game i)
                    , ("black", hasStone Black game i)
                    ]
        ] ++ events)
        []

suffix : Int -> String
suffix i =
  if i % 9 == 0 then
    "left"
  else if i % 9 == 8 then
    "right"
  else
    "middle"

prefix : Int -> String
prefix i =
  if i < 9 then
    "top"
  else if i > 71 then
    "bottom"
  else
    "middle"

hasAnyStone : Game -> Int -> Bool
hasAnyStone game i = hasStone White game i || hasStone Black game i

hasStone : CurrentPlayer -> Game -> Int -> Bool
hasStone currentPlayer game i =
  let stones = case currentPlayer of
                 Black -> game.black.stones
                 White -> game.white.stones
  in
    List.member (Stone i) stones
