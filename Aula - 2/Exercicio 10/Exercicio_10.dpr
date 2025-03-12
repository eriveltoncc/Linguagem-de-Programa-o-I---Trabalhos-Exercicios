program Exercicio_10;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  a, b: Real;
  opcao: Integer;

begin
  try
    Write('Informe o valor de A: ');
    ReadLn(a);

    Write('Informe o valor de B: ');
    ReadLn(b);

    WriteLn('Escolha uma op��o:');
    WriteLn('1 - Subtrair o valor B de A.');
    WriteLn('2 - Somar A e B');
    WriteLn('3 - Multiplicar A e B');
    WriteLn('4 - Mostrar qual o maior n�mero');

    Write('Digite a op��o desejada (1-4): ');
    ReadLn(opcao);

    case opcao of
      1:
        WriteLn('Resultado de A - B: ', a - b:0:2);
      2:
        WriteLn('Resultado de A + B: ', a + b:0:2);
      3:
        WriteLn('Resultado de A * B: ', a * b:0:2);
      4:
        if a > b then
          WriteLn('O maior n�mero � A: ', a:0:2)
        else if b > a then
          WriteLn('O maior n�mero � B: ', b:0:2)
        else
          WriteLn('A e B s�o iguais.');
    else
      WriteLn('Op��o inv�lida!');
    end;

    ReadLn; // Para manter o console aberto

  except
    on E: Exception do
      WriteLn('Erro: ', E.Message);
  end;
end.

