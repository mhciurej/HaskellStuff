{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_forth (
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
version = Version [1,7,1,13] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/lib/x86_64-osx-ghc-9.0.2/forth-1.7.1.13-2gPpPbwDZHkARBedHfXpXV-test"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/lib/x86_64-osx-ghc-9.0.2"
datadir    = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/share/x86_64-osx-ghc-9.0.2/forth-1.7.1.13"
libexecdir = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/libexec/x86_64-osx-ghc-9.0.2/forth-1.7.1.13"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/forth/.stack-work/install/x86_64-osx/5e92bebcc582f3151ca9ed6574d8445682ec9d361e2b889cf4207213821d3080/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "forth_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "forth_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "forth_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "forth_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "forth_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "forth_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
