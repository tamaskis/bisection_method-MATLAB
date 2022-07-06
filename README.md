# `bisection_method` [![View Bisection Method (bisection_method) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method)

Bisection method for finding the root of a univariate, scalar-valued function.


## Syntax

`x = bisection_method(f,a,b)`\
`x = bisection_method(f,a,b,opts)`\
`[x,k] = bisection_method(__)`\
`[x,k,x_all] = bisection_method(__)`


## Description

`x = bisection_method(f,a,b)` returns the root of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `a` and `b` define the initial guess for the interval <img src="https://latex.codecogs.com/svg.latex?\inline&space;[a,b]" title="[a,b]" /> containing the root.

`x = bisection_method(f,a,b,opts)` does the same as the syntax above, but allows for the specification of optional solver parameters. `opts` is a structure with the following fields:
   - `k_max` &rightarrow; maximum number of iterations (defaults to 200)
   - `return_all` &rightarrow; returns estimates at all iteration if set to `true` (defaults to `false`)
   - `TOL` &rightarrow; tolerance (defaults to <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{-10}" title="" />)

`[x,k] = bisection_method(__)` also returns the number of iterations (`k`) performed of the bisection method.

`[x,k,x_all] = bisection_method(__)` does the same as the previous syntaxes, but also returns an array (`x_all`) storing the root estimates at each iteration. This syntax requires that `opts.return_all` be set to true.


## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See ["Root_Finding_Methods.pdf"](https://tamaskis.github.io/files/Root_Finding_Methods.pdf) (also included with download) for the technical documentation.
