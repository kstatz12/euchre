-module(game_server).
-behavior(gen_server).

-include("contracts.hrl").


start_link() ->
    gen_server:start_link(?MODULE, [], []).


init([]) ->
    PlayerOne = #player{hand = [], team = a},
    PlayerTwo = #player{hand = [], team = b},
    PlayerThree = #player{hand = [], team = a},
    PlayerFour = #player{hand = [], team = b},
    Players = [PlayerOne, PlayerTwo, PlayerThree, PlayerFour],
    State = #game_state{players = Players, state = pre_game},
    {ok, State}.

start_game(Pid) ->
    gen_server:call(Pid, {start}).

deal(Pid) ->
    gen_server:cast(Pid, {deal}).

show_trump(Pid) ->
    gen_server:call(Pid, {show_trump}).

handle_call({start}, _From, State) ->
    Deck = game:start(),
    NewState = #game_state{
                  players = State#game_state.players,
                  state = started,
                  pot = [],
                  deck = Deck
                  },
    {reply, ok, NewState};
handle_call({deal}, _From, State) ->
    ok.






