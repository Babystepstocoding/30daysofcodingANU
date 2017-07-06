import Data.Map.Strict (Map)
import qualified Data.Map.Strict as M

areFollowingPatterns = ((.).(.)) (go M.empty M.empty) zip

go _ _ [] = True
go m1 m2 ((k,v):xs) = case (M.lookup k m1, M.lookup v m2) of
  (Just v', Just k') -> v == v' && k == k' && go m1 m2 xs
  (Nothing, Nothing) -> go (M.insert k v m1) (M.insert v k m2) xs
  _ -> False
