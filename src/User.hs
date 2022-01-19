module User (
    User (..),
    generateUsers
    ) where

-- | Define a type User, each user has a username of type String and a userid of type Int
data User = User {
    username :: String,
    userid :: Int
    } deriving (Show)

-- | Declare 10 users
let
    user1 = User { username = "@tom123", userid = 1 }
    user2 = User { username = "@maggie999", userid = 2 }
    user3 = User { username = "@eliza315", userid = 3 }
    user4 = User { username = "@jeremy01", userid = 4 }
    user5 = User { username = "@john1996", userid = 5 }
    user6 = User { username = "@qianyi0706", userid = 6 }
    user7 = User { username = "@marykim6", userid = 7 }
    user8 = User { username = "@miyeon09", userid = 8 }
    user9 = User { username = "@rhea888", userid = 9 }
    user10 = User { username = "@robertmay20", userid = 10 }
userList :: [User]
userList = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
