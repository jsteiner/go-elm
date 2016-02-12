module Go.Model where

type alias Game =
    { board: Board
    , black: Player
    , white: Player
    }

type alias Board =
    { dimensions: Int
    }

type alias Player =
    { stones: List Stone
    }

type alias Stone =
    { i: Int
    }

type Action = PlaceStone Int


initialGame : Game
initialGame =
    { board = { dimensions = 9 }
    , black = { stones = [] }
    , white = { stones = [] }
    }
