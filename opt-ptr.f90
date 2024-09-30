! Does F'2023 15.5.2.13 p3(7) override p1(bullet 2)?
program main
  call s1()
 contains
  subroutine s1(x)
    integer, optional, pointer :: x(:)
    call s2(x)
  end
  subroutine s2(x)
    integer, optional :: x(:)
    print *, present(x)
  end
end
