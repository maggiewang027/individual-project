module Main where

import User
import Message
import Control.Monad
import Control.Concurrent
import System.Random

threadNumber = 10
initialMessage = []

main :: IO ()
main = do
    box <- newMVar initialMessage
    putStrLn "----------------------------------------------------"
    putStrLn "Start sending 100 random messages..."
    putStrLn "----------------------------------------------------"
    mapM_ (\ids -> forkIO (replicateM_ threadNumber (sendMessage box ids))) [1..10]
    putStrLn "----------------------------------------------------"
    putStrLn "Finished sending messages."
    putStrLn "----------------------------------------------------"
    threadDelay (100000)
    ms <- readMVar box
    putStrLn "----------------------------------------------------"
    putStrLn "Start printing total number of messages of each user..."
    putStrLn "----------------------------------------------------"
    mapM_ (countMessage ms) userList
    putStrLn "----------------------------------------------------"
    putStrLn "Finished printing."
    putStrLn "----------------------------------------------------"
