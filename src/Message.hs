module Message (
    Message (..),
    receiver,
    sendMessage,
    countMessage
    ) where

import User
import Control.Concurrent
import System.Random

-- | Define a type Message, each has a message of type String, a senderid of type Int
-- | and a receiverid of type Int
data Message = {
    message :: String,
    senderId :: Int,
    receiverId :: Int
    } deriving (Show)

-- | Select a random receiver we send the message to
receiver :: Int -> IO Int
receiver sendId = do
    randomId <- randomRIO (1, 10) :: IO Int
    if randomId == sendId then receiver sendId else return randomId
    
-- | Start send message
sendMessage :: MVar [Message] -> Int -> IO ()
sendMessage box sendId = do
    t <- randomRIO (0, 1000) :: IO Int
    threadDelay t
    receiveId <- receiver sendId
    let messages = Message { message = "", senderId = sendId, receiverId = receiveId }
    m <- takeMVar box
    putMVar box ([messages] ++ m)
    putStrLn $ "Send " ++ (show messages)
    
-- | Count the total number of messages each user received
countMessage :: [Message] -> User -> IO ()
countMessage ms user = do
    let totalMessage = length $ filter (\someone -> someone receiveId == user userId )
    putStrLn $ (userName user) ++ (show userId) ++ " received " ++ (show totalMessage) ++ " messages in total."
