module User (
    someFunc
    ) where

import Control.Concurrent

data User = User {
    name :: String,
    id :: Int
    } deriving (Show, Eq)
