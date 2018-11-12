-module(game).

-export([start/0, deal_one/1, deal_two/1]).
-export([get_top_card/2, play_card/4]).

-record(card, {suit, rank}).
-record(played_card, {suit, rank, team}).

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

get_top_card(Cards, Trump) when is_list(Cards), is_atom(Trump) ->
    [H | T] = rank(Cards, Trump),
    {H, T};
get_top_card([], _) ->
    {error, "No Cards"}.

rank(Cards, Trump) ->
    Predicate = fun(L, R) -> L#card.rank > R#card.rank end,
    RBower = [R || R <- Cards, R#card.suit =:= Trump, R#card.rank =:= 11],
    LBower = [L || L <- Cards, L#card.suit =:= reciprocating_trump(Trump), L#card.rank =:= 11],
    SortedTrump = [T || 
        T <- lists:sort(Predicate, [UT || 
            UT <- Cards, UT#card.suit =:= Trump, UT#card.rank =/= 11])],
    NTrump = [NT || 
        NT <- lists:sort(Predicate, [UNT || 
            UNT <- Cards, UNT#card.suit =/= Trump])],
    RBower ++ LBower ++ SortedTrump ++ NTrump.

play_card(Hand, Pot, Trump, Team) ->
    case Pot of
        [] ->
            [H | T] = rank(Hand, Trump),
            NewPot = Pot ++ #played_card{team = Team, rank = H#card.rank, suit = H#card.suit},
            {NewPot, T};
        _ ->
            ok
    end.

traverse_pot(Pot, Hand, Team, Trump) ->
    [H | T] = rank(Pot, Trump),
    if
        H#played_card.team =:= Team ->
            ok;
        true ->
            ok
    end;

traverse_pot([], _Hand, _Team, _Trump) ->
    ok.


play_card_from_hand(Hand, Target, Trump, Team) ->
    ok.


reciprocating_trump(hearts) ->
    diamonds;
reciprocating_trump(diamonds) ->
    hearts;
reciprocating_trump(spades) ->
    clubs;
reciprocating_trump(clubs) ->
    spades.


