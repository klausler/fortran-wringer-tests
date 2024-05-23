! Vector subscript in DATA statement designator
integer, parameter :: ix(3) = [3, 2, 1]
integer :: arr(3)
data arr(ix)/3, 2, 1/
print *, arr ! should be 1, 2, 3
end
