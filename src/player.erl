-module(player).
-behavior(gen_server).

-include("contracts.hrl").

-exports([start_link/1]).
-exports([receive_card/2, play_card/3, remove_player/1]).

start_link(Team) ->
    gen_server:start_link(?MODULE, [Team], []).

init(Team) ->
    State = #player{hand = [], team = Team},
    {ok, State}.

receive_card(Pid, Card = #player{}) ->
    gen_server:cast(Pid, {receive_card, Card}).

play_card(Pid, Trump, Pot) ->
    gen_server:call(Pid, {play_card, Trump, Pot}).

remove_player(Pid)->
    gen_server:call(Pid, {terminate}).



handle_cast({receive_card, Card = #card{}}, _,State)->
    {noreply, [Card|State#player.hand]}.

handle_call({play_card, Trump, Pot},_From, State) ->
    if State#player.hand =:= [] ->
            {reply, no_cards, State};
       State#player.hand =/= [] ->
            {T, R} = game:play_card(State#player.hand, Pot, Trump, State#player.team),
            {reply, T, #player{hand = R, team = State#player.team}}
    end;
handle_call(terminate, _From, State) ->
    {stop, normal, ok, State}.



