! How are NaN values handled by MAXVAL, MINVAL, MAXLOC, & MINLOC?
! Results are all over the map, with no good precedent.
! Some compilers differ between folded and computed results.

real, parameter :: nan = real(z'FFFFFFFF')
real, parameter :: allNans_c(*) = [nan, nan]
real, parameter :: someNans_c(*) = [nan, 0., nan]
real :: allNans_r(2) = [nan, nan]
real :: someNans_r(3) = [nan, 0., nan]

print *, maxval(allNans_c), minval(allNans_c)
print *, maxval(allNans_r), minval(allNans_r)
print *, maxval(allNans_c,mask=.false.), minval(allNans_c,mask=.false.)
print *, maxval(allNans_r,mask=.false.), minval(allNans_r,mask=.false.)
print *, maxval(someNans_c), minval(someNans_c)
print *, maxval(someNans_c), minval(someNans_r)
print *, maxval(someNans_c,mask=.false.), minval(someNans_c,mask=.false.)
print *, maxval(someNans_r,mask=.false.), minval(someNans_r,mask=.false.)
print *, maxloc(allNans_c,1), minloc(allNans_c,1)
print *, maxloc(allNans_r,1), minloc(allNans_r,1)
print *, maxloc(allNans_c,1,back=.true.), minloc(allNans_c,1,back=.true.)
print *, maxloc(allNans_r,1,back=.true.), minloc(allNans_r,1,back=.true.)
print *, maxloc(allNans_c,1,mask=.false.), minloc(allNans_c,1,mask=.false.)
print *, maxloc(allNans_r,1,mask=.false.), minloc(allNans_r,1,mask=.false.)
print *, maxloc(allNans_c,1,mask=.false.,back=.true.), minloc(allNans_c,1,mask=.false.,back=.true.)
print *, maxloc(allNans_r,1,mask=.false.,back=.true.), minloc(allNans_r,1,mask=.false.,back=.true.)
print *, maxloc(someNans_c,1), minloc(someNans_c,1)
print *, maxloc(someNans_r,1), minloc(someNans_r,1)
print *, maxloc(someNans_c,1,mask=.false.), minloc(someNans_c,1,mask=.false.)
print *, maxloc(someNans_r,1,mask=.false.), minloc(someNans_r,1,mask=.false.)
end
