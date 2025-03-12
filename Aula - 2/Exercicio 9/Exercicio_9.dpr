program Exercicio_9;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  idade, maior, menor, soma, contador: Integer;
  media: Real;

begin
  try
    soma := 0;
    contador := 0;
    maior := -1;
    menor := 9999; // Um valor alto para garantir a atualização correta

    WriteLn('Digite a idade dos alunos (0 para finalizar):');

    repeat
      Write('Informe a idade: ');
      ReadLn(idade);

      if idade = 0 then
        Break; // Sai do loop se o usuário digitar 0

      if idade < 0 then
      begin
        WriteLn('Idade inválida! Digite um número positivo.');
        Continue; // Pula para a próxima iteração
      end;

      if idade > maior then
        maior := idade;

      if idade < menor then
        menor := idade;

      soma := soma + idade;
      contador := contador + 1;

    until False; // Loop infinito até que `Break` seja acionado

    if contador = 0 then
      WriteLn('Nenhuma idade foi informada.')
    else
    begin
      media := soma / contador;
      WriteLn('A menor idade é: ', menor);
      WriteLn('A maior idade é: ', maior);
      WriteLn('A média das idades é: ', media:0:2);
    end;

    ReadLn; // Para manter o console aberto

  except
    on E: Exception do
      WriteLn('Erro: ', E.Message);
  end;
end.

