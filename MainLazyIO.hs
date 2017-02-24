import System.IO

main = interact (unlines ( zipWith g [1..] (lines x) ))

g counter line  = show counter ++ " " ++ show newLength ++ " " ++ take 50  line ++ ellipsis
   where newLength = length line
         ellipsis = if newLength > 50 then ".." else ""
