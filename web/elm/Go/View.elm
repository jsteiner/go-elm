module Go.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Go.Model exposing (..)


view : Signal.Address Action -> Game -> Html
view address game =
    div []
      [ div [ class "board" ] <| boardCells address game
      ]

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
    in
        div [ classList [("cell", True), (className, True), ("black", isBlack game i)]
            , onClick address <| PlaceStone i
            ]
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

isBlack : Game -> Int -> Bool
isBlack {black} i = List.member (Stone i) black.stones
