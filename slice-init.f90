! Can a pointer be initialized to real components of a slice?
complex, save, target :: a(4) = [(1.,0.),(2.,0.),(3.,0.),(4.,0.)]
real, pointer :: p(:) => a(1:3:2)%re
print *, p
end
