# `bisection_method` [![View Bisection Method (bisection_method) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method)

Calculates the root of a univariate function using the bisection method.


## Syntax

`root = bisection_method(f,a,b)`\
`root = bisection_method(f,a,b,TOL)`\
`root = bisection_method(f,a,b,[],imax)`\
`root = bisection_method(f,a,b,TOL,imax)`\
`root = bisection_method(__,'all')`


## Description

`root = bisection_method(f,a,b)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = bisection_method(f,a,b,TOL)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`root = bisection_method(f,a,b,[],imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`root = bisection_method(f,a,b,TOL,imax)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`root = bisection_method(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the root, and the last element is the converged root. This identifier 'all' may be appended to any of the syntaxes used above.


## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   -  See "Bisection Method.pdf" (included with download, also available at https://tamaskis.github.io/documentation/Bisection%20Method.pdf) for additional documentation.
