! Does 'n' resolve to a host association or to the local object?
program main
  n = 10
  call foo
 contains
  subroutine foo
    real :: a(n)
    common /blk/ n
    print *, size(a)
  end subroutine
end

block data
  common /blk/ n
  data n/20/
end
