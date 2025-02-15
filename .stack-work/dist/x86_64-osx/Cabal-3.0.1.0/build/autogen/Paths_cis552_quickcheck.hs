{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_cis552_quickcheck (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/bin"
libdir     = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/lib/x86_64-osx-ghc-8.8.3/cis552-quickcheck-0.1.0.0-BeWOqZwtdpMDXBnX0RX5h9"
dynlibdir  = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/share/x86_64-osx-ghc-8.8.3/cis552-quickcheck-0.1.0.0"
libexecdir = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/libexec/x86_64-osx-ghc-8.8.3/cis552-quickcheck-0.1.0.0"
sysconfdir = "/Users/caoyiyuan/Documents/GitHub/04-quickcheck/.stack-work/install/x86_64-osx/5f42206b65dd2edc77ca928004e8d161c8cc888d11fe17e14c601df500dcff61/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cis552_quickcheck_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cis552_quickcheck_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cis552_quickcheck_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cis552_quickcheck_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cis552_quickcheck_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cis552_quickcheck_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
