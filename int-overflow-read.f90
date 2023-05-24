! What happens on overflow during internal input?
! GNU, Intel, f18: errors for int, real, boz
! NVF: error for boz
! NAG: error for int & real
! XLF: error for int & boz
program main
  character(20) :: int_input = '777777777777777'
  character(20) :: real_input = '1.e9999999'
  integer n, iostat
  real a
  iostat = 0
  read(int_input,'(i20)',iostat=iostat,err=1) n
  print *, 'no error for int ', iostat, n
  go to 2
1 print *, 'error for int ', iostat, n
2 iostat = 0
  read(real_input,'(e20.3)',iostat=iostat,err=3) a
  print *, 'no error for real ', iostat, a
  go to 4
3 print *, 'error for real ', iostat, a
4 iostat = 0
  read(int_input,'(o20)',iostat=iostat,err=5) n
  print *, 'no error for boz int ', iostat, n
  go to 6
5 print *, 'error for boz int ', iostat, n
6 print *, 'done'
end
