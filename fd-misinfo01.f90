! FD misinformation refutation: a claim was made that an empty
! array has a lower bound of 1.  This is not always the case;
! a non-empty dimension of an empty array still reports its
! declared lower and upper bounds accurately.
! All compilers emit "0 1 2 0 3" here (modulo spacing).
program main
  real a(3:2,2:3)
  print *, size(a), lbound(a), ubound(a)
end
