PROGRAM main
    IMPLICIT NONE
    REAL(kind = 8):: x0, eps,f,Df
    INTEGER :: max_iter
    CHARACTER(len=128) :: newton

    x0 = -1
    eps = 0.0000000001
    max_iter = 20

    PRINT *, newton(x0, eps, max_iter)

END PROGRAM

CHARACTER(len=128) FUNCTION newton(x0, eps, max_iter) RESULT(RESULTs)
    REAL(kind = 8):: f,Df,eps,x0,fxn,xn
    INTEGER :: max_iter
    CHARACTER(len=36) :: aString, bString

    RESULTs = "nothing"

    xn = x0
    DO i=0,max_iter-1
        fxn = f(xn)

        IF (ABS(fxn) < eps) then
            WRITE(aString,*) i
            WRITE(bString, *) xn
            RESULTs = "Found solution after" // aString // "iterations." // "RESULT : " // bString
            RETURN
        END IF

        Dfxn = Df(xn)
        IF (Dfxn == 0) then
            RESULTs =  "Zero derivative. No solution found."
            RETURN
        END IF
        xn = xn - (fxn / Dfxn)
    END DO

    RESULTs =  "Exceeded maximum iterations. No solution found."
    RETURN

END FUNCTION

REAL(kind = 8) FUNCTION f(x)
    REAL(kind = 8):: x
    f=2 * x ** 2 + 2 * cos(x)
END FUNCTION

REAL(kind = 8) FUNCTION Df(x)
    REAL(kind = 8):: x
    f=4 * x - 2 * sin(x)
END FUNCTION

!REAL(kind = 8) FUNCTION f(x)
!    REAL(kind = 8):: x
!    f=x**3 - x**2 - 1
!END FUNCTION
!
!REAL(kind = 8) FUNCTION Df(x)
!    REAL(kind = 8):: x
!    f=3*x**2 - 2*x
!END FUNCTION