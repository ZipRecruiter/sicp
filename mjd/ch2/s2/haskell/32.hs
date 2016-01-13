
test_set = [1,2,3];

power_set [] = [[]]
power_set (h:t) =
  (map (h:) ss) ++ ss
  where ss = power_set t

subsets = power_set

