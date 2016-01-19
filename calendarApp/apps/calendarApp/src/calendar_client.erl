-module(calendar_client).


-export([insert/4, read_all/0, read_on_date/1,todays_events/0, bdays/1, edit/4, delete/1]).


insert(Event,Date,Loc,Desc) ->
        gen_server:call({global, ?MODULE}, {insert,Event,Date,Loc,Desc}).

read_all() ->
        gen_server:call({global, ?MODULE}, {retrieve_all}).

read_on_date(Date) ->
        gen_server:call({global, ?MODULE}, {retrieve_per_date, Date}).

todays_events() ->
        gen_server:call({global, ?MODULE}, {todays_events}).

bdays(Event) ->
        gen_server:call({global, ?MODULE}, {bdays, Event}).
edit(Date, Event, Desc, Loc) ->
        gen_server:call({global, ?MODULE}, {edit,Date,Event,Desc,Loc}).

delete(Date) ->
        gen_server:call({global, ?MODULE}, {delete, Date}).


