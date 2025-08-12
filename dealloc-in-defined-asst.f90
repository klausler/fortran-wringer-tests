module m
  type hasAllocatable
    integer, allocatable :: alloc
   contains
    procedure :: definedAssignment
    generic :: assignment(=) => definedAssignment
  end type
 contains
  subroutine definedAssignment(lhs, rhs)
    class(hasAllocatable), intent(in out) :: lhs
    class(hasAllocatable), intent(in) :: rhs
    if (allocated(lhs%alloc)) then
      print *, 'lhs%alloc', lhs%alloc
    else
      print *, 'lhs%alloc is not allocated'
    end if
    if (allocated(rhs%alloc)) then
      print *, 'rhs%alloc', rhs%alloc
      lhs%alloc = rhs%alloc
    else
      print *, 'rhs%alloc is not allocated'
    end if
  end
end

program main
  use m
  type wrapper
    type(hasAllocatable) nonAllocatableComponent
    type(hasAllocatable), allocatable :: allocatableComponent
  end type
  type(wrapper) x
  type(wrapper), allocatable :: y
  x = wrapper(hasAllocatable(1), hasAllocatable(2))
  y = wrapper(hasAllocatable(3), hasAllocatable(4))
  x = wrapper(hasAllocatable(5), hasAllocatable(6))
  y = wrapper(hasAllocatable(7), hasAllocatable(8))
end
