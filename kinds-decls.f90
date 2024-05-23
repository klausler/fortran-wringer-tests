! How are names in KIND() inquiries resolved in component declarations?
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

