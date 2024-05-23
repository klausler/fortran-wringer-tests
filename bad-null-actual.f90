! What happens with unassociated procedure pointer dummy arguments?
module m
  abstract interface
    subroutine noargs
    end subroutine
  end interface
 contains
  subroutine callit(p)
    procedure(noargs), pointer :: p
    if (associated(p)) then
      call p
    else
      print *, 'p is null'
    end if
  end subroutine
  subroutine hi
    print *, 'hi'
  end subroutine
end module

program test
  use m
  procedure(noargs), pointer :: p
  p => hi
  call callit(p)
  nullify(p)
  call callit(p)
  call callit(null(mold=p))
end program
