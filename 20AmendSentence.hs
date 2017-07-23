import Data.Char
amendTheSentence = dropWhile (== ' ') . concatMap
  (\x -> if isUpper x then [' ', toLower x] else [x])
