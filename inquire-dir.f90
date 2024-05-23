! Result of INQUIRE on a directory
logical :: is_file
inquire(file=".", exist=is_file)
print *, is_file
end
