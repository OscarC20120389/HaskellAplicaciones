module FizzBuzz where

import Data.List (intercalate)

-- Función para convertir números a palabras en español
numeroEnPalabras :: Int -> String
numeroEnPalabras n
    | n == 0 = "cero"
    | n < 0 = "menos " ++ numeroEnPalabras (-n)
    | n < 20 = numerosHastaVeinte !! n
    | n < 100 = decenas !! (n `div` 10) ++ " " ++ numeroEnPalabras (n `mod` 10)
    | n < 1000 && n `mod` 100 == 0 = unidades !! (n `div` 100) ++ "cientos"
    | n < 1000 = unidades !! (n `div` 100) ++ " cientos " ++ numeroEnPalabras (n `mod` 100)
    | otherwise = let (m, resto) = n `divMod` 1000
                  in (if m == 1 then "" else numeroEnPalabras m ++ " ") ++ "mil " ++
                     numeroEnPalabras resto

-- Función para determinar si un número es primo
esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | n == 2 = True
    | n `mod` 2 == 0 = False
    | otherwise = all (\x -> n `mod` x /= 0) [3,5..floor (sqrt (fromIntegral n))]

-- Función principal que devuelve "FizzBuzz!" si es primo, de lo contrario, devuelve el número en palabras
fizzBuzzOEnPalabras :: Int -> String
fizzBuzzOEnPalabras n
    | esPrimo n = "FizzBuzz!"
    | otherwise = numeroEnPalabras n

-- Lista de palabras para números hasta 20
numerosHastaVeinte :: [String]
numerosHastaVeinte = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez",
                      "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho", "diecinueve"]

-- Lista de palabras para unidades
unidades :: [String]
unidades = ["", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"]

-- Lista de palabras para decenas
decenas :: [String]
decenas = ["", "diez", "veinti", "treinta y", "cuarenta y", "cincuenta y", "sesenta y", "setenta y", "ochenta y", "noventa y"]
