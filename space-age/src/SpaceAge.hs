module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn:: Planet -> Float -> Float
ageOn pl = (/1000.0) . myRound . (*31.68808781402895) . (/1000000.0) . ageOn' pl 
    where
        myRound :: Float -> Float
        myRound = fromIntegral . round

ageOn' :: Planet -> Float -> Float
ageOn' Mercury = (/0.2408467)
ageOn' Venus = (/0.61519726)
ageOn' Earth = id
ageOn' Mars = (/1.8808158)
ageOn' Jupiter = (/11.862615)  
ageOn' Saturn = (/29.447498)
ageOn' Uranus = (/84.016846)  
ageOn' Neptune = (/164.79132) 
