! More finalization discrepancies.
module m
  type :: parent
    integer :: j
   contains
    final :: final1e, final1a
  end type
  type :: component
    integer :: n
   contains
    final :: final3e, final3a
  end type
  type, extends(parent) :: child
    integer :: k
    type(component) :: a
    type(component), allocatable :: b(:,:)
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
  impure elemental subroutine final3e(x)
    type(component), intent(in) :: x
    print *, 'component final3e', x%n
  end subroutine
  subroutine final3a(x)
    type(component) :: x(2,2)
    print *, 'component final3a', x%n
  end subroutine
end module

subroutine test
  use m
  type(child), allocatable :: x(:,:)
  allocate(x(2,2))
  x%j = reshape([11, 12, 13, 14], [2, 2])
  x%k = reshape([21, 22, 23, 24], [2, 2])
  x%a%n = reshape([31, 32, 33, 34], [2, 2])
  n = 40
  do k = 1, 2
    do j = 1, 2
      allocate(x(j,k)%b(2,2))
      x(j,k)%b%n = reshape([n+1, n+2, n+3, n+4], [2, 2])
      n = n + 4
    end do
  end do
  print *, 'begin finalization'
  deallocate(x)
end subroutine

call test
end
