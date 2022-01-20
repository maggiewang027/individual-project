module Main where

import User
import Message
import Control.Monad
import Control.Concurrent
import System.Random

-- | Initial the constants we will use
threadNumber = 10
initialMessage = []

main :: IO ()
main = do
    let users = userList
    box <- newMVar initialMessage
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
    ms <- readMVar box
    mapM_ (countMessage ms) users
    putStrLn $ "There are " ++ (show $ length ms) ++ " messages for all the 10 users in total."
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished printing."
    putStrLn "Thank you for using the app!"
    putStrLn "-------------------------------------------------------"
