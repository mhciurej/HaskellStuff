module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where

import Control.Concurrent.STM

type BankAccount = TVar (Maybe Integer)

--to review

closeAccount :: BankAccount -> IO ()
closeAccount account = atomically $ do
    writeTVar account Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance = readTVarIO

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = atomically $ do
    modifyTVar' account ((amount+) <$>)
    readTVar account

openAccount :: IO BankAccount
openAccount = newTVarIO (Just 0)
