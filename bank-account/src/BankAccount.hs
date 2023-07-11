module BankAccount
    ( BankAccount
    , closeAccount
    , getBalance
    , incrementBalance
    , openAccount
    ) where

data BankAccount = Closed | Value Integer

closeAccount :: BankAccount -> IO ()
closeAccount account = return ()

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance Closed = return Nothing
getBalance (Value n) = return $ Just n

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance Closed _ = return Nothing
incrementBalance (Value n) x = return $ Just $ n + x

openAccount :: IO BankAccount
openAccount = return $ Value 0
