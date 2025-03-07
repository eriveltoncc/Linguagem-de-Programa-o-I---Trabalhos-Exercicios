program Exercicio5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  altura, pesoIdeal: Real;
  sexo: Char;

begin
  try

    Write('Digite sua altura (em metros): ');
    ReadLn(altura);


    Write('Digite seu sexo (M para Masculino, F para Feminino): ');
    ReadLn(sexo);


    sexo := UpCase(sexo);


    if sexo = 'M' then
      pesoIdeal := (72.7 * altura) - 58
    else if sexo = 'F' then
      pesoIdeal := (62.1 * altura) - 44.7
    else
    begin
      WriteLn('Sexo inválido! Use M para Masculino ou F para Feminino.');
      Exit;
    end;


    WriteLn(Format('Seu peso ideal é: %.2f kg', [pesoIdeal]));

  except
    on E: Exception do
      WriteLn('Erro: ', E.ClassName, ' - ', E.Message);
  end;

  ReadLn;
end.
