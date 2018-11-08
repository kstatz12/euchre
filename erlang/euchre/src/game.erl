-module(game).

-export([start/0, deal_one/1, deal_two/1]).
-export([get_top_card/2]).

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
     #card{suit = hearts, rank = 11},
     #card{suit = spades, rank = 11},
     #card{suit = diamonds, rank = 11},
     #card{suit = clubs, rank = 11},
     #card{suit = hearts, rank = 10},
     #card{suit = spades, rank = 10},
     #card{suit = diamonds, rank = 10},
     #card{suit = clubs, rank = 10},
     #card{suit = hearts, rank = 9},
     #card{suit = spades, rank = 9},
     #card{suit = diamonds, rank = 9},
     #card{suit = clubs, rank = 9}
   ].

shuffle(Deck) when is_list(Deck)->
    [X || {_,X} <- lists:sort([{rand:uniform(), N} || N <- Deck])].

get_top_card(Cards, Trump) ->
    [H | T] = rank(Cards, Trump),
    {H, T}.

rank(Cards, Trump) when is_list(Cards), is_atom(Trump) ->
    [R || R <- Cards, R#card.suit =:= Trump, R#card.rank =:= 11] ++
    [L || L <- Cards, R#card.suit =:= reciprocating_trump(Trump), L#card.rank =:= 11] ++

    Trumps = get_trump_ordered(fun(L, R) -> L#card.rank > R#card.rank end, Cards, Trump),
    NonTrumps = get_non_trump_ordered(fun(L, R) -> L#card.rank > R#card.rank end, Cards, Trump),
    Bowers ++ Trumps ++ NonTrumps;
rank([], _) ->
    {error, "Cards Empty"}.

get_bowers(Cards, Trump) ->
    Right = [R || R <- Cards, R#card.suit =:= Trump, R#card.rank =:= 11],
    Left = [L || L <- Cards, L#card.suit =:= reciprocating_trump(Trump), L#card.rank =:= 11],
    lists:append(Right, Left).

get_trump_ordered(Pred, Cards, Trump) when is_function(Pred) ->
    [T || T <- lists:sort(card_order_predicate, [UT || UT <- Cards, UT#card.suit =:= Trump, UT#card.rank =/= 11])].

get_non_trump_ordered(Pred, Cards, Trump) when is_function(Pred) ->
    [NT || NT <- lists:sort(card_order_predicate, [UNT || UNT <- Cards, UNT#card.suit =/= Trump, UNT#card.rank =/= 11])].

reciprocating_trump(hearts) ->
    diamonds;
reciprocating_trump(diamonds) ->
    hearts;
reciprocating_trump(spades) ->
    clubs;
reciprocating_trump(clubs) ->
    spades.

card_order_predicate(L, R) ->
    L#card.rank > R#card.rank.





