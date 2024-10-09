% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%define field
row(1..9).
col(1..9).

%define subgrids
{subgrid(X,Y,G) : G=1..9} = 1 :- row(X), col(Y).
:- subgrid(X,Y,G), X<=3, Y<=3, G!=1.
:- subgrid(X,Y,G), X<=3, Y>3, Y<=6, G!=2.
:- subgrid(X,Y,G), X<=3, Y<=6, G!=3.

:- subgrid(X,Y,G), X>3, X<=6, Y<=3, G!=4.
:- subgrid(X,Y,G), X>3, X<=6, Y>3,  Y<=6 G!=5.
:- subgrid(X,Y,G), X>3, X<=6, Y<=6, G!=6.

:- subgrid(X,Y,G), X>6, Y<=3, G!=7.
:- subgrid(X,Y,G), X>6, Y>3,  Y<=6 G!=8.
:- subgrid(X,Y,G), X>6, Y>6, G!=9.

%fill in givens
sudoku(X,Y,N) :- initial(X,Y,N).

%generate all possible solutions
{sudoku(X,Y,N) : N=1..9} = 1 :- row(X), col(Y).

%filter row and column collisions
:- sudoku(X,Y,N), sudoku(X,Y', N) , Y != Y'.
:- sudoku(X,Y,N), sudoku(X',Y, N) , X != X'.

%filter subgrid collisions
:- sudoku(X,Y,N), subgrid(X,Y,G), sudoku(X',Y',N), subgrid(X',Y', G), X' != X, Y' != Y.

#show sudoku/3.
