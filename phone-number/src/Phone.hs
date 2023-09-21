module Phone (number) where

import Data.Char (isDigit)
import Control.Monad ( (<=<), (>=>))
import Control.Arrow ( (>>>) )
import Data.List.NonEmpty ( NonEmpty(..), length, nonEmpty, toList)
import qualified Data.List.NonEmpty as N

removeIfOneIsFirst :: NonEmpty Char -> Maybe (NonEmpty Char)
removeIfOneIsFirst ('1' :| el) = nonEmpty el
removeIfOneIsFirst x = Just x

checkLength :: NonEmpty Char -> Maybe (NonEmpty Char)
checkLength tel = if N.length tel == 10 then Just tel else Nothing

checkCodeArea :: NonEmpty Char -> Maybe (NonEmpty Char)
checkCodeArea tel@(t :| _) = if t `elem` "01" then Nothing else Just tel

checkExchangeCode :: NonEmpty Char -> Maybe (NonEmpty Char)
checkExchangeCode (_ :| _ : _ : '0' : _) = Nothing
checkExchangeCode (_ :| _ : _ : '1' : _) = Nothing
checkExchangeCode tel = Just tel

number :: String -> Maybe String
-- number = (toList <$>) . checkExchangeCode <=< checkCodeArea <=< checkLength <=< removeIfOneIsFirst <=< nonEmpty . filter isDigit
number = filter isDigit >>> nonEmpty >=> removeIfOneIsFirst >=> checkLength >=> checkCodeArea >=> checkExchangeCode >>> (toList <$>)