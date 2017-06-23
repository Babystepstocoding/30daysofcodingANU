import Data.Map (Map)
import qualified Data.Map.Strict as M
import Data.List

main :: IO ()
main = do
  _ <- getLine -- just ignore it
  magazine <- words <$> getLine
  note <- words <$> getLine
  putStrLn (if note `canBeMadeFrom` magazine then "Yes" else "No")

canBeMadeFrom :: [String] -> [String] -> Bool
canBeMadeFrom note magazine = note `canBeMadeFrom_` magazine'
  where
    magazine' = foldl' (flip $ M.alter (maybe (Just 1) (Just . succ))) M.empty magazine
    canBeMadeFrom_ []     magazine = True
    canBeMadeFrom_ (x:xs) magazine = case M.lookup x magazine of
      Just n | n > 0  -> xs `canBeMadeFrom_` (M.insert x (n-1) magazine)
      _ -> False
