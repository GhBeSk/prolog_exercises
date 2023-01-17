/*Begin Question 3.1*/
indices( [], _XS, [] ).
indices([I | IS], XS, ES ) :-
    nth0(I, XS, X),
    % recursively extract values for remaining indices
    indices(IS, XS, ESTail),
    ES = [X | ESTail].
/*End Question 3.1*/

/*Begin Question 3.2*/
possible(GRID) :-
    permutation1([1,2,3,4,5,6,7,8,9], GRID).

permutation1([], []).
permutation1([X | Rest], L) :-
    permutation1(Rest, L1),
    % select produces several lists L
    % with X inserted in L1 in all possible positions
    select(X, L, L1).
/*End Question 3.2*/

/*Begin Question 3.3*/
acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :-
    % just extract values for given indices
    % sum extracted values and ensure that their sum
    % is expected
    
    % x x -
    % x x -
    % - - -
    indices([0,1,3,4], GRID, T0Values),
    sum_list(T0Values, T0),
    
    % - x x
    % - x x
    % - - -
    indices([1,2,4,5], GRID, T1Values),
    sum_list(T1Values, T1),
    
    % - - -
    % x x -
    % x x -
    indices([3,4,6,7], GRID, T2Values),
    sum_list(T2Values, T2),
    
    % - - -
    % - x x
    % - x x
    indices([4,5,7,8], GRID, T3Values),
    sum_list(T3Values, T3),
    
    % compute sums for given indices
    % for every color U, V, W
    indices(US, GRID, USValues),
    sum_list(USValues, U),
    
    indices(VS, GRID, VSValues),
    sum_list(VSValues, V),
    
    indices(WS, GRID, WSValues),
    sum_list(WSValues, W).

sum_list([], 0).
sum_list([X | Xs], Sum) :-
    % just sum all elements recursively
    sum_list(Xs, SumTail),
    Sum is X + SumTail.
    
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :-
	possible(GRID),
	acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/

%% -- any main predicates for testing goes here
    
correct_solution3 :-
    indices( [1,3,4], [a,b,c,d,e,f], ES ),
    ES = [b, d, e],
    
    indices( [0,5], [a,b,c,d,e,f], [a,f]),
    
    indices( [2,2,4], [a,b,c,d,e,f], [c,c,e]),

    acceptable( 15, 14, 26, 23
              , [0,1,2,3], 16
              , [4,6,7], 17
              , [5,8], 12
              , [1, 2, 4, 9, 3, 5, 6, 8, 7]),
    
    suko( 15, 14, 26, 23
        , [0,1,2,3], 16
        , [4,6,7], 17
        , [5,8], 12
        , GRID ),
    GRID = [1, 2, 4, 9, 3, 5, 6, 8, 7].

