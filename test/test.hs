import Test.Tasty
import Test.Tasty.HUnit

import RomanNumeralMapper (toRoman)

main = defaultMain tests
  
tests :: TestTree
tests = testGroup "Tests" [unitTests] 

unitTests = testGroup "Unit tests" $
    [ testGroup "Roman Numerals" $
        [ testCase "1" $
            toRoman 1  @?= Right "I"   

        , testCase "2" $
            toRoman 2  @?= Right "II"  

        , testCase "3" $
            toRoman 3 @?= Right "III"            

        , testCase "4" $
            toRoman 4  @?= Right "IV"     

        , testCase "5" $
            toRoman 5  @?= Right "V"  
            
        , testCase "6" $
            toRoman 6  @?= Right "VI"  

        , testCase "24" $
            toRoman 24 @?= Right "XXIV"   

        , testCase "39" $
            toRoman 39 @?= Right "XXXIX"   

        , testCase "44" $
            toRoman 44 @?= Right "XLIV"   

        , testCase "49" $
            toRoman 49 @?= Right "XLIX"   
            
        , testCase "73" $
            toRoman 73  @?= Right "LXXIII"  

        , testCase "94" $
            toRoman 94  @?= Right "XCIV" 

        , testCase "99" $
            toRoman 99  @?= Right "XCIX"  

        , testCase "296" $
            toRoman 296 @?= Right "CCXCVI"   

        , testCase "444" $
            toRoman 444  @?= Right "CDXLIV"  

        , testCase "999" $
            toRoman 999  @?= Right "CMXCIX"       
   
        , testCase "3001" $
            toRoman 3001  @?= Right "MMMI"   

        , testCase "3992" $
            toRoman 3992 @?= Right "MMMCMXCII"              
            
        , testCase "3999" $
            toRoman 3999  @?= Right "MMMCMXCIX"          

        , testCase "fail 1" $
            toRoman 4000  @?= (Left "1 <= N <= 3999")  
            
        , testCase "fail 2" $
            toRoman 0  @?= (Left "1 <= N <= 3999")    

        , testCase "fail 3" $
            toRoman (-3)  @?= (Left "1 <= N <= 3999")              
        ]
    ]