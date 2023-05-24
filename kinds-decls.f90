! How are names in KIND() inquiries resolved in component declarations?
! GNU, Intel, NVF, f18: 1 1 4 4
! NAG, XLF: 1 1 1 1
integer(1) foo
type t
  integer(4) :: foo = kind(foo)
  integer(kind(foo)) :: bar
  integer(kind(bar)) :: baz
  integer :: quux = kind(baz)
end type
type(t) x
print *, x%foo, kind(x%bar), kind(x%baz), x%quux
end

