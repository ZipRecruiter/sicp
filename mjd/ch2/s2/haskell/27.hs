
import Prelude hiding (reverse)

reverse ls = reverse' ls []
  where reverse' []    acc = acc
        reverse' (h:t) acc = reverse' t (h:acc)

data RoseTree a = Leaf a | Branch [RoseTree a]
deep_reverse (Leaf a) = Leaf a
deep_reverse (Branch trees) = Branch $ map deep_reverse (reverse trees)

x = [ [1,2], [3,4] ]
x' = Branch [ Branch [ Leaf 1, Leaf 2 ],
              Branch [ Leaf 3, Leaf 4 ] ];

instance Show a => Show (RoseTree a) where
  show (Leaf x) = show x
  show (Branch trees) = "(" ++ (list_to_lisp trees) ++ ")"
    where list_to_lisp [] = ""
          list_to_lisp [x] = show x
          list_to_lisp (h:t) = (show h) ++ " " ++ (list_to_lisp t)



