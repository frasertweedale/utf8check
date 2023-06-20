module Text.Utf8check 
  (
    utf8check
  ) where

import qualified Data.ByteString as B
import qualified Data.Text.Encoding as T

utf8check :: B.ByteString -> Bool
utf8check bs = case T.decodeUtf8' bs of
  Left _  -> False
  Right _ -> True
