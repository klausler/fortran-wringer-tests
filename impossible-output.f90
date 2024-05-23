! When delimited list-directed character output has to be split across
! multiple records, and the last character is a quote mark that has to
! be doubled, it's impossible.
character(11) :: buffer(3)
character(10) :: quotes = '""""""""""'
character(10) :: check
write(buffer,*,delim="QUOTE") quotes
print 1, buffer
1 format('>',a10,'<')
print *, "checking..."
read(buffer,*) check
print 1, check
end
