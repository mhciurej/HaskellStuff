{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_parallel_letter_frequency (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,4] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/lib/x86_64-osx-ghc-9.2.7/parallel-letter-frequency-0.1.0.4-BOC4Hahy8pOFq397P9TByb"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/share/x86_64-osx-ghc-9.2.7/parallel-letter-frequency-0.1.0.4"
libexecdir = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/libexec/x86_64-osx-ghc-9.2.7/parallel-letter-frequency-0.1.0.4"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/parallel-letter-frequency/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/etc"

getBinDir     = catchIO (getEnv "parallel_letter_frequency_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "parallel_letter_frequency_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "parallel_letter_frequency_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "parallel_letter_frequency_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "parallel_letter_frequency_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "parallel_letter_frequency_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'