% bisection_method  Calculates the root of a univariate function using the 
% bisection method.
%
%   root = bisection_method(f,a,b) returns the root of a function f(x)
%   specified by the function handle "f", where "a" and "b" define the
%   initial guess for the interval [a,b] containing the root. The default 
%   tolerance and maximum number of iterations are TOL = 1e-12 and 
%   imax = 1e6, respectively.
%
%   root = bisection_method(f,a,b,TOL) returns the root of a function f(x)
%   specified by the function handle "f", where "a" and "b" define the
%   initial guess for the interval [a,b] containing the root and "TOL" is 
%   the tolerance. The default maximum number of iterations is imax = 1e6.
%
%   root = bisection_method(f,a,b,[],imax) eturns the root of a function 
%   f(x) specified by the function handle "f", where "a" and "b" define the
%   initial guess for the interval [a,b] containing the root and "imax" is
%   the maximum number of iterations. The default tolerance is TOL = 1e-12.
%
%   root = bisection_method(f,a,b,TOL,imax) returns the root of a function 
%   f(x) specified by the function handle "f", where "a" and "b" define the
%   initial guess for the interval [a,b] containing the root, "TOL" is the
%   tolerance, and "imax" is the maximum number of iterations.
%
%   root = bisection_method(__,'all') returns a vector, where the first
%   element of this vector is the initial guess, all intermediate elements
%   are the intermediate estimates of the root, and the last element is the
%   converged root. This identifier 'all' may be appended to any of the
%   syntaxes used above.
%
% See also fzero
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method
% GitHub: https://github.com/tamaskis/bisection_method-MATLAB
%
% See "Bisection Method - MATLAB implementation.pdf" for additional 
% documentation and examples. Examples can also be found in EXAMPLES.m.
% Both of these files are included with the download.
%
% Copyright (c) 2021 Tamas Kis



%% FUNCTION

% INPUT: f - function handle for f(x)
%        a - lower bound for initial guess of interval containing root
%        b - upper bound for initial guess of interval containing root
%        TOL - (OPTIONAL) tolerance
%        imax - (OPTIONAL) maximum number of iterations
%        output - if specified as 'all', function will returns all 
%                 intermediate root estimates; otherwise, a faster 
%                 algorithm is used to only return the converged root
% OUTPUT: root - root of f(x)
%          --> if "output" is specified as 'all', then "root" will be a 
%              vector, where the first element is the initial guess, the 
%              last element is the converged root, and the other elements 
%              are intermediate estimates of the root
%          --> otherwise, "root" is a single number storing the converged
%              root
function root = bisection_method(f,a,b,TOL,imax,output)
    
    % sets default tolerance and maximum number of iterations if not
    % specified by user
    if (nargin < 4) || isempty(TOL)
        TOL = 1e-12;
    end
    if (nargin < 5) || isempty(imax)
        imax = 1e6;
    end
    
    % decides which algorithm to use
    if nargin < 6
        return_all = false;
    else
        if strcmp(output,'all')
            return_all = true;
        else
            return_all = false;
        end
    end
    
    % implements algorithm for the bisection method where all intermediate 
    % root estimates are also returned
    if return_all
        
        % preallocates x
        x = zeros(imax,1);
    
        % inputs initial guess for root into x vector
        x(1) = (a+b)/2;

        % bisection method
        i = 1;
        while (i < imax) && ((b-a) > TOL)
            
            % updates interval
            if f(x(i)) == 0
                break;
            elseif sign(f(x(i))) == sign(f(a))
                a = x(i);
            else
                b = x(i);
            end
            
            % updates root estimate
            x(i+1) = (a+b)/2;

            % increments loop index
            i = i+1;

        end

        % returns converged root along with intermediate root estimates
        root = x(1:i);
    
    else
        
        % sets initial guess
        c = (a+b)/2;

        % bisection method
        i = 1;
        while ((b-a) > TOL) && (i < imax)

            % updates interval
            if f(c) == 0
                break;
            elseif sign(f(c)) == sign(f(a))
                a = c;
            else
                b = c;
            end
            
            % updates root estimate
            c = (a+b)/2;

            % increments loop index
            i = i+1;

        end

        % returns root
        root = c;
        
    end
      
end