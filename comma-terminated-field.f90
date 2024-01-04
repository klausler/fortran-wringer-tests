character(9) :: in = " 1, 234"
integer :: got(3) = 0
read(in,"(3I3)") got
print *, got
end
