! How does an arithmetic IF statement interpret a NaN?
! GNU, ifx, NVF, XLF: >0
! ifort, f18: =0
! NAG: runtine FP error
subroutine aif(x)
  real :: x
  print *, "here goes"
  if (x) 1, 2, 3
  print *, "none of the above"
  return
1 print *, "<0"
  return
2 print *, "=0"
  return
3 print *, ">0"
end

block data
  common /blk/j
  data j/z'7f800000'/
end block data

program main
  common /blk/ x
  call aif(x - x)
end

