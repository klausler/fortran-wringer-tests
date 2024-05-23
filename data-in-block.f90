! What happens when a possibly host-associated name appears in
! a DATA statement in a BLOCK construct?
program test
  data j/1/
  block
    data j/2/
    print *, j
  end block
  print *, j
end
