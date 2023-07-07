! FD misinformation refutation: A claim was made that an assignment
! to a whole allocatable could reallocate an allocated left-hand side
! variable even if the shape of the right-hand side expression had the
! same shape.  The conditions in which an allocated left-hand side
! allocatable is reallocated are very clearly specified in the standards
! since F'2003.  The conditions in which a (re)allocated LHS variable
! acquires the bounds of the RHS are also clear, but not implemented
! correctly in all compilers.
! GNU, NAG, f18: 2, 2, 1, 1, 1, 3, 1, 4, 4
! Intel, XLF:    2, 2, 2, 1, 1, 3, 1, 4, 4
! NVF:           2, 2, 2, 2, 1, 3, 1, 4, 4
program main
  real, allocatable :: a(:), b(:)
  allocate(b(2:3))
  print *, lbound(b)
  a = b ! allocates with b's bounds
  print *, lbound(a)
  deallocate(a)
  a = (b) ! should allocate with default bounds
  print *, lbound(a)
  deallocate(a)
  a = b + 0. ! should allocate with default bounds
  print *, lbound(a)
  deallocate(a)
  a = b(:) ! should allocate with default bounds
  print *, lbound(a)
  deallocate(b)
  allocate(b(3:4))
  print *, lbound(b)
  a = b ! does not reallocate or change bounds
  print *, lbound(a)
  deallocate(b)
  allocate(b(4:6))
  print *, lbound(b)
  a = b ! reallocates with new bounds
  print *, lbound(a)
end
