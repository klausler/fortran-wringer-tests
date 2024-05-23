! Are construct names scoped by BLOCK?
foo: do j=1,1
end do foo
block
  foo: do j=1,1
  end do foo
end block
print *, 'construct names are scoped by BLOCK'
end
