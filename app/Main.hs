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
    -- both mapM_ and replicateM_ discard the results
    mapM_ (\ids -> forkIO $ replicateM_ threadNumber (sendMessage ids box)) [1..10]
    -- delay before printing the users' details
    threadDelay 100000
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished sending messages."
    putStrLn "Start printing total number of messages of each user..."
    putStrLn "-------------------------------------------------------"
    -- obtain the list of users we generated in User.hs
    let users = userList
    -- obtain the list of messages we generated in Message.hs
    ms <- readMVar box
    -- print all the users' details
    mapM_ (countMessage ms) users
    putStrLn $ "There are " ++ (show $ length ms) ++ " messages for all the " ++ (show $ length users) ++ " users in total."
    putStrLn "-------------------------------------------------------"
    putStrLn "Finished printing."
    putStrLn "Thank you for using the app!"
    putStrLn "-------------------------------------------------------"
