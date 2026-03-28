:- use_module(library(readutil)).

start :-
    nl,
    write('----- Mental Health Analyzer -----'), nl,
    write('How are you feeling today?'), nl,
    read_line_to_string(user_input, X),
    convert(X, Words),
    check(Words, E),
    reply(E).

convert(X, Words) :-
    string_lower(X, L),
    split_string(L, " ", ".,!?;", Words).

check(Words, sad) :-
    member(A, Words),
    (A = "sad"; A = "down"; A = "lonely"; A = "unhappy"), !.

check(Words, stress) :-
    member(A, Words),
    (A = "stress"; A = "stressed"; A = "pressure"; A = "exam"), !.

check(Words, anxiety) :-
    member(A, Words),
    (A = "anxious"; A = "worried"; A = "nervous"), !.

check(Words, anger) :-
    member(A, Words),
    (A = "angry"; A = "frustrated"; A = "annoyed"), !.

check(Words, happy) :-
    member(A, Words),
    (A = "happy"; A = "good"; A = "great"; A = "excited"), !.

check(_, normal).

reply(sad) :-
    nl,
    write('You seem a bit sad.'), nl,
    write('Try talking to a friend or taking rest.'), nl.

reply(stress) :-
    nl,
    write('Looks like you are stressed.'), nl,
    write('Take a break and relax your mind.'), nl.

reply(anxiety) :-
    nl,
    write('You might be feeling anxious.'), nl,
    write('Try breathing exercises and stay calm.'), nl.

reply(anger) :-
    nl,
    write('You sound angry.'), nl,
    write('Pause for a moment and breathe slowly.'), nl.

reply(happy) :-
    nl,
    write('Nice! You seem happy.'), nl,
    write('Keep it up and spread positivity.'), nl.

reply(normal) :-
    nl,
    write('I could not clearly understand.'), nl,
    write('But take care and stay positive.'), nl.