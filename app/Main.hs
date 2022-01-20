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
    putStrLn "Start sending messages..."
    mapM_ (\ids -> forkIO (replicateM_ threadNumber (sendMessage box ids))) [1..10]
    threadDelay (110000)
    ms <- readMVar box
    putStrLn "Start printing total number of messages of each user..."
    mapM_ (countMessage ms) userList
    putStrLn "Finished."
