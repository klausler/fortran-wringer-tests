! The standard's descriptions of the rounding control edit descriptors
! say that they round down/up to *representable* numbers.  Does that
! mean +/-HUGE(), or +/-Inf?
!        RP       RC       RN       RZ         RU        RD
! GNU:   Inf/-Inf Inf/-Inf Inf/-Inf HUGE/-HUGE Inf/-HUGE HUGE/-Inf
! Intel: Inf/-Inf Inf/-Inf Inf/-Inf HUGE/-HUGE Inf/-HUGE HUGE/-Inf
! NVF:   Inf/-Inf Inf/-Inf Inf/-Inf Inf/-Inf   Inf/-Inf  Inf/-Inf
! XLF:   Inf/-Inf Inf/-Inf Inf/-Inf Inf/-Inf   Inf/-Inf  Inf/-Inf
! NAG: all are overflow errors, no values were read
! Intel signaled an input conversion error on each infinite result.
program t
  character(2) :: roundings(6) = ["RP","RC","RN","RZ","RU","RD"]
  character(8) :: values(2) = [" 1.0e999", "-1.0e999"]
  do j = 1, size(roundings)
    do k = 1, size(values)
      call s("(" // roundings(j) // ",e8.1e3)", values(k))
    end do
  end do
 contains
  subroutine s(fmt,data)
    character(*), intent(in) :: fmt,data
    real x
    character(64) msg
    integer ios
    iostat = 0
    msg = ''
    x = 666.
    read(data,fmt,iostat=iostat,iomsg=msg) x
    print *, 'fmt "', fmt, '", data "', data, '" x', x, 'iostat', iostat, 'msg "', trim(msg), '"'
  end
end
