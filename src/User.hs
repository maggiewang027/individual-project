module User (
    User (..)
    ) where

import Control.Concurrent

-- | Define a data type User, each user has a username of type String
data User = User {
    username :: String
    } deriving (Show)

-- | Declare 10 users
let
    user1 = User { username = "@tom123" }
    user2 = User { username = "@maggie999" }
    user3 = User { username = "@eliza315" }
    user4 = User { username = "@jeremy01" }
    user5 = User { username = "@john1996" }
    user6 = User { username = "@qianyi0706" }
    user7 = User { username = "@marykim6" }
    user8 = User { username = "@miyeon09" }
    user9 = User { username = "@rhea888" }
    user10 = User { username = "@robertmay20" }
generateUsers :: [User]
generateUsers = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
