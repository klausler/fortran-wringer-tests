! What happens when the characteristics of an explicit procedure
! interface are infinite due to self-reference?
program test
  print *, 'compiled'
 contains
  subroutine selfRef(p)
    procedure(selfRef) p
    call p(p)
  end
end
