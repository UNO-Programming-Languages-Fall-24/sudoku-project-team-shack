% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%define field
row(1..4).
col(1..4).

%define subgrids
subgrid(X,Y,1) :- X<=2, Y<=2.
subgrid(X,Y,2) :- X<=2, Y>2.
subgrid(X,Y,3) :- X>2, Y<=2.
subgrid(X,Y,4) :- X>2, Y>2.

%fill in givens
sudoku(X,Y,N) :- initial(X,Y,N).

%generate all possible solutions
{sudoku(X,Y,N) : N=1..4} = 1 :- row(X), col(Y).

%filter row and column collisions
:- sudoku(X,Y,N), sudoku(X,Y2, N) , Y != Y2.
:- sudoku(X,Y,N), sudoku(X2,Y, N) , X != X2.

#show sudoku/3.
