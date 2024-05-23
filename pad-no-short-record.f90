! What happens when an advancing input record lacks sufficient characters
! under PAD='NO'?

  character(len=0) :: str0(2)
  character(len=2) :: str2(2)
  integer :: a, b, c, d, ios
  str2 = ''

! Zero-length record cases
  ios = 0
  read(str0, '()', end=11, err=12, iostat=ios, pad='no')
  print *, 'no EOF or error on case 1'; goto 13
11 print *, 'EOF on case 1'; goto 13
12 print *, 'IOSTAT=', ios, 'on case 1'
13 continue

  ios = 0
  read(str0, '(i2)', end=21, err=22, iostat=ios, pad='no') a
  print *, 'no EOF or error on case 2'; goto 23
21 print *, 'EOF on case 2'; goto 23
22 print *, 'IOSTAT=', ios, 'on case 2'
23 continue

  ios = 0
  read(str2(:)(2:1), '()', end=31, err=32, iostat=ios, pad='no')
  print *, 'no EOF or error on case 3'; goto 33
31 print *, 'EOF on case 3'; goto 33
32 print *, 'IOSTAT=', ios, 'on case 3'
33 continue

  ios = 0
  read(str2(:)(2:1), '(i2)', end=41, err=42, iostat=ios, pad='no') a
  print *, 'no EOF or error on case 4'; goto 43
41 print *, 'EOF on case 4'; goto 43
42 print *, 'IOSTAT=', ios, 'on case 4'
43 continue

  open(1,status='scratch')
  write (1,*)

  rewind(1)
  ios = 0
  read(1, '()', end=51, err=52, iostat=ios, pad='no')
  print *, 'no EOF or error on case 5'; goto 53
51 print *, 'EOF on case 5'; goto 53
52 print *, 'IOSTAT=', ios, 'on case 5'
53 continue

  rewind(1)
  ios = 0
  read(1, '(i2)', end=61, err=62, iostat=ios, pad='no') a
  print *, 'no EOF or error on case 6'; goto 63
61 print *, 'EOF on case 6'; goto 63
62 print *, 'IOSTAT=', ios, 'on case 6'
63 continue

! Short nonzero record cases
  str2(1) = '12'
  str2(2) = '34'
  a = 0; b = 0; c = 0; d = 0
  ios = 0
  read(str2, '(4i1)', end=71, err=72, iostat=ios, pad='no') a, b, c, d
  print *, 'no EOF or error on case 7, got', a, b, c, d; goto 73
71 print *, 'EOF on case 7, got', a, b, c, d; goto 73
72 print *, 'IOSTAT=', ios, 'on case 7, got', a, b, c, d
73 continue

  rewind(1)
  write(1,"('12'/'34')")

  rewind(1)
  a = 0; b = 0; c = 0; d = 0
  ios = 0
  read(1, '(4i1)', end=81, err=82, iostat=ios, pad='no') a, b, c, d
  print *, 'no EOF or error on case 8, got', a, b, c, d; goto 83
81 print *, 'EOF on case 8, got', a, b, c, d; goto 83
82 print *, 'IOSTAT=', ios, 'on case 8, got', a, b, c, d
83 continue

  end
