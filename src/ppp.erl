%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ping Pong Pi
%% Table Tennis tracking software
%%
%% Mark Dennehy
%% mark.dennehy@gmail.com
%% mark.dennehy@workday.com
%%

-module(ppp).
-compile(debug_info).
-export([start/0,stop/0,main/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main startup function
%%	start()

start() ->
	io:format("Starting up ~n",[]),
  {ok, ADC1} = i2c:start_link("i2c-1", 16#4d),
  main(ADC1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Main function
%%	main()

main(ADC1) ->
  Data = i2c:read(ADC1,2),
  lists:foreach(fun(T) -> io:format("~.16w~n",[T]) end, Data),
  main(ADC1).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Safely stops
%%	stop()

stop()->
	io:format("Shutting down ~n",[]),
  exit(normal).

