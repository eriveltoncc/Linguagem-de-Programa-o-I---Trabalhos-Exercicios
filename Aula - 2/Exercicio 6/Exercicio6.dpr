program Exercicio6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  X, Y : REAL;
  Soma: array[1..4] of Real;

begin
  try
  Write('Qual o valor de X: ');
  ReadLn(X);
  Write('Qual o valor de Y: ');
  ReadLn(Y);

  Soma[1]:= X + Y;
  WriteLn('O valor de X + Y é: ', Soma[1]:0:2);
  Soma[1]:= X - Y;
  WriteLn('O valor de X - Y é: ', Soma[1]:0:2);
  Soma[1]:= X * Y;
  WriteLn('O valor de X * Y é: ', Soma[1]:0:2);
  Soma[1]:= X / Y;
  WriteLn('O valor de X / Y é: ', Soma[1]:0:2);



  Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
