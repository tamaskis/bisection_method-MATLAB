%==========================================================================
%
% bisection_method  Bisection method for finding the root of a univariate, 
% scalar-valued function.
%
%   x = bisection_method(f,a,b)
%   x = bisection_method(f,a,b,opts)
%   [x,k] = bisection_method(__)
%   [x,k,x_all] = bisection_method(__)
%
% See also fzero, newtons_method, secant_method.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-10-16
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Root_Finding_Methods.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar-valued function, 
%             f(x) (f : ℝ → ℝ)
%   a       - (1×1 double) lower bound of interval containing root
%   b       - (1×1 double) upper bound of interval containing root
%   opts    - (OPTIONAL) (1×1 struct) solver options
%       • k_max      - (1×1 double) maximimum number of iterations 
%                      (defaults to 200)
%       • return_all - (1×1 logical) returns estimates at all iterations if
%                      set to "true"
%       • TOL        - (1×1 double) tolerance (defaults to 10⁻¹⁰)
%
% -------
% OUTPUT:
% -------
%   x       - (1×1 double) root of f(x)
%   k       - (1×1 double) number of solver iterations
%   x_all   - (1×(k+1) double) root estimates at all iterations
%
%==========================================================================
function [x,k,x_all] = bisection_method(f,a,b,opts)
    
    % ----------------------------------
    % Sets (or defaults) solver options.
    % ----------------------------------
    
    % sets maximum number of iterations (defaults to 200)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'k_max')
        k_max = 200;
    else
        k_max = opts.k_max;
    end
    
    % determines if all intermediate estimates should be returned
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'return_all')
        return_all = false;
    else
        return_all = opts.return_all;
    end
    
    % sets tolerance (defaults to 10⁻¹⁰)
    if (nargin < 4) || isempty(opts) || ~isfield(opts,'TOL')
        TOL = 1e-10;
    else
        TOL = opts.TOL;
    end
    
    % -----------------
    % Bisection method.
    % -----------------
    
    % root estimate at first iteration
    c = (a+b)/2;
    
    % returns root estimate at first iteration if it is a root of f(x)
    if f(c) == 0
        x = c;
        return
    end
    
    % function evaluations at first iteration
    fa = f(a);
    fc = f(c);
    
    % preallocates array
    if return_all
        x_all = zeros(1,k_max+1);
    end
    
    % iteration
    for k = 1:k_max
        
        % stores results in arrays
        if return_all
            x_all(k) = c;
        end
        
        % updates interval
        if fc == 0
            break;
        elseif (fa*fc > 0)
            a = c;
            fa = fc;
        else
            b = c;
        end
        
        % updates root estimate
        c = (a+b)/2;
        
        % terminates solver if converged
        if ((b-a) < TOL)
            break;
        end
        
        % function evaluation at updated root estimate
        fc = f(c);
        
    end
    
    % converged root
    x = c;
    
    % stores converged result and trims array
    if return_all
        x_all(k+1) = x;
        x_all = x_all(1:(k+1));
    end
    
end