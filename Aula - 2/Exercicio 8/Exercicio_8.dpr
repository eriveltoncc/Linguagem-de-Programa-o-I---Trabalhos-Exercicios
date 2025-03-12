program Exercicio_8;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  X, i, valor, maior, menor: Integer;

begin
  try
    Write('Informe a quantidade de valores (X): ');
    ReadLn(X);

    if X <= 0 then
    begin
      WriteLn('A quantidade de valores deve ser maior que zero.');
      Exit;
    end;

    Write('Informe o valor 1: ');
    ReadLn(valor);
    maior := valor;
    menor := valor;

    for i := 2 to X do
    begin
      Write('Informe o valor ', i, ': ');
      ReadLn(valor);

      if valor > maior then
        maior := valor;

      if valor < menor then
        menor := valor;
    end;

    WriteLn('O maior valor é: ', maior);
    WriteLn('O menor valor é: ', menor);

    ReadLn;

  except
    on E: Exception do
      WriteLn('Erro: ', E.Message);
  end;
end.

