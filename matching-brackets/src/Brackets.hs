module Brackets (arePaired) where

handleParenthesis :: Char -> String -> Maybe String
handleParenthesis sign par
    | sign `elem` "([{" = Just (sign:par)
    | sign == ')' && par /= [] && head par == '(' = Just $ tail par
    | sign == ']' && par /= [] && head par == '[' = Just $ tail par
    | sign == '}' && par /= [] && head par == '{' = Just $ tail par
    | otherwise = Nothing

arePaired :: String -> Bool
arePaired = allParenthesesClosed . foldl parenthesisCorrect (Just []) . filter (`elem` "()[]{}")

allParenthesesClosed :: Maybe String -> Bool
allParenthesesClosed = maybe False (== [])
parenthesisCorrect :: Maybe String -> Char -> Maybe String
parenthesisCorrect par sign = 
    case par of
        Nothing -> Nothing
        (Just str) -> handleParenthesis sign str
        


