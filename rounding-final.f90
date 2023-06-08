! 17.4 requires that the IEEE rounding mode be restored at the end of a
! subprogram that modifies them.  Does this occur?  If so, when?
! GNU: Doesn't restore rounding mode; doesn't finalize function results or 'x', only 'tmp'
! Intel: Doesn't restore rounding mode
! NVF: Bogus compilation error on call to test(2) but not test(1)
! NAG, XLF: Restores rounding mode before finalizing function result; it's TO_ZERO only for 'tmp'

module m
  use, intrinsic :: ieee_arithmetic
  type t
    character(30) :: str = "[uninitialized]"
   contains
    final final
  end type
 contains
  impure elemental subroutine final(x)
    type(t), intent(in out) :: x
    type(ieee_round_type) rnd
    call ieee_get_rounding_mode(rnd)
    print *, 'in final(', trim(x%str), '); is rounding mode TO_ZERO? ', rnd == ieee_to_zero
  end
  type(t) function test(n)
    integer, intent(in) :: n
    type(t) tmp
    type(ieee_round_type) rnd
    call ieee_get_rounding_mode(rnd)
    print *, 'begin test, ', n, '; is initial rounding mode NEAREST? ', rnd == ieee_nearest
    call ieee_set_rounding_mode(ieee_to_zero)
    call ieee_get_rounding_mode(rnd)
    print *, 'in test, ', n, '; after setting rounding mode TO_ZERO, is it? ', rnd == ieee_to_zero
    write(test%str,"('result for test(',I1,')')") n
    tmp%str = "tmp"
    call ieee_get_rounding_mode(rnd)
    print *, 'at end of test, ', n, '; is rounding mode TO_ZERO? ', rnd == ieee_to_zero
  end
end

program main
  use m
  type(t) x
  type(ieee_round_type) rnd
  call ieee_get_rounding_mode(rnd)
  print *, 'main program start; is initial rounding mode NEAREST? ', rnd == ieee_nearest
  call ieee_set_rounding_mode(ieee_nearest)
  call ieee_get_rounding_mode(rnd)
  print *, 'main program; is rounding mode NEAREST after setting it? ', rnd == ieee_nearest
  x%str = 'initial x before test(1)'
  x = test(1)
  call ieee_get_rounding_mode(rnd)
  print *, 'main program; is rounding mode NEAREST after calling test(1)? ', rnd == ieee_nearest, &
    '; is it TO_ZERO? ', rnd == ieee_to_zero
  call ieee_set_rounding_mode(ieee_nearest)
  call ieee_get_rounding_mode(rnd)
  print *, 'main program; is rounding mode NEAREST after setting it again? ', rnd == ieee_nearest
  x%str = 'x before test(2)'
  x = test(2)
  call ieee_get_rounding_mode(rnd)
  print *, 'main program; is rounding mode NEAREST after calling test(2)? ', rnd == ieee_nearest, &
    '; is it TO_ZERO? ', rnd == ieee_to_zero
end
