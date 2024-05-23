! Can a module's name be used for something else in the module?
module foo
  type foo
  end type
end module

use foo
print *, 'ok'
end
