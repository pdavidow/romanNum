module Main 
    where
    
import System.IO
import RomanNumeralMapper (toRoman, minN, maxN)

main :: IO ()
main = do
    putStrLn $ "Enter number (" ++ show minN ++ " to " ++ show maxN ++ "): "
    eof <- isEOF
    if not eof
        then do
            inpStr <- getLine
            n <- readIO inpStr :: IO Int

            case toRoman n of
                Right roman -> do
                    putStrLn roman

                Left err -> do
                    putStrLn $ "ERROR: " ++ err
            main
        else putStr ""