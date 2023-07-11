module WordProblem (answer) where

answer :: String -> Maybe Integer
answer problem
    | take (len "What is ") problem /= "What is " = Nothing
    | 
