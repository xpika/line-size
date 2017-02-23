{-# LANGUAGE NoMonomorphismRestriction #-}

module Pipes.Categorical 
(
 runEffect
,stdinLn
,stdoutLn
,module Control.Category
,module Control.Arrow
,zip
,each
) where

import qualified Pipes as P
import Pipes ((>->),yield,await,lift,Pipe)
import qualified Pipes.Prelude as PP
import Data.Char
import Control.Category ((>>>),Category((.),id))
import Control.Arrow
import Prelude hiding ((.),zip)

stdinLn =PipeC PP.stdinLn
stdoutLn =PipeC PP.stdoutLn
each =PipeC. P.each
zip x y   =PipeC (PP.zip (yield () >-> (unPipeC x)) ( yield () >-> (unPipeC y)))

newtype PipeC m a b =PipeC { unPipeC :: P.Proxy () a () b m () }

instance Monad m => Category (PipeC m) where
  id = undefined
  (PipeC f) . (PipeC g) =PipeC(myComp g f)

myComp :: Monad m => Pipe a b m r -> Pipe b c m r -> Pipe a c m r
myComp = (>->)

instance Monad m => Arrow (PipeC m) where
    arr f =PipeC(PP.map f)
    first _ = undefined
    second _ = undefined

runEffect x = P.runEffect (yield () >-> unPipeC x >-> PP.drain)
