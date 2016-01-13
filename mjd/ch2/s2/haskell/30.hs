data Tree a = Small a | Big [Tree a]
tree_map f (Small a) = Small $ f a
tree_map f (Big tls) = Big   $ map (tree_map f) tls

scale_tree t factor = tree_map (* factor) t
