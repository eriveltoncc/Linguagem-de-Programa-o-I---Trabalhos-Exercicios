unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm_Principal = class(TForm)
    Botäo: TButton;
    Meu_texto: TEdit;
    procedure Meu_textoClick(Sender: TObject);
  private
    function ConvertexTextoParaMaiusculo(ATexto:string): string;
  public
    { Public declarations }
  end;

var
  Form_Principal: TForm_Principal;

implementation

{$R *.dfm}

function TForm_Principal.ConvertexTextoParaMaiusculo(ATexto: string): string;
begin
    Result := ATexto.ToUpper;
end;

procedure TForm_Principal.Meu_textoClick(Sender: TObject);
  var
  TextoMaiusculo: string;
begin
    TextoMaiusculo := ConvertexTextoParaMaiusculo(Meu_texto.Text);
    ShowMessage('meu novo')
end;

end.
