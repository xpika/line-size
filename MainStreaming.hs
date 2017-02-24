
import qualified Streaming.Prelude (stdoutLn, stdinLn)
import qualified Streaming.Prelude as S

main = S.stdoutLn' $ S.zipWith g (S.enumFrom 1) (S.stdinLn) 
g counter line = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""

