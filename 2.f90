PROGRAM Two
    INTEGER(kind=1) :: aNumber, bNumber, cNumber
    character(len=8) :: aString, bString, cString

    INTEGER, DIMENSION(3, 3) :: array
    array = reshape((/ 11, 13, 17,8, 3, 9, 27, 65, 31 /), shape(array))

    PRINT *, "A:"

    DO i=1,3
        aNumber = array(1,i)
        bNumber = array(2,i)
        cNumber = array(3,i)

        WRITE(aString,*) aNumber
        WRITE(bString,*) bNumber
        WRITE(cString,*) cNumber

        PRINT *, aString // bString // cString
    END DO

    PRINT '(A)'
    PRINT *, "Transpose of A:"

    DO i=1,3
        aNumber = array(i,1)
        bNumber = array(i,2)
        cNumber = array(i,3)

        WRITE(aString,*) aNumber
        WRITE(bString,*) bNumber
        WRITE(cString,*) cNumber

        PRINT *, aString // bString // cString
    END DO

END PROGRAM Two