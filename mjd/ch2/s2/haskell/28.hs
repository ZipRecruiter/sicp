
data RoseTree a = Leaf a | Branch [RoseTree a]

fringe (Leaf a) = [a]
fringe (Branch trees) = foldr (++) [] (map fringe trees)

x' = Branch [ Branch [ Leaf 1, Leaf 2 ],
              Branch [ Leaf 3, Leaf 4 ] ];
