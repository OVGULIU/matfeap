      subroutine feapgetm(var)

      implicit  none

      include 'comblk.h'
      include 'pointer.h'

      character var*(*)
      logical flag
      integer lengt, prec
      integer point

      save

      call pgetd( var, point, lengt, prec, flag )
      if(flag) then
        if(prec.eq.1) then
          call fmsendint(mr(point), lengt)
        else
          call fmsenddbl(hr(point), lengt)
        endif
      else
        print *, 'Not found'
      endif

      end
