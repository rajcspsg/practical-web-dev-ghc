module Logger where

import Control.Exception
import Katip
import System.IO
import Prelude(($))

runKatip :: IO ()
runKatip = withKatip app
  where app = \le -> runKatipContextT le () "main" logSomething

withKatip :: (LogEnv -> IO a) -> IO a
withKatip app = 
  bracket createLogEnv closeScribes app
  where
    createLogEnv = do
      logEnv <- initLogEnv "HAuth" "dev"
      stdoutScribe <- mkHandleScribe ColorIfTerminal stdout (permitItem InfoS) V2
      registerScribe "stdout" stdoutScribe defaultScribeSettings logEnv


logSomething :: (KatipContext m) => m ()
logSomething = do
  $(logTM) InfoS "Log in no namespace"
  katipAddNamespace "ns1" $ $(logTM) WarningS "Warning in ns1"
  
