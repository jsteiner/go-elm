module Go.Update where

import Go.Model exposing (..)


update : Action -> Game -> Game
update action game =
  case action of
    PlaceStone i ->
      let player = case game.currentPlayer of
                     Black -> game.black
                     White -> game.white
          player' = { player | stones = player.stones ++ [Stone i] }
      in
        case game.currentPlayer of
          Black -> { game | black = player', currentPlayer = White }
          White -> { game | white = player', currentPlayer = Black }
