%%%-------------------------------------------------------------------
%%% @author Mahesh Paolini-Subramanya <mahesh@dieswaytoofast.com>
%%% @copyright (C) 2012 Juan Jose Comellas, Mahesh Paolini-Subramanya
%%% @doc Module providing general utility functions
%%% @end
%%%-------------------------------------------------------------------
-module(d_uri).
-author('Mahesh Paolini-Subramanya <mahesh@dieswaytoofast.com>').

-define(SERVER, ?MODULE).

-include("d_util.hrl").

-export([params_encode/1]).
-export([uri_params_encode/1]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------


% Thanks to https://github.com/tim/erlang-oauth.git
-spec params_encode([tuple()]) -> string().
params_encode(Params) ->
  % cf. http://tools.ietf.org/html/rfc5849#section-3.4.1.3.2
  Encoded = [{uri_encode(K), uri_encode(V)} || {K, V} <- Params],
  Sorted = lists:sort(Encoded),
  Concatenated = [lists:concat([K, "=", V]) || {K, V} <- Sorted],
  string:join(Concatenated, "&").

-spec uri_params_encode([tuple()]) -> string().
uri_params_encode(Params) ->
  intercalate("&", [uri_join([K, V], "=") || {K, V} <- Params]).

uri_join(Values, Separator) ->
  string:join([uri_encode(Value) || Value <- Values], Separator).

intercalate(Sep, Xs) ->
  lists:concat(intersperse(Sep, Xs)).

intersperse(_, []) ->
  [];
intersperse(_, [X]) ->
  [X];
intersperse(Sep, [X | Xs]) ->
  [X, Sep | intersperse(Sep, Xs)].

uri_encode(Term) when is_integer(Term) ->
  integer_to_list(Term);
uri_encode(Term) when is_atom(Term) ->
  uri_encode(atom_to_list(Term));
uri_encode(Term) when is_list(Term) ->
  uri_encode(lists:reverse(Term, []), []).

-define(is_alphanum(C), C >= $A, C =< $Z; C >= $a, C =< $z; C >= $0, C =< $9).

uri_encode([X | T], Acc) when ?is_alphanum(X); X =:= $-; X =:= $_; X =:= $.; X =:= $~ ->
  uri_encode(T, [X | Acc]);
uri_encode([X | T], Acc) ->
  NewAcc = [$%, dec2hex(X bsr 4), dec2hex(X band 16#0f) | Acc],
  uri_encode(T, NewAcc);
uri_encode([], Acc) ->
  Acc.

-compile({inline, [{dec2hex, 1}]}).

dec2hex(N) when N >= 10 andalso N =< 15 ->
  N + $A - 10;
dec2hex(N) when N >= 0 andalso N =< 9 ->
  N + $0.
