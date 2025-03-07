program Aula2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
const
  //MinhaContante = 'Texto Fixo' ;
var
  MeuNumero, MeuNumero2: Integer;
  MeuTextto: string;

  procedure ImprimirTexto
begin
  try
    Writeln('Meu Texto');
  except
  end;
end;

begin
  try
    //MeuNumero := 1;
    //Readln(MeuTextto);
    Writeln('Meu texto é:' + MeuTextto);

    Readln;
  except
      Writeln('Ocorreu um erro! Desculpe');
      Readln;
  end;
end.
