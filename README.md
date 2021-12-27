# `bisection_method` [![View Bisection Method (bisection_method) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method)

Calculates the root of a univariate, scalar-valued function using the bisection method.


## Syntax

`root = bisection_method(f,a,b)`\
`root = bisection_method(f,a,b,opts)`


## Description

`root = bisection_method(f,a,b)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`root = bisection_method(f,a,b,opts)` does the same as the syntax above, but allows for the specification of optional solver parameters. `opts` is a structure that has the following fields:
   - `imax` &rightarrow; maximum number of iterations (defaults to <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{6}" title="" />)
   - `return_all` &rightarrow; all intermediate root estimates are returned if set to `true`; otherwise, only the converged root is returned (defaults to `false`)
   - `TOL` &rightarrow; tolerance (defaults to <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{-12}" title="" />)
   - `warnings` &rightarrow; `true` if any warnings should be displayed, `false` if not (defaults to `true`)


## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See ["Bisection_Method.pdf"](https://tamaskis.github.io/documentation/Bisection_Method.pdf) (also included with download) for the technical documentation.
