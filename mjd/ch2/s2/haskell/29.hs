
-- data Branch  where { Branch { weight :: Int, structure :: Mobile } :: Branch }
data Branch = Branch { branch_length :: Int, branch_structure :: Mobile } deriving Show
data Mobile = Weight Int | Mobile { left_branch :: Branch, right_branch :: Branch } deriving Show

total_branch_weight (Branch { branch_structure = str }) = total_weight str

total_weight (Weight wt) = wt
total_weight (Mobile lt rt) =
  (total_branch_weight lt) + (total_branch_weight rt) 

test_mobile = Mobile {
    left_branch  = Branch { branch_length = 1,
                            branch_structure = Weight 10 },
    right_branch = Branch { branch_length = 2,
                            branch_structure = Mobile {
                                                 left_branch = Branch { branch_length = 3,
                                                                        branch_structure = Weight 20 },
                                                 right_branch = Branch { branch_length = 4,
                                                                        branch_structure = Weight 30 }}}}

test_balanced_mobile = Mobile (Branch 7 (Weight 10))
                              (Branch 1 (Mobile (Branch 3 (Weight 40))
                                                (Branch 4 (Weight 30))))

torque br@(Branch len _) = len * total_branch_weight br

is_balanced (Weight _) = True
is_balanced (Mobile lt rt) = 
     torque lt == torque rt
  && is_balanced (branch_structure lt)
  && is_balanced (branch_structure rt)


                                       
                                


