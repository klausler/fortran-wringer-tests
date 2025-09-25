program poly_where
  class(*), allocatable :: a(:), b(:)
  logical mask(2)
  b = [1., 2.]
  do j = 0, 1
    do k = 0, 1
      a = [3, 4]
      where ([j>0, k>0]) a = b
      select type(a)
       type is (integer)
        print *, a
       type is (real)
        print *, a
       class default
        print *, 'neither integer nor real'
      end select
      deallocate(a)
    end do
  end do
end
