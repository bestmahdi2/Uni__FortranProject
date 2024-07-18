PROGRAM Three
     REAL v0y, v0, phi, g, y0, FindTime, Time, Angle, vx, vy
     CHARACTER(len=32) :: TimeString, VxStr, VyStr, AngelStr

     v0 = 25
     g = 10
     phi = DegreeToRadian(35.0)
     y0 = -20

    v0y = v0 * sin(phi)

     ! Part A:
     Time = FindTime(v0y, phi, y0, g)

     WRITE(TimeString, *) Time

     PRINT *, "A) t =" // TimeString

    PRINT '(A)'

    ! Part B:
    PRINT *, "B)"

    vx = v0 * cos(phi)
    vy = v0y - g * Time

    Angel = ATAN(vy / vx)

    DAngel = RadianToDegree(Angel)

    WRITE(AngelStr, *) DAngel
    WRITE(VxStr, *) vx
    WRITE(VyStr, *) vy

    PRINT *, "vx =" // VxStr
    PRINT *, "vy =" // VyStr
    PRINT *, "Angel =" // AngelStr

END PROGRAM Three



FUNCTION FindTime(v0y, phi, y0, g)
    IMPLICIT NONE
    REAL v0y, phi, g, delta, y0, FindTime


    delta = v0y ** 2 - 4 * (0.5 * g * y0)

    FindTime = (v0y + SQRT(delta)) / (2 * (0.5 * g))
    RETURN
END FUNCTION  FindTime


REAL FUNCTION  DegreeToRadian(Degree)
    REAL, PARAMETER :: PI        = 3.1415926
    REAL :: Degree
    REAL, PARAMETER :: Degree180 = 180.0
    REAL, PARAMETER :: D_to_R    = PI/Degree180

    DegreeToRadian = Degree * D_to_R
END FUNCTION  DegreeToRadian


FUNCTION RadianToDegree(Radian)
    REAL, PARAMETER :: PI        = 3.1415926
    REAL :: Radian
    REAL, PARAMETER :: Degree180 = 180.0
    REAL, PARAMETER :: R_to_D    = Degree180/PI

     RadianToDegree = Radian * R_to_D
END FUNCTION  RadianToDegree

