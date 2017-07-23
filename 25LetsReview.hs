-- Enter your code here. Read input from STDIN. Print output to STDOUT
main = do
  n <- readLn
  sequence $ replicate n $ getLine >>=
    (\s -> putStr [a | (n,a) <- zip [0..] s, even n] >>
      putStr " " >>
      putStrLn [a | (n,a) <- zip [0..] s, odd n])
