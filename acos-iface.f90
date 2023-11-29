! Intel, NVF, NAG, f18: works
! GNU, XLF: errors about elemental or non-external procedure as interface
procedure(acos), pointer :: p
p => acos
print *, p(1.)
end
