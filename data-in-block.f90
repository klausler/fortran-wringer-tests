! What happens when a possibly host-associated name appears in
! a DATA statement in a BLOCK construct?
! GNU, Intel, f18: error
! NVF, NAG: print 2 1 - the DATA is a local declaration
! XLF: prints 2 2 - the inner DATA overrides the outer
program test
  data j/1/
  block
    data j/2/
    print *, j
  end block
  print *, j
end
