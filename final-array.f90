! Elemental vs array finalizers
module m
  type :: parent
    integer :: j
   contains
    final :: final1e, final1a
  end type
  type, extends(parent) :: child
    integer :: k
   contains
    final :: final2e, final2a
  end type
 contains
  impure elemental subroutine final1e(x)
    type(parent), intent(in) :: x
    print *, 'parent final1e', x%j
  end subroutine
  subroutine final1a(x)
    type(parent) :: x(2,2)
    print *, 'parent final1a', x%j
  end subroutine
  impure elemental subroutine final2e(x)
    type(child), intent(in) :: x
    print *, 'child final2e', x%k
  end subroutine
  subroutine final2a(x)
    type(child) :: x(2,2)
    print *, 'child final2a', x%k
  end subroutine
end module

subroutine test
  use m
  type(child), allocatable :: x(:,:)
  allocate(x(2,2))
  x%j = reshape([11, 12, 13, 14], [2, 2])
  x%k = reshape([21, 22, 23, 24], [2, 2])
  print *, 'begin finalization'
  deallocate(x)
end subroutine

call test
end
