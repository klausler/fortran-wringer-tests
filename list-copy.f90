! Can the 'next' of a linked list be ALLOCATABLE?
! GNU, Intel, f18: works, "1 2 3"
! NVF, NAG, XLF: compilation errors about recursive type use without POINTER
type :: t
  integer :: n
  type(t), allocatable :: next
end type
type(t), allocatable :: x, y
allocate(x)
allocate(x%next)
allocate(x%next%next)
x%n = 1
x%next%n = 2
x%next%next%n = 3
y = x
print *, y%n, y%next%n, y%next%next%n
end
