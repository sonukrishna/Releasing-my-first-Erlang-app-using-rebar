 
-module(calendarApp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0, start_link_shell/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
%%-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================
start_link_shell() ->
    {ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
    unlink(Pid).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    io:format("~p (~p) starting....~n", [{global, ?MODULE}, self()]),

%    Restart_strt = one_for_one,
%    Max_restart = 3,
%    Max_time = 5,

%    Flags = {Restart_strt, Max_restart, Max_time},
%   Restart = permanent,
%    Shutdown = 5000,
%    Type = worker,
%%
%    Child_spec = {calendarApp_server, {calendarApp_server, start_link, []}, Restart, Shutdown, Type, [calendarApp_server]},

%    {ok,{Flags,[Child_spec]}}.
   

 {ok, { {one_for_one, 5, 10}, 
	[{calendarApp_server,
		{calendarApp_server, start_link, []}, 
			permanent,5000, worker, [calendarApp_server]}]} }.

%% {ok, { {one_for_one, 5, 10}, []} }.

