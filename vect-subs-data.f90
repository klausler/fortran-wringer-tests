! Vector subscript in DATA statement designator
! GNU: compiler crash
! Intel, XLF, f18: works (1 2 3)
! NVF: bogus "illegal implied DO expression" error
! NAG: works, bogus warning "unused PARAMETER IX"
integer, parameter :: ix(3) = [3, 2, 1]
integer :: arr(3)
data arr(ix)/3, 2, 1/
print *, arr ! should be 1, 2, 3
end
