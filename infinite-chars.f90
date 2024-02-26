! What happens when the characteristics of an explicit procedure
! interface are infinite due to self-reference?
! GNU, Intel, NVF: compiler crash
! NAG, f18: error
! XLF: odd error about functions
program test
  print *, 'compiled'
 contains
  subroutine selfRef(p)
    procedure(selfRef) p
    call p(p)
  end
end
