import Pipes
import qualified Pipes.Prelude as PP

main = runEffect $ for (PP.zip (each [1..]) PP.stdinLn) g
g (counter,line) = lift (putStrLn message)
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""
         message = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
