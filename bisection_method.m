%==========================================================================
%
% bisection_method  Calculates the root of a univariate function using the 
% bisection method.
%
%   root = bisection_method(f,a,b)
%   root = bisection_method(f,a,b,TOL)
%   root = bisection_method(f,a,b,[],imax)
%   root = bisection_method(f,a,b,TOL,imax)
%   root = bisection_method(__,'all')
%
% See also fzero, newtons_method, secant_method
%
% Copyright © 2021 Tamas Kis
% Contact: tamas.a.kis@outlook.com
% Last Update: 2021-07-04
%
%--------------------------------------------------------------------------
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/87042-bisection-method-bisection_method
% GitHub: https://github.com/tamaskis/bisection_method-MATLAB
%
% See EXAMPLES.mlx for examples and "DOCUMENTATION.pdf" for additional 
% documentation. Both of these files are included with the download.
%
%--------------------------------------------------------------------------
%
% -------
% INPUTS:
% -------
%   f       - (function_handle) f(x)
%   a       - (1×1) lower bound for initial guess of interval with root
%   b       - (1×1) upper bound for initial guess of interval with root
%   TOL     - (OPTIONAL) (1×1) tolerance
%   imax    - (OPTIONAL) (1×1) maximum number of iterations
%   output  - (OPTIONAL) (char) if specified as 'all', function will return
%             all intermediate root estimates; otherwise, a faster 
%             algorithm is used to only return the converged root
%
% --------
% OUTPUTS:
% --------
%   root    - (1×1 or n×1) root of f(x)
%           	--> if "output" is specified as 'all', then "root" will be
%                   a vector, where the first element is the initial guess,
%                   the last element is the converged root, and the other 
%                   elements are intermediate estimates of the root
%               --> otherwise, "root" is a single number storing the
%                   converged root
%
%==========================================================================
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

        % returns converged root
        root = c;
        
    end
      
end