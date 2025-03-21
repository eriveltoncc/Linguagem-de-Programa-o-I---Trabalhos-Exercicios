program ExerImagem1dproj;

uses
  Vcl.Forms,
  ExercicioImagem1 in 'ExercicioImagem1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
