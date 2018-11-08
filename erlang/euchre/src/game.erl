-module(game).

-export([start/0, deal_one/1, deal_two/1]).
-export([rank/2]).

-record(card, {suit, rank}).

start() ->
    Deck = get_deck(),
    shuffle(Deck).

deal_one(Deck) ->
    [H | T] = Deck,
    {H, T}.

deal_two(Deck) ->
    [A, B | Tail] = Deck,
    {A, B, Tail}.

get_deck() ->
    [
     #card{suit = hearts, rank = 14},
     #card{suit = spades, rank = 14},
     #card{suit = diamonds, rank = 14},
     #card{suit = clubs, rank = 14},
     #card{suit = hearts, rank = 13},
     #card{suit = spades, rank = 13},
     #card{suit = diamonds, rank = 13},
     #card{suit = clubs, rank = 13},
     #card{suit = hearts, rank = 12},
     #card{suit = spades, rank = 12},
     #card{suit = diamonds, rank = 12},
     #card{suit = clubs, rank = 12},
     #card{suit = hearts, rank = 12},
     #card{suit = spades, rank = 11},
     #card{suit = diamonds, rank = 11},
     #card{suit = clubs, rank = 11},
     #card{suit = hearts, rank = 10},
     #card{suit = spades, rank = 10},
     #card{suit = diamonds, rank = 10},
     #card{suit = clubs, rank = 9},
     #card{suit = hearts, rank = 9},
     #card{suit = spades, rank = 9},
     #card{suit = diamonds, rank = 9},
     #card{suit = clubs, rank = 9},
     #card{suit = hearts, rank = 8},
     #card{suit = spades, rank = 8},
     #card{suit = diamonds, rank = 8},
     #card{suit = clubs, rank = 8}
    ].

shuffle(Deck) when is_list(Deck)->
    [X||{_,X} <- lists:sort([{rand:uniform(), N} || N <- Deck])].


rank(Hand, Trump) when is_list(Hand), is_atom(Trump) ->
    Bowers = get_bowers(Hand, Trump),
    Trumps = get_trump_ordered(fun(L, R) -> L#card.rank > R#card.rank end, Hand, Trump),
    NonTrumps = get_non_trump_ordered(fun(L, R) -> L#card.rank > R#card.rank end, Hand, Trump),
    lists:append(Bowers, Trumps, NonTrumps);
rank([], _) ->
    {error, "Hand Empty"}.

get_bowers(Hand, Trump) ->
    Left = [L || L <- Hand, L#card.suit =:= Trump, L#card.rank =:= 11],
    Right = [R || R <- Hand, R#card.suit =:= reciprocating_trump(Trump), R#card.rank =:= 11],
    lists:append(Left, Right).

get_trump_ordered(Pred, Hand, Trump) when is_function(Pred) ->
    [T || T <- lists:sort(Pred, [UT || UT <- Hand, UT#card.suit =:= Trump, UT#card.rank =/= 11])].

get_non_trump_ordered(Hand, Trump, Pred) when is_function(Pred) ->
    [NT || NT <- lists:sort(Pred, [UNT || UNT <- Hand, UNT#card.suit =/= Trump])].  

reciprocating_trump(hearts) ->
    diamonds;
reciprocating_trump(diamonds) ->
    hearts;
reciprocating_trump(spades) ->
    clubs;
reciprocating_trump(clubs) ->
    spades.





