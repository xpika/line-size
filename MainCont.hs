import System.IO
import Control.Monad.Cont

main = (`runContT` return) $ do
    callCC $ \exit -> do
      forM_ [1..] $ \counter -> do
        p <- lift $ hIsEOF stdin
        x <- lift getLine
        let newLength = length x
        let ellipsis = if newLength > 50 then ".." else ""
        let message = show counter ++ " " ++ show newLength ++ " " ++ take 50 x ++ ellipsis
        lift $ putStrLn message
        when p $ exit () 
