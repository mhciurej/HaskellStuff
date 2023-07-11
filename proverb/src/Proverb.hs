module Proverb(recite) where

recite :: [String] -> String
recite (x:xs) = (reverse $ foldl sentence [] (comb (x:xs)))
    where
        comb :: [String] -> [(String, String)]
        comb (a:ab) = zip (a:ab) (ab ++ [a])

        sentence :: [String] -> [(String, String)] -> [String]
        sentence acc [] = acc
        sentence acc [(_, second)] = ("And all for the want of a " ++ second ++ "."):acc
        sentence acc ((first, second):xs) = ("For want of a " ++ first ++ " the " ++ second ++ " was lost."):acc

--foldr (\elem acc -> (elem ++ "\n"):acc) [] 