! Are construct names scoped by BLOCK?
! GNU, Intel, NVF: yes
! f18: yes with warning
! NAG, XLF: no
foo: do j=1,1
end do foo
block
  foo: do j=1,1
  end do foo
end block
print *, 'construct names are scoped by BLOCK'
end
