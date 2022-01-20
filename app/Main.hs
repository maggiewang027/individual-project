module Main where

import User
import Message
import Control.Monad
import Control.Concurrent
import System.Random

-- | Initial the number of thread to 10
threadNumber = 10

-- | Initial the MVar of empty list [] which stores the messages
initialMessage :: IO (MVar [Message])
initialMessage = do
    ims <- newMVar []
    return ims

main :: IO ()
main = do
    box <- initialMessage
    putStrLn "-------------------------------------------------------"
    putStrLn "Welcome to the social network app!"
    putStrLn "Start sending 100 random messages..."
    putStrLn "-------------------------------------------------------"
    mapM_ (\ids -> forkIO (replicateM_ threadNumber (sendMessage box ids))) [1..10]
    threadDelay 100000
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished sending messages."
    putStrLn "Start printing total number of messages of each user..."
    putStrLn "-------------------------------------------------------"
    let users = userList
    ms <- readMVar box
    mapM_ (countMessage ms) users
    putStrLn $ "There are " ++ (show $ length ms) ++ " messages for all the " ++ (show $ length users) ++ " users in total."
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished printing."
    putStrLn "Thank you for using the app!"
    putStrLn "-------------------------------------------------------"
