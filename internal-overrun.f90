! What happens when internal output overruns the array?
! GNU: no jump to ERR=; IOSTAT=-1, IOMSG='End of file'
! Intel, NAG, XLF, f18: jump to ERR=; IOSTAT > 0, IOMSG informative
! NVF: same, but IOMSG padded with zeros instead of blanks
character(20) arr(3)
integer iostat
character(80) iomsg
iostat = 0
iomsg = ''
write(arr, fmt=1, err=2, iostat=iostat, iomsg=iomsg)
1 format(4('abc',/))
print *, 'no ERR=; IOSTAT=', iostat, ', IOMSG: ', iomsg
go to 9
2 print *, 'went to ERR=, IOSTAT=', iostat, ', IOMSG: ', iomsg
9 continue
end
