program Exercicio4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var idade: Integer;

begin
  try
    Write('Qual a idade do jogador: ');
    ReadLn(idade);

    case idade of
    5 .. 7:
      Writeln('Infantil A');
    8 .. 10:
      Writeln('Infantil B');
    11 .. 13:
      Writeln('Juvenil A');
    14 .. 17:
      Writeln('Juvenil B');
    else
      Writeln('Adulto');
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
