%%%-------------------------------------------------------------------
%%% @author Juan Jose Comellas <juanjo@comellas.org>
%%% @author Mahesh Paolini-Subramanya <mahesh@dieswaytoofast.com>
%%% @author Tom Heinan <me@tomheinan.com>
%%% @copyright (C) 2012 Juan Jose Comellas, Mahesh Paolini-Subramanya, Tom Heinan
%%% @doc Common types, records, and defines
%%% @end
%%%-------------------------------------------------------------------

-type error()           :: {error, Reason :: term()}.

%% Tuple containing a date and time.
-type hour()     :: 0..23.
-type minute()   :: 0..59.
-type second()   :: 0..59.
-type datetime()                                :: {calendar:date(), {hour(), minute(), second() | float()}}.

%% A floating point number representing the number of seconds elapsed since
%% Jan 1, 1970, 00:00:00 (Unix epoch).
-type epoch()                                   :: non_neg_integer() | float().
-type audio_path()                              :: file:filename().


%%  ERRORS
-define(INVALID_FLOAT, <<"invalid_float">>).
-define(INVALID_INTEGER, <<"invalid_integer">>).
-define(INVALID_NON_NEG_INTEGER, <<"invalid_non_neg_integer">>).
-define(INVALID_FLOAT_LIST, <<"invalid_float_list">>).
-define(INVALID_INTEGER_LIST, <<"invalid_integer_list">>).
-define(INVALID_ATOM_LIST, <<"invalid_atom_list">>).
-define(INVALID_NON_NEG_INTEGER_LIST, <<"invalid_non_neg_integer_list">>).
-define(INVALID_BOOLEAN, <<"invalid_boolean">>).
-define(INVALID_BOOLEAN_LIST, <<"invalid_boolean_list">>).
-define(INVALID_BINARY, <<"invalid_binary">>).
-define(INVALID_BINARY_LIST, <<"invalid_binary_list">>).
-define(INVALID_STRING, <<"invalid_string">>).
-define(INVALID_NULL, <<"invalid_null">>).
-define(INVALID_ATOM, <<"invalid_atom">>).
-define(INVALID_EMAIL_ADDRESS, <<"invalid_email_address">>).
-define(INVALID_URL, <<"invalid_url">>).
-define(INVALID_TCP_PORT, <<"invalid_tcp_port">>).
-define(INVALID_UTF8, <<"invalid_utf8">>).
-define(INVALID_LIST, <<"invalid_list">>).
-define(INVALID_AREA_CODE, <<"invalid_area_code">>).
-define(EMPTY_ERROR, <<"empty_error">>).

%%  DEFINES
-define(SECONDS_TO_UNIX_EPOCH, 62167219200).
