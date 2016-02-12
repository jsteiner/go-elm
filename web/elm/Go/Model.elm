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
    { x: Int
    , y: Int
    }

type Action = Foo


initialGame : Game
initialGame =
    let board = { dimensions = 9 }
        black = { stones = [] }
        white = { stones = [] }
    in
        { board = board
        , black = black
        , white = white
        }
