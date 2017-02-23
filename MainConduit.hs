import Conduit
import Control.Monad
import qualified Data.Conduit.List

main = runConduit (
          (    getZipSource $ g 
          <$> (ZipSource (iterateC succ 1)) 
          <*> (ZipSource (repeatMC getLine))  
          )
        .| unlinesC 
        .| stdoutC
        )


g counter line  = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""
