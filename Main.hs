import System.IO
import Control.Monad

main = main' 0
main' counter  = do
 p <- hIsEOF stdin
 when (not p) $ do
  x <- getLine
  let newLength = length x
  putStrLn (show counter ++ " " ++ show newLength ++ " " ++ take 50 x ++ "..")
  main' (succ counter)
