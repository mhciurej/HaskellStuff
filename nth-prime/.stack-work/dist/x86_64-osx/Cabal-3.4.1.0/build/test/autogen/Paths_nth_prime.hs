{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_nth_prime (
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
version = Version [2,1,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/lib/x86_64-osx-ghc-9.0.2/nth-prime-2.1.0.6-3YBERCH9sVRD7LxJJD8zeO-test"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/lib/x86_64-osx-ghc-9.0.2"
datadir    = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/share/x86_64-osx-ghc-9.0.2/nth-prime-2.1.0.6"
libexecdir = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/libexec/x86_64-osx-ghc-9.0.2/nth-prime-2.1.0.6"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/nth-prime/.stack-work/install/x86_64-osx/22de66dbcede215a1fb2e9859024a18ee51b51bf188ee9adadea6f9c8179b9e8/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "nth_prime_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "nth_prime_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "nth_prime_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "nth_prime_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "nth_prime_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "nth_prime_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
