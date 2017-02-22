import Pipes
import qualified Pipes.Prelude as PP

main = runEffect $ (PP.zip (each [1..]) PP.stdinLn) >-> PP.map g >-> PP.stdoutLn
g (counter,line) = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""
 
