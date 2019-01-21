module RomanNumeralMapper
    ( toRoman
    , minN
    , maxN
    )
    where

import Data.List (find)

type Err = String
type Roman = String

minN :: Int
minN = 1


maxN :: Int
maxN = 3999


romans :: [ (Int, Roman) ]
romans =
    [ (1000, "M")   
    , (900, "CM")
    , (500, "D")
    , (400, "CD") 
    , (100, "C")
    , (90, "XC")
    , (50, "L")
    , (40, "XL")
    , (10, "X")
    , (9, "IX")
    , (5, "V")
    , (4, "IV")
    , (1, "I")
    ]  

                       
toRoman :: Int -> Either Err Roman        
toRoman n = 
    case n < minN || n > maxN of
        True ->
            Left $ show minN ++ " <= N <= " ++ show maxN

        False ->
            let
                recurse :: Int -> Roman -> Roman
                recurse c r =
                    case find (\ (k, _) -> c >= k) romans of
                        Just (k, v) -> recurse (c - k) (r ++ v)
                        Nothing -> r
            in
                Right $ recurse n ""