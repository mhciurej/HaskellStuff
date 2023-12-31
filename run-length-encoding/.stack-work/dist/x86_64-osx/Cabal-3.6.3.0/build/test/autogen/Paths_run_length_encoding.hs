{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_run_length_encoding (
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
version = Version [1,1,0,5] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/lib/x86_64-osx-ghc-9.2.7/run-length-encoding-1.1.0.5-8iyGOjRewcHJfY5zx7LIxf-test"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/share/x86_64-osx-ghc-9.2.7/run-length-encoding-1.1.0.5"
libexecdir = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/libexec/x86_64-osx-ghc-9.2.7/run-length-encoding-1.1.0.5"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/run-length-encoding/.stack-work/install/x86_64-osx/11728b65b2582211abbe53994df22cfff18347a4d86ad0aa489a9b599c7cbf0a/9.2.7/etc"

getBinDir     = catchIO (getEnv "run_length_encoding_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "run_length_encoding_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "run_length_encoding_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "run_length_encoding_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "run_length_encoding_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "run_length_encoding_sysconfdir") (\_ -> return sysconfdir)




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
