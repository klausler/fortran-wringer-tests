! Do Fortran 2003 allocatable assignment semantics with (re)allocation work
! in the context of a WHERE statement?
program main
  integer, allocatable :: a(:), b(:)
  a = [(j,j=1,10)]
  print *, a ! 1 2 3 4 5 6 7 8 9 10
  where (mod(a,2) == 0) b = a
  print *, b(2:10:2) ! 2 4 6 8 10
end
