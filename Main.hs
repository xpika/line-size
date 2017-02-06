import System.IO
import Control.Monad

main = main' 0
main' counter = do
 p <- hIsEOF stdin
 when (not p) $ do
  x <- getLine
  let newLength = length x
  let ellipsis = if newLength > 50 then ".." else ""
  let message = show counter ++ " " ++ show newLength ++ " " ++ take 50 x ++ ellipsis
  putStrLn message
  main' (succ counter)
