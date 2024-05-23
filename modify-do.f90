! What happens when a DO index variable is modified in the loop?
subroutine foo(i)
  i = i + 1
end
program test
  do i = 1, 10
    call foo(i)
    print *, i
  end do
end
