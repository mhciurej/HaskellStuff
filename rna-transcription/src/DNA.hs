module DNA (toRNA) where

complement :: Char -> Either Char String -> Either Char String
complement 'G' (Right str) = Right ('C':str)
complement 'C' (Right str) = Right ('G':str)
complement 'T' (Right str) = Right ('A':str)
complement 'A' (Right str) = Right ('U':str)
complement _ (Left char) = Left char
complement inappropriateLetter _ = Left inappropriateLetter

toRNA :: String -> Either Char String
toRNA = foldr complement (Right "")
        
