{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_sublist (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [1,1,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/lib/x86_64-osx-ghc-9.0.2/sublist-1.1.0.6-AteYelQGys3Cz3Wxn1ZW4S-test"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/lib/x86_64-osx-ghc-9.0.2"
datadir    = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/share/x86_64-osx-ghc-9.0.2/sublist-1.1.0.6"
libexecdir = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/libexec/x86_64-osx-ghc-9.0.2/sublist-1.1.0.6"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/sublist/.stack-work/install/x86_64-osx/03ceebfcb364378399446f889e3ec8d9108e079f2c744b9976d49514dfcc8f28/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "sublist_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "sublist_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "sublist_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "sublist_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "sublist_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "sublist_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
