/*Begin Question 4.1*/


prime(N) :-
    not(prime_divisor_exist(2, N)).

prime_divisor_exist(D, N) :-
    D < N,
    0 is N mod D,
    % if at least one number < N divides
    % then terminate immediately, it is divisible
    !.
prime_divisor_exist(D, N) :-
    D < N,
    D1 is D+1,
    prime_divisor_exist(D1, N).

/*End Question 4.1*/

/*Begin Question 4.2*/
possible(X, Y, Z) :-
    % since all 1..9 digits must be present
    % and we have exactly three numbers
    % it doesn't make much sense
    % to try values below 100.
    % zeros are also not supposed to be
    % present
    between(123,359,X),
    between(123,359,Y),
    between(123,359,Z).
/*End Question 4.2*/

/*Begin Question 4.3*/
acceptable( X, Y, Z ) :-
    % first check whether digits
    % of proposed X,Y,Z
    % are exactly digits from 1 to 9
    % without repetitions
    digits(X, XD),
    digits(Y, YD),
    digits(Z, ZD),
    
    % concat all digits into one array
    % and sort it
    append(XD, YD, XYD),
    append(XYD, ZD, D),
    sort(D, SortedDigits),
    % ensure that all digits are present exactly once
    SortedDigits = [1,2,3,4,5,6,7,8,9],
    
    not(prime(X)),
    not(prime(Y)),
    not(prime(Z)).

% produce list of digits D
% for given positive integer X
digits(X, D) :-
    X =< 9,
    D = [X].
digits(X, D) :-
    X > 9,
    D1 is X mod 10,
    X1 is X div 10,
    % take rightmost digit D1
    % continue recursively with
    % remaining digits to the left
    digits(X1, Ds),
    D = [D1 | Ds].

trait( X, Y, Z ) :-
    possible(X,Y,Z),
    acceptable(X,Y,Z).

/*End Question 4.3*/

correct_solution4 :-
    prime( 17 ),
    prime( 97 ),
    prime( 997 ),
    not(prime(144)),
    not(prime(115)),
    
    acceptable( 169, 247, 358 ),
    
    trait(146, 279, 358),
    trait(176, 348, 259).
