module HIE.Priority where

#if __MINGW___
-- No Win32 implementation yet
#else
import System.Posix.Process
#

-- | Decrease priority of another process by a given `nice` value. 
--   Use positive priority for another process to yield CPU time.
decreaseProcessPriority pid = do
#ifdef __MINGW___
  return ()
#else  
  prevPrio <- getProcesPriority pid
  setProcessPriority pid $ prevPrio + 10
#endif