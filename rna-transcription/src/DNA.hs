module DNA (toRNA) where

complement :: Char -> Either Char Char
complement 'G' = Right 'C'
complement 'C' = Right 'G'
complement 'T' = Right 'A'
complement 'A' = Right 'U'
complement inappropriateLetter = Left inappropriateLetter

toRNA :: String -> Either Char String
toRNA = traverse complement

