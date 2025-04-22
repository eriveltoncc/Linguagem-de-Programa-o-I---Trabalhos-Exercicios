unit paises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Generics.Collections,
  IOUtils;

type
  Tform1 = class(TForm)
    Contador: TLabel;
    Pesquisa: TEdit;
    Painel_Superior: TPanel;
    painel_global: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPaises: TList<string>;
    FAcertos: Integer;
    procedure CriarObjetosPaises;
    function CriptografarPalavras(APalavra: string): string;

  public
    procedure ContadorClick(Sender: TObject);
    { Public declarations }
  end;

var
  form1: Tform1;

implementation

{$R *.dfm}

procedure Tform1.ContadorClick(Sender: TObject);
begin

end;

procedure Tform1.CriarObjetosPaises;
const
  MAX_ITENS_POR_COLUNA = 25;
  LARGURA_COLUNA = 250;
  ALTURA_LINHA = 15;
  LARGURA_ROTULO = 100;
  ESPACAMENTO_HORIZONTAL = 10;
  ESPACAMENTO_VERTICAL = 5;
var
  ColunaPanel: TPanel;
  Pais: TLabel;
  EditTexto: TEdit;
  ColunaAtual, ItemNaColuna: Integer;
  LinhaPanel: TPanel;
  TopLocal: Integer;
begin
  ColunaAtual := 0;
  ItemNaColuna := 0;

  for var I := 0 to FPaises.Count - 1 do
  begin
    // Se iniciar nova coluna
    if ItemNaColuna = 0 then
    begin
      ColunaPanel := TPanel.Create(Self);
      ColunaPanel.Parent := painel_global;
      ColunaPanel.Align := alNone;
      ColunaPanel.Width := LARGURA_COLUNA;
      ColunaPanel.Height := painel_global.Height;
      ColunaPanel.Left := ColunaAtual * (LARGURA_COLUNA + ESPACAMENTO_HORIZONTAL);
      ColunaPanel.Top := 0;
      ColunaPanel.BevelOuter := bvNone;
    end;

    // Calcula a posiÁ„o vertical com base no Ìndice da linha
    TopLocal := ItemNaColuna * (ALTURA_LINHA + ESPACAMENTO_VERTICAL);

    LinhaPanel := TPanel.Create(Self);
    LinhaPanel.Parent := ColunaPanel;
    LinhaPanel.SetBounds(0, TopLocal, LARGURA_COLUNA, ALTURA_LINHA);
    LinhaPanel.BevelOuter := bvNone;

    // Label criptografado
    Pais := TLabel.Create(Self);
    Pais.Parent := LinhaPanel;
    Pais.Align := alLeft;
    Pais.Width := LARGURA_ROTULO;
    Pais.Alignment := taLeftJustify;
    Pais.Font.Size := 8;
    Pais.Caption := CriptografarPalavras(FPaises.Items[I]);
    Pais.Name := 'LabelPais' + IntToStr(I);

    // Edit para resposta
    EditTexto := TEdit.Create(Self);
    EditTexto.Parent := LinhaPanel;
    EditTexto.Align := alClient;
    EditTexto.Name := 'EditPais' + IntToStr(I);
    EditTexto.Font.Size := 8;
    EditTexto.Text := '';
    EditTexto.BorderStyle := bsSingle;
    EditTexto.Margins.SetBounds(5, 0, 0, 0);

    // PrÛxima linha na coluna
    Inc(ItemNaColuna);

    // Se chegou no limite da coluna, reseta o contador e muda de coluna
    if ItemNaColuna = MAX_ITENS_POR_COLUNA then
    begin
      ItemNaColuna := 0;
      Inc(ColunaAtual);
    end;
  end;
end;


function Tform1.CriptografarPalavras(APalavra: string): string;
var
  TamanhoPalavra: Integer;
begin
  TamanhoPalavra := APalavra.Length;

  // Caso a palavra tenha 2 ou menos caracteres, substitui tudo por "?"
  if TamanhoPalavra <= 2 then
  begin
    Result := StringOfChar('?', TamanhoPalavra);
    Exit;
  end;

  // Substitui a primeira e ˙ltima letra por "?", mantendo o restante
  Result := '?' + APalavra.Substring(1, TamanhoPalavra - 2) + '?';
end;

procedure Tform1.FormCreate(Sender: TObject);
var
  ListaPaises: TArray<string>;

begin
  Listapaises :=
    TFile.ReadAllLines('G:\Meu Drive\GITHUB\Trabalhos Faculdade\Trivia\Paises.txt');

  FPaises := TList<string>.Create(ListaPaises);
  CriarObjetosPaises;

end;

function RemoverAcentos(const Texto: string): string;
const
  Acentos = '¿¡¬√ƒ≈‡·‚„‰Â»… ÀËÈÍÎÃÕŒœÏÌÓÔ“”‘’÷ÿÚÛÙıˆ¯Ÿ⁄€‹˘˙˚¸«Á';
  SemAcentos = 'AAAAAAaaaaaaEEEEeeeeIIIIiiiiOOOOOOooooooUUUUuuuuCc';
var
  I: Integer;
begin
  Result := Texto;
  for I := 1 to Length(Acentos) do
    Result := StringReplace(Result, Acentos[I], SemAcentos[I], [rfReplaceAll]);
end;


procedure Tform1.PesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  PaisPesquisado, PaisNormalizado: string;
  EditPais: TEdit;
  Componente: TComponent;
  PaisEncontrado: Boolean;
begin
  if Key = VK_RETURN then // Quando pressionar Enter
  begin
    PaisPesquisado := RemoverAcentos(Pesquisa.Text); // Remove acentuaÁ„o do texto digitado
    PaisEncontrado := False; // Flag para verificar se o paÌs foi encontrado

    for var I := 0 to FPaises.Count - 1 do
    begin
      // Normaliza o nome do paÌs na lista antes de comparar
      PaisNormalizado := RemoverAcentos(FPaises[I]);

      if SameText(PaisNormalizado, PaisPesquisado) then // Compara ignorando acentuaÁ„o e diferenÁas de mai˙sculas/min˙sculas
      begin
        // Procura o campo correspondente pelo Ìndice
        Componente := FindComponent('EditPais' + IntToStr(I));

        if (Componente <> nil) and (Componente is TEdit) then
        begin
          EditPais := TEdit(Componente);
          EditPais.Text := FPaises[I]; // Substitui o texto com o nome original do paÌs
          Pesquisa.Clear; // Apaga o campo de pesquisa apÛs encontrar o paÌs
          PaisEncontrado := True; // Marca como encontrado

          // Incrementa o contador de acertos
          Inc(FAcertos);

          // Atualiza o contador na interface
          Contador.Caption := Format('%d de %d acertos', [FAcertos, FPaises.Count]);

          Break; // Para o loop ao encontrar o paÌs
        end
        else
        begin
          ShowMessage('Componente EditPais' + IntToStr(I) + ' n„o encontrado ou n„o È um TEdit.');
        end;
      end;
    end;

    // Caso o paÌs n„o seja encontrado, exibe a mensagem
    if not PaisEncontrado then
    begin
      ShowMessage('PaÌs n„o encontrado na lista.');
    end;
  end;
end;

end.
