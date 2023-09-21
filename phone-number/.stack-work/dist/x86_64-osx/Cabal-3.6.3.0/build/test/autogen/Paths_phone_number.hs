{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_phone_number (
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
version = Version [1,6,1,8] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/bin"
libdir     = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/lib/x86_64-osx-ghc-9.2.7/phone-number-1.6.1.8-9UQYDGxnzdl3EgiIbT2mr4-test"
dynlibdir  = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/share/x86_64-osx-ghc-9.2.7/phone-number-1.6.1.8"
libexecdir = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/libexec/x86_64-osx-ghc-9.2.7/phone-number-1.6.1.8"
sysconfdir = "/Users/mhciurej/Exercism/Haskell/phone-number/.stack-work/install/x86_64-osx/ea7994e7d2f8f85a98ba8ad199836b814c3300bf1e6867e34e051eaeec6c46f4/9.2.7/etc"

getBinDir     = catchIO (getEnv "phone_number_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "phone_number_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "phone_number_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "phone_number_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "phone_number_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "phone_number_sysconfdir") (\_ -> return sysconfdir)




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
