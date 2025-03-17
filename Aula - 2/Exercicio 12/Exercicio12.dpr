program Exercicio12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  Precos: array[1..6] of Real = (4.00, 2.50, 2.00, 5.00, 3.50, 4.50);
  Itens: array[1..6] of string = ('Refrigerante', 'Água', 'Café',
  'Sanduíche', 'Pão de queijo', 'Pastel');

var
  CodigoItem, Quantidade, i: Integer;
  TotalCompra: Real;

begin
  try
    TotalCompra := 0;
    Writeln('Tabela de Preços:');
    for i := 1 to 6 do
    begin
      Writeln(i, ' - ', Itens[i], ': R$ ', FormatFloat('0.00', Precos[i]));
    end;
    Writeln;

    Write('Quantos itens deseja comprar? ');
    ReadLn(Quantidade);
    for i := 1 to Quantidade do
    begin
      Write('Informe o código do item ', i, ' (1 a 6): ');
      ReadLn(CodigoItem);

      if (CodigoItem < 1) or (CodigoItem > 6) then
      begin
        Writeln('Código de item inválido!');
        Continue;
      end;

      Write('Informe a quantidade de ', Itens[CodigoItem], ': ');
      ReadLn(Quantidade);
      TotalCompra := TotalCompra + (Precos[CodigoItem] * Quantidade);
    end;
    Writeln;
    Writeln('Total da compra: R$ ', FormatFloat('0.00', TotalCompra));

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

