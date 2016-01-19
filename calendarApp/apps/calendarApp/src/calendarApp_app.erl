-module(calendarApp_app).

-behaviour(application).

%% Application callbacks
-export([start/2,stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================
%start() ->
%    application:start(?MODULE).

start(_StartType, _StartArgs) ->
    calendarApp_sup:start_link().

%stop() ->
%    application:stop(?MODULE).

stop(_State) ->
    ok.
