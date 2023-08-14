{-# LANGUAGE TupleSections #-}
module SecretHandshake (handshake) where

import Data.Bits ((.&.))

data Action = Wink | DoubleBlink | CloseEyes | Jump | Reverse deriving Enum

-- to review

addIf :: Int -> String -> (Int, [String]) -> (Int, [String])
addIf actionCode action (code, actions) = 
    case actionCode .&. code of
        0 -> (code, actions)
        _ -> (code, action:actions)

wink :: (Int, [String]) -> (Int, [String])
wink = addIf 1 "wink"

doubleBlink :: (Int, [String]) -> (Int, [String])
doubleBlink = addIf 2 "double blink"

closeYourEyes :: (Int, [String]) -> (Int, [String])
closeYourEyes = addIf 4 "close your eyes"

jump :: (Int, [String]) -> (Int, [String])
jump = addIf 8 "jump"

reverseOrder :: (Int, [String]) -> [String]
reverseOrder (code, actions) = if code .&. 16 /= 0 then reverse actions else actions

handshake :: Int -> [String]
handshake = reverse . reverseOrder . jump . closeYourEyes . doubleBlink . wink . (,[])
