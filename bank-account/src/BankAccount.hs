module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where

import Control.Concurrent.STM

type BankAccount = TVar Integer

closeAccount :: BankAccount -> IO ()
closeAccount _ = return ()

getBalance :: BankAccount -> IO Integer
getBalance acc = do
    readTVarIO acc

incrementBalance :: BankAccount -> Integer -> STM ()
incrementBalance acc amount = do
    modifyTVar acc (+amount)

openAccount :: STM ()
openAccount = return 0
