Program main
!=============================================
! Integration of a function using Simpson rule
!=============================================
    implicit none
    double precision f, a, b, integral
    integer n, i
    double precision, parameter:: pi = 3.1415926
    external f

    a = 0.0
    b = 1

    n = 2

    write(*,100)

    do i=1,16
       call simpson(f,a,b,integral,n)
       write (*,101) n, integral
       n = n*2
    end do

    100   format('     nint   Simpson')
    101   format(i9,1pe15.6)
end


Function f(x)
    implicit none
    double precision f, x
     f = x
    return
end

Subroutine simpson(f,a,b,integral,n)
    implicit none
    double precision f, a, b, integral,s
    double precision h, x
    integer nint
    integer n, i

    if((n/2)*2.ne.n) n=n+1

    s = 0.0
    h = (b-a)/dfloat(n)
    do i=2, n-2, 2
       x   = a+dfloat(i)*h
       s = s + 2.0*f(x) + 4.0*f(x+h)
    end do
    integral = (s + f(a) + f(b) + 4.0*f(a+h))*h/3.0
    return
end subroutine simpson