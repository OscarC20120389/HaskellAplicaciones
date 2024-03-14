import Test.Tasty
import Test.Tasty.HUnit
import FizzBuzz

fizzBuzzSuite :: TestTree
fizzBuzzSuite = testGroup "FizzBuzz tests"
  [ testCase "Prueba con número primo" $
      fizzBuzzOEnPalabras 17 @?= "FizzBuzz!"
  , testCase "Prueba con número no primo" $
      fizzBuzzOEnPalabras 178 @?= "ciento setenta y ocho"
  , testCase "Prueba con número cero" $
      fizzBuzzOEnPalabras 0 @?= "cero"
  , testCase "Prueba con número negativo" $
      fizzBuzzOEnPalabras (-10) @?= "menos diez"
  , testCase "Prueba con número veinte" $
      fizzBuzzOEnPalabras 20 @?= "veinte"
  , testCase "Prueba con número veintiuno" $
      fizzBuzzOEnPalabras 21 @?= "veintiuno"
  , testCase "Prueba con número cien" $
      fizzBuzzOEnPalabras 100 @?= "cien"
  , testCase "Prueba con número mil" $
      fizzBuzzOEnPalabras 1000 @?= "mil"
  , testCase "Prueba con número no primo grande" $
      fizzBuzzOEnPalabras 987654 @?= "novecientos ochenta y siete mil seiscientos cincuenta y cuatro"
  ]

main :: IO ()
main = defaultMain fizzBuzzSuite
