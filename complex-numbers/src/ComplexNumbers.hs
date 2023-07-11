module ComplexNumbers
(Complex,
 conjugate,
 abs,
 exp,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs, exp)

-- Data definition -------------------------------------------------------------
data Complex a = Complex a a deriving(Eq, Show)

complex :: (a, a) -> Complex a
complex (x, y) = Complex x y

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate (Complex a b) = Complex a (-b)

abs :: Floating a => Complex a -> a
abs (Complex a b) = sqrt(a^2 + b^2 )

real :: Num a => Complex a -> a
real (Complex a _) = a

imaginary :: Num a => Complex a -> a
imaginary (Complex _ b) = b

exp :: Floating a => Complex a -> Complex a
exp (Complex x y) = Complex (myExp x * cos y) (myExp x * sin y)
    where
        myExp :: Floating a => a -> a
        myExp = (**) 2.718281828459045

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul (Complex a b) (Complex x y) = Complex (a * x - b * y) (a * y + b * x)

add :: Num a => Complex a -> Complex a -> Complex a
add (Complex a b) (Complex x y) = Complex (a + x) (b + y)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Complex a b) (Complex x y) = Complex (a - x) (b - y)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Complex a b) (Complex x y) = Complex ((a * x + b * y)/(x^2 + y^2)) ((b * x - a * y)/(x^2 + y^2))
