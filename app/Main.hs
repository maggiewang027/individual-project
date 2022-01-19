module Main where

import User
import Message
import Control.Monand
import Control.Concurrent
import System.Random

main :: IO ()
main = do
    box <- newMVar []
    putStrLn "Start sending messages..."
    mapM_ (\ids -> forkIO (replicateM_ 10 (sendMessage box ids))) [1..10]
    messages <- readMVar box
    putStrLn "Start printing total number of messages of each user..."
    mapM_ (countMessage ms) userList
    putStrLn "Finished."
