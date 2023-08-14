module Phone (number) where

import Data.Char (isDigit)
import Control.Monad ( (<=<) )

-- to review

removeIfOneIsFirst :: String -> String
removeIfOneIsFirst tel = if length tel == 11 && head tel == '1' then tail tel else tel

checkLength :: String -> Maybe String
checkLength tel = if length tel == 10 then Just tel else Nothing

checkCodeArea :: String -> Maybe String
checkCodeArea tel = if head tel `elem` "01" then Nothing else Just tel

checkExchangeCode :: String -> Maybe String
checkExchangeCode tel = if tel !! 3 `elem` "01" then Nothing else Just tel

number :: String -> Maybe String
number = checkExchangeCode <=< (checkCodeArea <=< (checkLength . removeIfOneIsFirst . filter isDigit))
