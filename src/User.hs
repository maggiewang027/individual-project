module User (
    User (..),
    generateUsers
    ) where

-- | Define a type User, each user has a username of type String and a userid of type Int
data User = User {
    userName :: String,
    userId :: Int
    } deriving (Show)

-- | Declare 10 users
let
    user1 = User { userName = "@tom123", userId = 1 }
    user2 = User { userName = "@maggie999", userId = 2 }
    user3 = User { userName = "@eliza315", userId = 3 }
    user4 = User { userName = "@jeremy01", userId = 4 }
    user5 = User { userName = "@john1996", userId = 5 }
    user6 = User { userName = "@qianyi0706", userId = 6 }
    user7 = User { userName = "@marykim6", userId = 7 }
    user8 = User { userName = "@miyeon09", userId = 8 }
    user9 = User { userName = "@rhea888", userId = 9 }
    user10 = User { userName = "@robertmay20", userId = 10 }
userList :: [User]
userList = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
