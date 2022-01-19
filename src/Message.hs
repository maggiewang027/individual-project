module Message (
    emptyMVar
    ) where

import Control.Concurrent
import System.Random

-- | Create a list of empty MVars to store the number of messages each user received
emptyMessage :: IO [MVar Int]
emptyMessage = do
    box1 <- newEmptyMVar
    box2 <- newEmptyMVar
    box3 <- newEmptyMVar
    box4 <- newEmptyMVar
    box5 <- newEmptyMVar
    box6 <- newEmptyMVar
    box7 <- newEmptyMVar
    box8 <- newEmptyMVar
    box9 <- newEmptyMVar
    box10 <- newEmptyMVar
    return [box1, box2, box3, box4, box5, box6, box7, box8, box9, box10]
    
linkUserMessage :: (MVar Int, Int) -> IO ()
linkUserMessage (user, message) = do 
    putMVar user message
