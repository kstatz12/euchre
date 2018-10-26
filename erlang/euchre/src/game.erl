-module(game).

-export([start/0, deal_one/1, deal_two/1]).

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
     #card{suit = "Hearts", rank = "A"},
     #card{suit = "Spades", rank = "A"},
     #card{suit = "Diamonds", rank = "A"},
     #card{suit = "Clubs", rank = "A"},
     #card{suit = "Hearts", rank = "K"},
     #card{suit = "Spades", rank = "K"},
     #card{suit = "Diamonds", rank = "K"},
     #card{suit = "Clubs", rank = "K"},
     #card{suit = "Hearts", rank = "Q"},
     #card{suit = "Spades", rank = "Q"},
     #card{suit = "Diamonds", rank = "Q"},
     #card{suit = "Clubs", rank = "Q"},
     #card{suit = "Hearts", rank = "J"},
     #card{suit = "Spades", rank = "J"},
     #card{suit = "Diamonds", rank = "J"},
     #card{suit = "Clubs", rank = "J"},
     #card{suit = "Hearts", rank = "10"},
     #card{suit = "Spades", rank = "10"},
     #card{suit = "Diamonds", rank = "10"},
     #card{suit = "Clubs", rank = "10"},
     #card{suit = "Hearts", rank = "9"},
     #card{suit = "Spades", rank = "9"},
     #card{suit = "Diamonds", rank = "9"},
     #card{suit = "Clubs", rank = "9"},
     #card{suit = "Hearts", rank = "8"},
     #card{suit = "Spades", rank = "8"},
     #card{suit = "Diamonds", rank = "8"},
     #card{suit = "Clubs", rank = "8"}
    ].

shuffle(Deck) when is_list(Deck)->
    [X||{_,X} <- lists:sort([{rand:uniform(), N} || N <- Deck])].

remove(List, Elem) ->    
    lists:filter(fun(E)-> not lists:member(E, Elem) end, List).
