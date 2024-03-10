module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Bowling

tests :: [(String, [Int], [Frame])]
tests =
  [ ("zeros are open 0 0"
    , replicate 20 0
    , replicate 10 (Open 0 0)
    )
    , ("ones are open 1 1"
    , replicate 20 1
    , replicate 10 (Open 1 1)
    )
    , ("4+5s are open 4 5"
    , take 20 $ cycle [4, 5]
    , replicate 10 (Open 4 5)
    )
  ]

bowlingSuite :: TestTree
bowlingSuite = testGroup "Bowling tests"
  [ testGroup "toFrames" $ map (\(label, input, expected) ->
    testCase label $ toFrames input @?= expected) tests
  ]

main :: IO ()
main = defaultMain bowlingSuite

-- import Test.Tasty
-- import Test.Tasty.HUnit
-- import FizzBuzz

-- lessThan20Answers = words ("one two three four five six seven eight nine ten " ++
--   "eleven twelve thirteen fourteen fifteen sixteen " ++
--   "seventeen eighteen nineteen")

-- tensAnswers = words "twenty thirty forty fifty sixty seventy eighty ninety"
-- fizzBuzzSuite :: TestTree
-- fizzBuzzSuite = testGroup "FizzBuzz tests"
--   [ testGroup "fizzbuzz" $
--       [ testCase "1 is one!" $ fizzbuzz 1 @?= "one!"
--       , testCase "2 is two!" $ fizzbuzz 2 @?= "two!"
--       ]
--     , testGroup "lessThan20" $
--     map ( \(n, t) -> testCase (show n ++ " is " ++ t) $ lessThan20 n @?= t)
--     (zip [1..] lessThan20Answers)
--     , testGroup "tens" $
--     map ( \(n, t) -> testCase (show n ++ " is " ++ t) $ tens n @?= t)
--       (zip [2..] tensAnswers)
--   ]

-- main :: IO ()
-- main = defaultMain fizzBuzzSuite