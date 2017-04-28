import System.IO
import Control.Monad

main = main' 0
main' counter = do
 p <- hIsEOF stdin
 -- to swap above line to IsEOF requires extra import
 unless p $ do
  x <- getLine
  let newLength = length x
  let ellipsis = if newLength > 50 then "..." else ""
-- display shows line count starting at 1
-- need to allow say 3 digit space : 001 with leading zero supression
  let message = show (counter + 1) ++ " " ++ show newLength ++ " " ++ take 50 x ++ ellipsis
  putStrLn message
  main' (succ counter)
