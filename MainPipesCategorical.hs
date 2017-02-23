import qualified Pipes.Categorical as PC
import Control.Arrow
import Control.Category

main = PC.runEffect $ (PC.zip (PC.each [1..]) PC.stdinLn) 
       >>> arr g
       >>> PC.stdoutLn

g (counter,line) = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""
 
