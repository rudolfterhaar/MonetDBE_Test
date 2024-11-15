unit main;

{$mode Delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, monetdbe;

type

  { TForm1 }

  TForm1 = class(TForm)
    TestBtn: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure TestBtnClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TestBtnClick(Sender: TObject);
var
  mdbe          : monetdbe.Pmonetdbe_database;
  mdbeResultPtr : Pmonetdbe_result;
  mdbeResult    : monetdbe_result;

  s:string;

  r,c:integer;
  err:putf8char;
  errstring:string;
  rowline:string; rowcomma:string;
     c32     : pmonetdbe_column_int32_t;
     cstr    : pmonetdbe_column_str;
     cdouble : pmonetdbe_column_double;
  columns: array of pmonetdbe_column;

begin
  memo1.Lines.Clear;
  memo1.Lines.Add(  monetdbe.monetdbe_version );
  if monetdbe_open(@mdbe,0,0 )<>0
    then
      memo1.Lines.Add('Failed to open database')
    else
      begin
        s:=monetdbe_query(mdbe, 'INSERT INTO test VALUES (42, ''Hello''), (NULL, ''World'')',0,0);
        memo1.Lines.Add(' query result-> ' +s);

        s:=monetdbe_query(mdbe, 'SELECT x, y, z FROM test;',@mdbeResultPtr,0);
        memo1.Lines.Add(' query result-> ' +s);

        mdbeResult:=mdbeResultPtr^;
        setlength(columns, mdbeResult.ncols);

        for r := 0 to mdbeResult.nrows-1 do
          begin
            rowline  := '';   //clear the row.
            rowcomma := '';   //clear commavalue
            for c := 0 to mdbeResult.ncols-1 do
              begin
                 err :=    monetdbe_result_fetch( mdberesultptr , @columns[c] , r+1 );       //     mdbeResultPtr
                 errstring:=utf8tostring(err);
                 if errstring<>''
                   then memo1.Lines.Add('Error'+errstring);
                 case columns[c].&type of
                   monetdbe_int32_t:
                     begin
                        c32 := pmonetdbe_column_int32_t( columns[c] );
                        if c32^.data^=c32^.null_value
                          then rowline:=rowline+rowcomma+'NULL'
                          else rowline:=rowline+rowcomma+c32^.data^.ToString;
                     end;
                   monetdbe_str:
                     begin
                        cstr := pmonetdbe_column_str(columns[c] );
                        if cstr^.data^=cstr^.null_value
                          then rowline:=rowline+rowcomma+'NULL'
                          else rowline:=rowline+rowcomma+utf8tostring( cstr^.data^^);
                     end;
                 end;
                rowcomma:=',';
              end;
              memo1.Lines.Add(rowline);
           end;
        monetdbe.monetdbe_cleanup_result(mdbe, mdbeResultPtr);
        monetdbe.monetdbe_close(mdbe);
      end;
end;

{Original C Code

// #define error(msg) {fprintf(stderr, "Failure: %s\n", msg); return -1;}


// main(void)
//  {
//	char* err = NULL;
//	monetdbe_database mdbe = NULL;
//	monetdbe_result* result = NULL;
//
//	// second argument is a string for the db directory or NULL for in-memory mode
//	if (monetdbe_open(&mdbe, NULL, NULL))
//		error("Failed to open database")
//	if ((err = monetdbe_query(mdbe, "CREATE TABLE test (x integer, y string)", NULL, NULL)) != NULL)
//		error(err)
//	if ((err = monetdbe_query(mdbe, "INSERT INTO test VALUES (42, 'Hello'), (NULL, 'World')", NULL, NULL)) != NULL)
//		error(err)
//	if ((err = monetdbe_query(mdbe, "SELECT x, y FROM test; ", &result, NULL)) != NULL)
//		error(err)
//
//	fprintf(stdout, "Query result with %zu cols and %"PRId64" rows\n", result->ncols, result->nrows);
//	for (int64_t r = 0; r < result->nrows; r++) {
//		for (size_t c = 0; c < result->ncols; c++) {
//			monetdbe_column* rcol;
//			if ((err = monetdbe_result_fetch(result, &rcol, c)) != NULL)
//				error(err)
//			switch (rcol->type) {
//				case monetdbe_int32_t: {
//					monetdbe_column_int32_t * col = (monetdbe_column_int32_t *) rcol;
//					if (col->data[r] == col->null_value) {
//						printf("NULL");
//					} else {
//						printf("%d", col->data[r]);
//					}
//					break;
//				}
//				case monetdbe_str: {
//					monetdbe_column_str * col = (monetdbe_column_str *) rcol;
//					if (col->is_null(col->data+r)) {
//						printf("NULL");
//					} else {
//						printf("%s", (char*) col->data[r]);
//					}
//					break;
//				}
//				default: {
//					printf("UNKNOWN");
//				}
//			}
//
//			if (c + 1 < result->ncols) {
//				printf(", ");
//			}
//		}
//		printf("\n");
//	}
//
//	if ((err = monetdbe_cleanup_result(mdbe, result)) != NULL)
//		error(err)
//	if (monetdbe_close(mdbe))
//		error("Failed to close database")
//	return 0;
//}
//}










end.

