# `bisection_method`

Calculates the root of a univariate function using the bisection method.


## Syntax

`root = bisection_method(f,a,b)`\
`root = bisection_method(f,a,b,TOL)`\
`root = bisection_method(f,a,b,[],imax)`\
`root = bisection_method(f,a,b,TOL,imax)`\
`root = bisection_method(__,'all')`


## Description

`root = bisection_method(f,a,b)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?[a,b]" title="[a,b]" /> containing the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = bisection_method(f,a,b,TOL)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?[a,b]" title="[a,b]" /> containing the root and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`root = bisection_method(f,a,b,[],imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?[a,b]" title="[a,b]" /> containing the root and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`root = bisection_method(f,a,b,TOL,imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?[a,b]" title="[a,b]" /> containing the root, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`root = bisection_method(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the root, and the last element is the converged root. This identifier 'all' may be appended to any of the syntaxes used above.


## Example

Consider the function

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://latex.codecogs.com/svg.latex?f(x)=x^{2}-1" title="f(x)=x^{2}-1" />

Enter <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> into MATLAB.

    f = @(x) x^2-1;
    
Since <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> is a simple function, we can see, by inspection, that it will have two roots at <img src="https://latex.codecogs.com/svg.latex?x\pm1" title="x\pm1" />. Therefore, we use the bisection method twice, with two different initial guesses for the interval containing the root. Let's pick <img src="https://latex.codecogs.com/svg.latex?[-10,0]" title="[-10,0]" /> and <img src="https://latex.codecogs.com/svg.latex?[0,10]" title="[0,10]" /> as our initial guesses for this interval.

    % finds first root of f(x)=x^2-1 using the bisection method
    root1 = bisection_method(f,-10,0)

    % finds second root of f(x)=x^2-1 using the bisection method
    root2 = bisection_method(f,0,10)

This yields the result

    root1 =

        -1.0000


    root2 =

         1.0000

*NOTE: A more complex example is also provided in "Bisection Method - MATLAB Implementation.pdf".*
