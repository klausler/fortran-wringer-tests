! Can an ENTRY statement without RESULT have the same name as the
! explicit RESULT of its containing function?
! GNU, NAG, XLF: no
! Intel: crash
! NVF, f18: yes
function func(a) result(result)
  entry result(a)
  result = a
end
program test
  print *, func(123.)
  print *, result(234.)
end
