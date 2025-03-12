program Exercicio7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
var
  A,B,C: Integer;
  Formula: array[1..11] of Real;
begin
  try
  Write('Qual o valor de A: ');
  ReadLn(A);

  Write('Qual o valor de B: ');
  ReadLn(B);

  Write('Qual o valor de C: ');
  ReadLn(C);

  Formula[1] := A + B + C;
  WriteLn('Resultado de A + B + C é: ', Formula[1]:0:2);

  Formula[2] :=  A - B + C;
  WriteLn('Resultado de A - B + C é: ', Formula[2]:0:2);

  Formula[3] := A - (B + C);
  WriteLn('Resultado de A - (B + C) é: ', Formula[3]:0:2);

  Formula[4] := (A * 2) + (B - C);
  WriteLn('Resultado de (A * 2) + (B - C) é: ', Formula[4]:0:2);

  Formula[5] := (A * 4) + (C /2) - (B + 8);
  WriteLn('Resultado de (A * 4) + (C /2) - (B + 8) é: ', Formula[5]:0:2);

  Formula[6] := (A / 2) + (B / 2) + (C / 2);
  WriteLn('Resultado de A + B + C é: ', Formula[6]:0:2);

  Formula[7] := A * A + B * B;
  WriteLn('Resultado de A * A + B * B é: ', Formula[7]:0:2);

  Formula[8] := C * C + 3 * B;
  WriteLn('Resultado de C * C + 3 * B é: ', Formula[8]:0:2);

  Formula[9] := A mod 2;
  WriteLn('Resultado de A mod 2 é: ', Formula[9]:0:2);

  Formula[10] := B mod 2;
  WriteLn('Resultado de B mod 2 é: ', Formula[10]:0:2);

  Formula[11] := C mod 2;
  WriteLn('Resultado de C mod 2 é: ', Formula[11]:0:2);



  ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
