%==========================================================================
%
% bisection_method  Calculates the root of a univariate, scalar-valued 
% function using the bisection method.
%
%   root = bisection_method(f,a,b)
%   root = bisection_method(f,a,b,opts)
%
% See also fzero, newtons_method, secant_method, fixed_point_iteration.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-11
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Bisection_Method.pdf
%
% REFERENCES:
%   [1] https://en.wikipedia.org/wiki/Bisection_method
%   [2] Burden and Faires, "Numerical Analysis", 9th Ed. (pp. 48-55)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar-valued function f(x)
%             (f:R->R)
%   a       - (1×1 double) initial guess for lower bound of interval with 
%             root
%   b       - (1×1 double) initial guess for upper bound of interval with 
%             root
%   opts    - (OPTIONAL) (1×1 struct) solver options
%       • imax          - (1×1 double) maximimum number of iterations
%       • return_all    - (1×1 logical) all intermediate root estimates are
%                         returned if set to "true"; otherwise, a faster 
%                         algorithm is used to return only the converged 
%                         root
%       • TOL           - (1×1 double) tolerance
%       • warnings      - (1×1 logical) true if any warnings should be
%                         displayed, false if not
%
% -------
% OUTPUT:
% -------
%   root    - (1×1 or n×1 double) root of f(x)
%           	--> If "return_all" is specified as "true", then "root" 
%                   will be a vector, where the first element is the 
%                   initial guess, the last element is the converged root, 
%                   and the other elements are intermediate estimates of 
%                   the root.
%               --> Otherwise, "root" is a single number storing the
%                   converged root.
%
%==========================================================================
function root = bisection_method(f,a,b,opts)
    
    % ----------------------------------
    % Sets (or defaults) solver options.
    % ----------------------------------
    
    % sets maximum number of iterations (defaults to 1e6)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'imax')
        imax = 1e6;
    else
        imax = opts.imax;
    end
    
    % determines return value (defaults to only return converged root)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'return_all')
        return_all = false;
    else
        return_all = opts.return_all;
    end
    
    % sets tolerance (defaults to 1e-12)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'TOL')
        TOL = 1e-12;
    else
        TOL = opts.TOL;
    end
    
    % determines if warnings should be displayed (defaults to true)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'warnings')
        warnings = true;
    else
        warnings = opts.warnings;
    end
    
    % ----------------------------------------------------
    % "Return all" implementation of the bisection method.
    % ----------------------------------------------------
    
    if return_all
        
        % preallocates x
        x = zeros(imax,1);
    
        % inputs initial guess for root into x vector
        x(1) = (a+b)/2;

        % bisection method
        i = 1;
        while ((b-a) > TOL) && (i < imax)
            
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
        
        % displays warning if maximum number of iterations reached
        if (i == imax) && warnings
            warning(strcat('The method failed after n=',num2str(imax),...
                ' iterations.'));
        end

        % returns converged root along with intermediate root estimates
        root = x(1:i);
    
    % ----------------------------------------------
    % "Fast" implementation of the bisection method.
    % ----------------------------------------------
    
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
        
        % displays warning if maximum number of iterations reached
        if (i == imax) && warnings
            warning(strcat('The method failed after n=',num2str(imax),...
                ' iterations.'));
        end

        % returns converged root
        root = c;
        
    end
      
end