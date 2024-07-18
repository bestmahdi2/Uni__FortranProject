PROGRAM RungeKutta
    IMPLICIT none
    REAL:: x,y,xp,h,m1,m2,m3,m4,f
    INTEGER:: n,int,i

    x = 0.0
    y = 1.0
    xp = 2.0
    h = 0.2

    n=int((xp-x)/h)
    WRITE(*,*) n

    DO i=1,n
        m1=h*f(x,y)
        m2=h*f(x+0.5*h,y+0.5*m1)
        m3=h*f(x+0.5*h,y+0.5*m2)
        m4=h*f(x+h,y+m3)
        x=x+h
        y=y+(m1+2.0*m2+2.0*m3+m4)*(1.0/6.0)
        WRITE(*,*) i,x,y
    END DO

    WRITE(*,*)'value of y at x=',x,'is',y

END PROGRAM

REAL FUNCTION f(x,y)
    REAL:: x,y
    f=(x - y) / 2
END FUNCTION