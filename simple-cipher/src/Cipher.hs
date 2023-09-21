module Cipher (caesarDecode, caesarEncode, caesarEncodeRandom) where

import Data.Char (ord, chr)
import Test.QuickCheck (choose, generate)

decodeChar :: Char -> Char -> Char
decodeChar key toCode = chr (ord 'a' + ((ord toCode - ord key + 26) `rem` 26))

caesarDecode :: String -> String -> String
caesarDecode key = zipWith ($) (map decodeChar (key ++ repeat (last key))) 

encodeChar :: Char -> Char -> Char
encodeChar key toCode = chr (ord 'a' + (ord toCode - ord 'a' + ord key - ord 'a') `rem` 26)

caesarEncode :: String -> String -> String
caesarEncode key = zipWith ($) (map encodeChar (key ++ repeat (last key))) 

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom text = do
    key <- sequenceA [generate $ choose('a', 'z') | _ <- [1..length text]]
    let encoded = caesarEncode key text
    return (key, encoded)
