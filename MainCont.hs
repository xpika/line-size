import System.IO
import Control.Monad.Cont

main = (`runContT` return) $ do
      forM_ [1..] $ \counter -> do
        p <- lift $ hIsEOF stdin
        if p then ContT (\f -> return () :: IO ())
             else ContT (\f -> f (return () :: IO ()))
        x <- lift getLine
        let newLength = length x
        let ellipsis = if newLength > 50 then ".." else ""
        let message = show counter ++ " " ++ show newLength ++ " " ++ take 50 x ++ ellipsis
        lift $ putStrLn message

