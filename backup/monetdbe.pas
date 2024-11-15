unit monetdbe;
{ This unit is automatically generated by Chet:
  https://github.com/neslib/Chet }

{$MINENUMSIZE 4}

interface

const
  {$IF Defined(WIN32)}
  libmonetdbe = 'monetdbe.dll';
  _PU = '';
  {$ELSEIF Defined(WIN64)}
  libmonetdbe = 'monetdbe.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

//const
  { TODO : Macro probably uses invalid symbol "monetdbe_export": }
  (* monetdbe_export extern *)
  { TODO : Unable to convert function-like macro: }
  (* DEFAULT_STRUCT_DEFINITION ( ctype , typename ) typedef struct { monetdbe_types type ; monetdbe_sql_type sql_type ; ctype * data ; size_t count ; char * name ; ctype null_value ; double scale ; int ( * is_null ) ( ctype * value ) ; } monetdbe_column_ ## typename *)

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PInt8 = ^Int8;
  PInt64 = ^Int64;
  PInt16 = ^Int16;
  PInt32 = ^Int32;
  PNativeUInt = ^NativeUInt;
  Pmonetdbe_data_date = ^monetdbe_data_date;
  Pmonetdbe_data_time = ^monetdbe_data_time;
  Pmonetdbe_data_timestamp = ^monetdbe_data_timestamp;
  Pmonetdbe_data_blob = ^monetdbe_data_blob;
  Pmonetdbe_sql_type = ^monetdbe_sql_type;
  Pmonetdbe_column = ^monetdbe_column;
  PPmonetdbe_column = ^Pmonetdbe_column;
  Pmonetdbe_statement = ^monetdbe_statement;
  PPmonetdbe_statement = ^Pmonetdbe_statement;
  Pmonetdbe_result = ^monetdbe_result;
  PPmonetdbe_result = ^Pmonetdbe_result;
  Pmonetdbe_remote = ^monetdbe_remote;
  Pmonetdbe_mapi_server = ^monetdbe_mapi_server;
  Pmonetdbe_options = ^monetdbe_options;
  Pmonetdbe_column_bool = ^monetdbe_column_bool;
  Pmonetdbe_column_int8_t = ^monetdbe_column_int8_t;
  Pmonetdbe_column_int16_t = ^monetdbe_column_int16_t;
  Pmonetdbe_column_int32_t = ^monetdbe_column_int32_t;
  Pmonetdbe_column_int64_t = ^monetdbe_column_int64_t;
  Pmonetdbe_column_size_t = ^monetdbe_column_size_t;
  Pmonetdbe_column_float = ^monetdbe_column_float;
  Pmonetdbe_column_double = ^monetdbe_column_double;
  Pmonetdbe_column_str = ^monetdbe_column_str;
  Pmonetdbe_column_blob = ^monetdbe_column_blob;
  Pmonetdbe_column_date = ^monetdbe_column_date;
  Pmonetdbe_column_time = ^monetdbe_column_time;
  Pmonetdbe_column_timestamp = ^monetdbe_column_timestamp;
  Pmonetdbe_MapiStruct = ^monetdbe_MapiStruct;
  Pmonetdbe_MapiStatement = ^monetdbe_MapiStatement;

  monetdbe_cnt = Int64;
  Pmonetdbe_cnt = ^monetdbe_cnt;

  monetdbe_data_date = record
    day: Byte;
    month: Byte;
    year: Smallint;
  end;

  monetdbe_data_time = record
    ms: Cardinal;
    seconds: Byte;
    minutes: Byte;
    hours: Byte;
  end;

  monetdbe_data_timestamp = record
    date: monetdbe_data_date;
    time: monetdbe_data_time;
  end;

  monetdbe_data_blob = record
    size: NativeUInt;
    data: PUTF8Char;
  end;

  monetdbe_types = (
    monetdbe_bool = 0,
    monetdbe_int8_t = 1,
    monetdbe_int16_t = 2,
    monetdbe_int32_t = 3,
    monetdbe_int64_t = 4,
    monetdbe_size_t = 5,
    monetdbe_float = 6,
    monetdbe_double = 7,
    monetdbe_str = 8,
    monetdbe_blob = 9,
    monetdbe_date = 10,
    monetdbe_time = 11,
    monetdbe_timestamp = 12,
    monetdbe_type_unknown = 13);
  Pmonetdbe_types = ^monetdbe_types;

  monetdbe_sql_type = record
    name: PUTF8Char;
    scale: Cardinal;
    digits: Cardinal;
  end;

  monetdbe_column = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: Pointer;
    count: NativeUInt;
    name: PUTF8Char;
  end;

  monetdbe_statement = record
    nparam: NativeUInt;
    &type: Pmonetdbe_types;
  end;

  monetdbe_result = record
    nrows: monetdbe_cnt;
    ncols: NativeUInt;
    name: PUTF8Char;
    last_id: monetdbe_cnt;
  end;

  monetdbe_database = Pointer;
  Pmonetdbe_database = ^monetdbe_database;

  monetdbe_remote = record
    host: PUTF8Char;
    port: Integer;
    database: PUTF8Char;
    username: PUTF8Char;
    password: PUTF8Char;
    lang: PUTF8Char;
  end;

  monetdbe_mapi_server = record
    host: PUTF8Char;
    port: PUTF8Char;
    usock: PUTF8Char;
  end;

  monetdbe_options = record
    memorylimit: Integer;
    querytimeout: Integer;
    sessiontimeout: Integer;
    nr_threads: Integer;
    remote: Pmonetdbe_remote;
    mapi_server: Pmonetdbe_mapi_server;
    trace_file: PUTF8Char;
  end;

  monetdbe_column_bool = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PInt8;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Int8;
    scale: Double;
    is_null: function(value: PInt8): Integer; cdecl;
  end;

  monetdbe_column_int8_t = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PInt8;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Int8;
    scale: Double;
    is_null: function(value: PInt8): Integer; cdecl;
  end;

  monetdbe_column_int16_t = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PInt16;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Int16;
    scale: Double;
    is_null: function(value: PInt16): Integer; cdecl;
  end;

  monetdbe_column_int32_t = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PInt32;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Int32;
    scale: Double;
    is_null: function(value: PInt32): Integer; cdecl;
  end;

  monetdbe_column_int64_t = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PInt64;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Int64;
    scale: Double;
    is_null: function(value: PInt64): Integer; cdecl;
  end;

  monetdbe_column_size_t = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PNativeUInt;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: NativeUInt;
    scale: Double;
    is_null: function(value: PNativeUInt): Integer; cdecl;
  end;

  monetdbe_column_float = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PSingle;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Single;
    scale: Double;
    is_null: function(value: PSingle): Integer; cdecl;
  end;

  monetdbe_column_double = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PDouble;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: Double;
    scale: Double;
    is_null: function(value: PDouble): Integer; cdecl;
  end;

  monetdbe_column_str = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: PPUTF8Char;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: PUTF8Char;
    scale: Double;
    is_null: function(value: PPUTF8Char): Integer; cdecl;
  end;

  monetdbe_column_blob = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: Pmonetdbe_data_blob;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: monetdbe_data_blob;
    scale: Double;
    is_null: function(value: Pmonetdbe_data_blob): Integer; cdecl;
  end;

  monetdbe_column_date = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: Pmonetdbe_data_date;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: monetdbe_data_date;
    scale: Double;
    is_null: function(value: Pmonetdbe_data_date): Integer; cdecl;
  end;

  monetdbe_column_time = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: Pmonetdbe_data_time;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: monetdbe_data_time;
    scale: Double;
    is_null: function(value: Pmonetdbe_data_time): Integer; cdecl;
  end;

  monetdbe_column_timestamp = record
    &type: monetdbe_types;
    sql_type: monetdbe_sql_type;
    data: Pmonetdbe_data_timestamp;
    count: NativeUInt;
    name: PUTF8Char;
    null_value: monetdbe_data_timestamp;
    scale: Double;
    is_null: function(value: Pmonetdbe_data_timestamp): Integer; cdecl;
  end;

  monetdbe_MapiStruct = record
    mdbe: monetdbe_database;
    msg: PUTF8Char;
  end;

  monetdbe_Mapi = Pmonetdbe_MapiStruct;

  monetdbe_MapiStatement = record
    mid: monetdbe_Mapi;
    query: PUTF8Char;
    result: Pmonetdbe_result;
    mapi_row: PPUTF8Char;
    current_row: monetdbe_cnt;
    affected_rows: monetdbe_cnt;
    msg: PUTF8Char;
  end;

  monetdbe_MapiHdl = Pmonetdbe_MapiStatement;
  monetdbe_MapiMsg = Integer;

function monetdbe_version(): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_version';

function monetdbe_open(db: Pmonetdbe_database; url: PUTF8Char; opts: Pmonetdbe_options): Integer; cdecl;
  external libmonetdbe name _PU + 'monetdbe_open';

function monetdbe_close(db: monetdbe_database): Integer; cdecl;
  external libmonetdbe name _PU + 'monetdbe_close';

function monetdbe_error(db: monetdbe_database): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_error';

function monetdbe_get_autocommit(dbhdl: monetdbe_database; result: PInteger): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_get_autocommit';

function monetdbe_set_autocommit(dbhdl: monetdbe_database; value: Integer): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_set_autocommit';

function monetdbe_in_transaction(dbhdl: monetdbe_database): Integer; cdecl;
  external libmonetdbe name _PU + 'monetdbe_in_transaction';

function monetdbe_query(dbhdl: monetdbe_database; query: PUTF8Char; result: PPmonetdbe_result; affected_rows: Pmonetdbe_cnt): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_query';

function monetdbe_result_fetch(mres: Pmonetdbe_result; res: PPmonetdbe_column; column_index: NativeUInt): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_result_fetch';

function monetdbe_cleanup_result(dbhdl: monetdbe_database; result: Pmonetdbe_result): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_cleanup_result';

function monetdbe_prepare(dbhdl: monetdbe_database; query: PUTF8Char; stmt: PPmonetdbe_statement; result: PPmonetdbe_result): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_prepare';

function monetdbe_bind(stmt: Pmonetdbe_statement; data: Pointer; parameter_nr: NativeUInt): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_bind';

function monetdbe_execute(stmt: Pmonetdbe_statement; result: PPmonetdbe_result; affected_rows: Pmonetdbe_cnt): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_execute';

function monetdbe_cleanup_statement(dbhdl: monetdbe_database; stmt: Pmonetdbe_statement): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_cleanup_statement';

function monetdbe_append(dbhdl: monetdbe_database; const schema: PUTF8Char; const table: PUTF8Char; input: PPmonetdbe_column; column_count: NativeUInt): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_append';

function monetdbe_null(dbhdl: monetdbe_database; t: monetdbe_types): Pointer; cdecl;
  external libmonetdbe name _PU + 'monetdbe_null';

function monetdbe_get_columns(dbhdl: monetdbe_database; const schema_name: PUTF8Char; const table_name: PUTF8Char; column_count: PNativeUInt; columns: PPmonetdbe_column): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_get_columns';

function monetdbe_dump_database(dbhdl: monetdbe_database; const backupfile: PUTF8Char): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_dump_database';

function monetdbe_dump_table(dbhdl: monetdbe_database; const schema_name: PUTF8Char; const table_name: PUTF8Char; const backupfile: PUTF8Char): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_dump_table';

function monetdbe_get_mapi_port(): PUTF8Char; cdecl;
  external libmonetdbe name _PU + 'monetdbe_get_mapi_port';
//
//function monetdbe_mapi_dump_database(dbhdl: monetdbe_database; const filename: PUTF8Char): PUTF8Char; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_dump_database';
//
//function monetdbe_mapi_dump_table(dbhdl: monetdbe_database; const sname: PUTF8Char; const tname: PUTF8Char; const filename: PUTF8Char): PUTF8Char; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_dump_table';
//
//function monetdbe_mapi_error(mid: monetdbe_Mapi): monetdbe_MapiMsg; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_error';
//
//function monetdbe_mapi_query(mid: monetdbe_Mapi; const query: PUTF8Char): monetdbe_MapiHdl; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_query';
//
//function monetdbe_mapi_close_handle(hdl: monetdbe_MapiHdl): monetdbe_MapiMsg; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_close_handle';
//
//function monetdbe_mapi_fetch_row(hdl: monetdbe_MapiHdl): Integer; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_fetch_row';
//
//function monetdbe_mapi_fetch_field(hdl: monetdbe_MapiHdl; fnr: Integer): PUTF8Char; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_fetch_field';
//
//function monetdbe_mapi_get_type(hdl: monetdbe_MapiHdl; fnr: Integer): PUTF8Char; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_get_type';
//
//function monetdbe_mapi_seek_row(hdl: monetdbe_MapiHdl; rowne: Int64; whence: Integer): monetdbe_MapiMsg; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_seek_row';
//
//function monetdbe_mapi_get_row_count(hdl: monetdbe_MapiHdl): Int64; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_get_row_count';
//
//function monetdbe_mapi_rows_affected(hdl: monetdbe_MapiHdl): Int64; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_rows_affected';
//
//function monetdbe_mapi_get_field_count(hdl: monetdbe_MapiHdl): Integer; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_get_field_count';
//
//function monetdbe_mapi_result_error(hdl: monetdbe_MapiHdl): PUTF8Char; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_result_error';
//
//function monetdbe_mapi_get_len(hdl: monetdbe_MapiHdl; fnr: Integer): Integer; cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_get_len';
//
//procedure monetdbe_mapi_explain(mid: monetdbe_Mapi; fd: PInteger); cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_explain';
//
//procedure monetdbe_mapi_explain_query(hdl: monetdbe_MapiHdl; fd: PInteger); cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_explain_query';
//
//procedure monetdbe_mapi_explain_result(hdl: monetdbe_MapiHdl; fd: PInteger); cdecl;
//  external libmonetdbe name _PU + 'monetdbe_mapi_explain_result';

implementation

end.