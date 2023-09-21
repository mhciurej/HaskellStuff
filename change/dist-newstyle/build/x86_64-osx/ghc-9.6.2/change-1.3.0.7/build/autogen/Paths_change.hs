{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_change (
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
version = Version [1,3,0,7] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/mhciurej/.cabal/bin"
libdir     = "/Users/mhciurej/.cabal/lib/x86_64-osx-ghc-9.6.2/change-1.3.0.7-inplace"
dynlibdir  = "/Users/mhciurej/.cabal/lib/x86_64-osx-ghc-9.6.2"
datadir    = "/Users/mhciurej/.cabal/share/x86_64-osx-ghc-9.6.2/change-1.3.0.7"
libexecdir = "/Users/mhciurej/.cabal/libexec/x86_64-osx-ghc-9.6.2/change-1.3.0.7"
sysconfdir = "/Users/mhciurej/.cabal/etc"

getBinDir     = catchIO (getEnv "change_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "change_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "change_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "change_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "change_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "change_sysconfdir") (\_ -> return sysconfdir)




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
