program Exercicio1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var
    valor1,valor2,valor3, media: Real;

begin
  try
    Write('Digite o segundo valor: ');
    ReadLn(valor1);

    Write('Digite o segundo valor: ');
    ReadLn(valor2);

    Write('Digite o terceiro valor: ');
    ReadLn(valor3);

    media := (valor1 + valor2 + valor3) / 3;

    WriteLn(Format('A média é: %.4f', [media]));

    Readln;
  except
    on E: Exception do
      Writeln('Erro: ', E.ClassName, ' - ', E.Message);
  end;
end.
