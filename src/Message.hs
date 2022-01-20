module Message (
    Message (..),
    sendMessage,
    countMessage
    ) where

import User
import Control.Concurrent
import System.Random

-- | Define a type Message, each has a message of type String, a senderid of type Int and a receiverid of type Int
data Message = Message {
    message :: String,
    senderId :: Int,
    receiverId :: Int
    } deriving (Show)

-- | Transfer a list of messages from the .txt document
messageList :: FilePath -> IO [String]
messageList filename = do
    text <- readFile filename
    return $ lines text
    
-- | Select a random message from the list of messages we generated
selectMessage :: [String] -> IO String
selectMessage randomMessage = do
    rMessage <- randomRIO (1, (length randomMessage - 1)) :: IO Int
    let rText = randomMessage !! rMessage
    return rText

-- | Select a random receiver we send the message to
receiver :: Int -> IO Int
receiver sendId = do
    randomId <- randomRIO (1, 10) :: IO Int
    if randomId /= sendId then return randomId else receiver sendId

-- | Start sending message
sendMessage :: Int -> MVar [Message] -> IO ()
sendMessage sendId box = do
    t <- randomRIO (10, 1000) :: IO Int
    threadDelay t
    -- obtain a random receiver from function receiver
    receiveId <- receiver sendId
    -- first load the .txt document
    -- obtain a random message from function selectMessage
    randomText <- selectMessage =<< messageList "randomMessage.txt"
    let messages = Message { message = randomText, senderId = sendId, receiverId = receiveId }
    m <- takeMVar box
    putMVar box ([messages] ++ m)
    putStrLn $ "Send " ++ (show messages)
    
-- | Count the total number of messages each user received
countMessage :: [Message] -> User -> IO ()
countMessage ms user = do
    let totalMessage = length $ filter (\someone -> receiverId someone == userId user ) ms
    putStrLn $ "User " ++ (userName user) ++ " with user id " ++ (show $ userId user) ++ " receives " ++ (show totalMessage) ++ " messages in total."
