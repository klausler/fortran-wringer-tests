! Are %re and %im complex parts really variables?
program main
  complex z
  z = (1.,2.)
  call subr(z%re)
  call subr(z%im)
  print *, z
 contains
  subroutine subr(a)
    real, intent(in out) :: a
    a = a + 1.
  end subroutine
end
