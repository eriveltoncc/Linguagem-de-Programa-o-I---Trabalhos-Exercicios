unit Trabalho2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    FContador: Integer;
    FImagemSelecionada: TImage;
    function SortearImagem: string;
    procedure EventroAoEntrarNaImagem(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses
  Math;

procedure TForm1.EventroAoEntrarNaImagem(Sender: TObject);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(SortearImagem, 0);
  try
    TImage(Sender).Picture.Assign(nil);
    TImage(Sender).Picture.LoadFromStream(Stream);
    TImage(Sender).Repaint;
    FImagemSelecionada := TImage(Sender);
    Inc(FContador);
    Self.Caption := 'Trocas: ' + FContador.ToString;
  finally
    Stream.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FContador := 0;
end;

procedure TForm1.FormShow(Sender: TObject);
const
  QTD_COLUNAS = 10;
  QTD_LINHAS = 10;
  BTN_SIZE = 64;
var
  Buttom: TImage;
  Stream: TFileStream;
begin
  for var ColIndex := 1 to QTD_COLUNAS do
  begin
    for var LinIndex := 1 to QTD_LINHAS do
    begin
      Stream := TFileStream.Create(SortearImagem, 0);
      try
        Buttom := TImage.Create(Self);
        Buttom.Parent := Self;
        Buttom.Height := BTN_SIZE;
        Buttom.Width := BTN_SIZE;
        Buttom.Picture.LoadFromStream(Stream);
        Buttom.Left := (ColIndex - 1) * BTN_SIZE;
        Buttom.Top := (LinIndex - 1) * BTN_SIZE;
        Buttom.OnMouseEnter := EventroAoEntrarNaImagem;
      finally
        Stream.Free;
      end;
    end;

  end;
end;

function TForm1.SortearImagem: string;
const
  DIR = 'G:\Meu Drive\GITHUB\Trabalhos Faculdade\Trabalho2\';
  EXT = '.PNG';
var
  Index: Integer;
begin
  Index := RandomRange(1, 6);

  Result := DIR + 'Imagem' + index.ToString + EXT;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  Stream: TFileStream;
begin
  if Assigned(FImagemSelecionada) then

  begin
    Stream := TFileStream.Create(SortearImagem, 0);
    try
      FImagemSelecionada.Picture.Assign(nil);
      FImagemSelecionada.Picture.LoadFromStream(Stream);
      FImagemSelecionada.Repaint;
    finally
      Stream.Free;
    end;
  end;
end;

end.
