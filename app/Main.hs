module Main where

import User
import Message
import Control.Monad
import Control.Concurrent
import System.Random

-- | Initial the constants we will use
threadNumber = 10
initialMessage = 1

main :: IO ()
main = do
    users <- userList
    box <- newMVar initialMessage
    putStrLn "-------------------------------------------------------"
    putStrLn "Welcome to the social network app!"
    putStrLn "Start sending 100 random messages..."
    putStrLn "-------------------------------------------------------"
    mapM_ (\ids -> forkIO (replicateM_ threadNumber (sendMessage box ids))) [1..10]
    threadDelay 100000
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished sending messages."
    putStrLn "-------------------------------------------------------"
    putStrLn "Start printing total number of messages of each user..."
    putStrLn "-------------------------------------------------------"
    ms <- readMVar box
    mapM_ (countMessage ms) users
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished printing."
    putStrLn "Thank you for using the app!"
    putStrLn "-------------------------------------------------------"
