module SecretHandshake (handshake) where

data Action = Wink | DoubleBlink | CloseEyes | Jump | Reverse deriving Enum

toBinary :: Int -> [Int] -> [Int]
toBinary 0 acc = reverse acc
toBinary n acc = toBinary (n `div` 2) (n `mod` 2:acc)

intToActions :: Int -> [Action] -> [Action]
intToActions 0 acc = reverse acc


handshake :: Int -> [String]
handshake n = error "You need to implement this function."
