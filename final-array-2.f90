! More finalization discrepancies.
! GNU, Intel:: child final2a 21 22 23 24;
!      component final2e 31; 41-44; 32; 45-48; 33; 49-52; 34; 53-56;
!      parent final1a 11-14
! NVF: component final3a 41-44; 49-52; 45-48; 53-56;
!      child final2a 21 22 23 24;
!      component final3e 31;
!      parent final1e 11; 12; 13; 14
! NAG: child final2a 21 22 23 24; component final3e 31; 32; 33; 34;
!      parent final1a 11 0 353169728 32535;
!      final3a 41-44; 45-48; 49-52; 53-56
! XLF: child final2a 21 22 23 24;
!      component final3e 31; 41-44; parent final1e 11;
!      component final3e 32; 45-48; parent final1e 12;
!      component final3e 33; 49-52; parent final1e 13;
!      component final3e 34; 53-56; parent final1e 14
! f18: child final2a 21 22 23 24;
!      component final3e 31; 32; 33; 34;
!      component final3a 41-44; 45-48; 49-52; 53-56;
!      parent final1a 11 21 31 0
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
