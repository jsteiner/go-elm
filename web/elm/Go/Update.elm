module Go.Update where

import Go.Model exposing (..)


update : Action -> Game -> Game
update action game =
    case action of
        PlaceStone i ->
            let player = game.black
                player' = { player | stones = player.stones ++ [Stone i] }
            in
                { game | black = player' }
