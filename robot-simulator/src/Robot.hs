module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North | East | South | West deriving (Eq, Show)

data Robot = Robot Bearing (Integer, Integer)

advanceRobot :: Robot -> Robot
advanceRobot (Robot North (x, y)) = Robot North (x, y+1)
advanceRobot (Robot East (x, y)) = Robot East (x+1, y)
advanceRobot (Robot South (x, y)) = Robot South (x, y-1)
advanceRobot (Robot West (x, y)) = Robot West (x-1, y)

bearing :: Robot -> Bearing
bearing (Robot x _) = x

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ pos) = pos

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move robot "" = robot
move robot ('A':rest) = move (advanceRobot robot) rest
move robot (x:rest) = move (turnRobot robot x) rest

turnRobot :: Robot -> Char -> Robot
turnRobot (Robot North pos) 'L' = Robot West pos
turnRobot (Robot East pos) 'L' = Robot North pos
turnRobot (Robot South pos) 'L' = Robot East pos
turnRobot (Robot West pos) 'L' = Robot South pos
turnRobot (Robot North pos) _ = Robot East pos
turnRobot (Robot East pos) _ = Robot South pos
turnRobot (Robot South pos) _ = Robot West pos
turnRobot (Robot West pos) _ = Robot North pos
