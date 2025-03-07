program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  pessoa1,pessoa2, pessoa3: string;
  idade1, idade2, idade3, soma: Integer;

begin
  try
    Write('Qual o seu nome: ');
    ReadLn(pessoa1);
        Write('Qual a sua idade: ');
    ReadLn(idade1);
        Write('Qual o seu nome: ');
    ReadLn(pessoa2);
        Write('Qual a sua idade: ');
    ReadLn(idade2);
        Write('Qual o seu nome: ');
    ReadLn(pessoa3);
        Write('Qual a sua idade: ');
    ReadLn(idade3);

    soma:= (idade1 + idade2 + idade3);

    WriteLn(Format('%s tem %d anos.', [pessoa1,idade1]));
    WriteLn(Format('%s tem %d anos.', [pessoa2,idade2]));
    WriteLn(Format('%s tem %d anos.', [pessoa3,idade3]));

    WriteLn(Format('%s, %s e %s tem juntos %d anos.', [pessoa1,pessoa2,pessoa3, soma]));

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
