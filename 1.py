def newton(f, Df, x0, epsilon, max_iter):
    '''Approximate solution of f(x)=0 by Newton's method.

    Parameters
    ----------
    f : function
        Function for which we are searching for a solution f(x)=0.
    Df : function
        Derivative of f(x).
    x0 : number
        Initial guess for a solution f(x)=0.
    epsilon : number
        Stopping criteria is abs(f(x)) < epsilon.
    max_iter : integer
        Maximum number of iterations of Newton's method.

    Returns
    -------
    xn : number
        Implement Newton's method: compute the linear approximation
        of f(x) at xn and find x intercept by the formula
            x = xn - f(xn)/Df(xn)
        Continue until abs(f(xn)) < epsilon and return xn.
        If Df(xn) == 0, return None. If the number of iterations
        exceeds max_iter, then return None.

    Examples
    --------
    > f = lambda x: x**2 - x - 1
    > Df = lambda x: 2*x - 1
    > newton(f,Df,1,1e-8,10)
    Found solution after 5 iterations.
    1.618033988749989
    '''

    #########################

    xn = x0
    for n in range(0, max_iter):
        fxn = f(xn)

        if abs(fxn) < epsilon:
            print('Found solution after', n, 'iterations.')
            # return xn
        Dfxn = Df(xn)
        if Dfxn == 0:
            print('Zero derivative. No solution found.')
            return None
        print(fxn, xn, Dfxn)
        xn = xn - fxn / Dfxn
        print(xn)

    print('Exceeded maximum iterations. No solution found.')
    return None


from math import sin, cos
p = lambda x: 2 * x ** 2 + 2 * cos(x)
Dp = lambda x: 4 * x - 2 * sin(x)

# [-2, 0] ==> -1
x0 = -1
epsilon = 1e-10
max_iter = 100
newton(p, Dp, x0, epsilon, max_iter)


# p = lambda x: x**3 - x**2 - 1
# Dp = lambda x: 3*x**2 - 2*x
# print(newton(p,Dp,1,1e-10,10))

