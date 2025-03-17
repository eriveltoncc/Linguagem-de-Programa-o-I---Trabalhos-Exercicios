program Exercicio13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  N, i: Integer;
  Custo, Venda, TotalCusto, TotalVenda: Real;
  MediaCusto, MediaVenda, Lucro: Real;

begin
  try
    Write('Informe a quantidade de produtos produzidos: ');
    ReadLn(N);

    TotalCusto := 0;
    TotalVenda := 0;


    for i := 1 to N do
    begin
      Write('Informe o pre�o de custo do produto ', i, ': R$ ');
      ReadLn(Custo);
      Write('Informe o pre�o de venda do produto ', i, ': R$ ');
      ReadLn(Venda);


      TotalCusto := TotalCusto + Custo;
      TotalVenda := TotalVenda + Venda;
    end;


    MediaCusto := TotalCusto / N;
    MediaVenda := TotalVenda / N;


    Lucro := TotalVenda - TotalCusto;

    Writeln;
    Writeln('M�dia do pre�o de custo: R$ ', FormatFloat('0.00', MediaCusto));
    Writeln('M�dia do pre�o de venda: R$ ', FormatFloat('0.00', MediaVenda));

    if Lucro > 0 then
      Writeln('A ind�stria obteve lucro de R$ ', FormatFloat('0.00', Lucro))
    else if Lucro < 0 then
      Writeln('A ind�stria obteve preju�zo de R$ ', FormatFloat('0.00', -Lucro))
    else
      Writeln('A ind�stria n�o obteve lucro nem preju�zo (resultado zero).');

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

