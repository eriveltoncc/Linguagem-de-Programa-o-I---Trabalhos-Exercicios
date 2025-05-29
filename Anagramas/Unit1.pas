unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Generics.Collections, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Letra1: TLabel;
    Letra2: TLabel;
    Letra3: TLabel;
    Letra4: TLabel;
    Letra5: TLabel;
    Letra6: TLabel;
    FlowPanelMontagem: TFlowPanel;
    btnOrganizar: TButton;
    pnlDicas: TButton;
    GroupBox1: TGroupBox;
    edtPalavra1: TEdit;
    btnLimpar: TSpeedButton;
    edtPalavra2: TEdit;
    edtPalavra3: TEdit;
    edtPalavra4: TEdit;
    edtPalavra5: TEdit;
    edtPalavra6: TEdit;
    edtPalavra7: TEdit;
    edtPalavra8: TEdit;
    edtPalavra9: TEdit;
    edtPalavra10: TEdit;
    edtPalavra11: TEdit;
    edtPalavra12: TEdit;
    edtPalavra13: TEdit;
    edtPalavra14: TEdit;
    edtPalavra15: TEdit;
    edtPalavra16: TEdit;
    edtPalavra17: TEdit;
    edtPalavra18: TEdit;
    edtPalavra19: TEdit;
    edtPalavra20: TEdit;
    edtPalavra21: TEdit;
    edtPalavra22: TEdit;
    edtPalavra23: TEdit;
    edtPalavra24: TEdit;
    edtPalavra25: TEdit;
    edtPalavra26: TEdit;
    edtPalavra27: TEdit;
    edtPalavra28: TEdit;
    edtPalavra29: TEdit;
    edtPalavra30: TEdit;
    edtPalavra31: TEdit;
    edtPalavra32: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnOrganizarClick(Sender: TObject);
    procedure pnlDicasClick(Sender: TObject);
  private
    LetraOriginais: array[1..6] of TLabel;
    MapLetraParaOrigem: TDictionary<TLabel, TLabel>;
    ListaPalavras: TList<string>;
    EditsPalavras: array[1..32] of TEdit;
    procedure CriarEventos;
    procedure LetraOrigemClick(Sender: TObject);
    procedure LetraNovaClick(Sender: TObject);
    procedure AtualizarEstadoBotaoOrganizar;
    procedure VerificarPalavraMontada;
    procedure InicializarPalavras;
    function ObterDicaUnica: string;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  LetraOriginais[1] := Letra1;
  LetraOriginais[2] := Letra2;
  LetraOriginais[3] := Letra3;
  LetraOriginais[4] := Letra4;
  LetraOriginais[5] := Letra5;
  LetraOriginais[6] := Letra6;

  Letra1.Caption := 'O';
  Letra2.Caption := 'R';
  Letra3.Caption := 'E';
  Letra4.Caption := 'L';
  Letra5.Caption := 'A';
  Letra6.Caption := 'S';

  EditsPalavras[1] := edtPalavra1;   EditsPalavras[2] := edtPalavra2;
  EditsPalavras[3] := edtPalavra3;   EditsPalavras[4] := edtPalavra4;
  EditsPalavras[5] := edtPalavra5;   EditsPalavras[6] := edtPalavra6;
  EditsPalavras[7] := edtPalavra7;   EditsPalavras[8] := edtPalavra8;
  EditsPalavras[9] := edtPalavra9;   EditsPalavras[10] := edtPalavra10;
  EditsPalavras[11] := edtPalavra11; EditsPalavras[12] := edtPalavra12;
  EditsPalavras[13] := edtPalavra13; EditsPalavras[14] := edtPalavra14;
  EditsPalavras[15] := edtPalavra15; EditsPalavras[16] := edtPalavra16;
  EditsPalavras[17] := edtPalavra17; EditsPalavras[18] := edtPalavra18;
  EditsPalavras[19] := edtPalavra19; EditsPalavras[20] := edtPalavra20;
  EditsPalavras[21] := edtPalavra21; EditsPalavras[22] := edtPalavra22;
  EditsPalavras[23] := edtPalavra23; EditsPalavras[24] := edtPalavra24;
  EditsPalavras[25] := edtPalavra25; EditsPalavras[26] := edtPalavra26;
  EditsPalavras[27] := edtPalavra27; EditsPalavras[28] := edtPalavra28;
  EditsPalavras[29] := edtPalavra29; EditsPalavras[30] := edtPalavra30;
  EditsPalavras[31] := edtPalavra31; EditsPalavras[32] := edtPalavra32;

  MapLetraParaOrigem := TDictionary<TLabel, TLabel>.Create;
  ListaPalavras := TList<string>.Create;
  InicializarPalavras;
  CriarEventos;

  FlowPanelMontagem.AutoSize := False;
  FlowPanelMontagem.Align := alNone;
  FlowPanelMontagem.Left := (ClientWidth - FlowPanelMontagem.Width) div 2;

  AtualizarEstadoBotaoOrganizar;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  MapLetraParaOrigem.Free;
  ListaPalavras.Free;
end;

procedure TForm1.InicializarPalavras;
const
  Palavras: array[1..32] of string = (
    'SALERO','ROSELA','LARESO','SOLERA','SAL','SOL','ROSA','SELO',
    'RASO','OSAR','LEAO','SOAR','ROLA','EROS','REAL','LESO',
    'ORAL','SERA','ALER','SELA','RALO','ROES','LASO','ALOE',
    'RALE','SOLA','SOAL','ARLES','ORES','RESO','SOEL','OSER'
  );
var
  i: Integer;
begin
  for i := 1 to 32 do
    ListaPalavras.Add(Palavras[i]);

  for i := 1 to 32 do
    EditsPalavras[i].Text := '******';
end;

procedure TForm1.CriarEventos;
var
  i: Integer;
begin
  for i := 1 to 6 do
  begin
    LetraOriginais[i].Cursor := crHandPoint;
    LetraOriginais[i].OnClick := LetraOrigemClick;
  end;
end;

procedure TForm1.LetraOrigemClick(Sender: TObject);
var
  lblOrigem, lblNova: TLabel;
begin
  lblOrigem := TLabel(Sender);
  if not lblOrigem.Visible then Exit;

  lblOrigem.Visible := False;

  lblNova := TLabel.Create(FlowPanelMontagem);
  lblNova.Parent := FlowPanelMontagem;
  lblNova.Caption := lblOrigem.Caption;
  lblNova.AutoSize := False;
  lblNova.Width := 40;
  lblNova.Height := 40;
  lblNova.Alignment := taCenter;
  lblNova.Layout := tlCenter;
  lblNova.Font.Style := [fsBold];
  lblNova.Font.Size := 12;
  lblNova.Font.Name := 'Segoe UI';
  lblNova.Margins.Right := 5;
  lblNova.Cursor := crHandPoint;
  lblNova.Color := clWhite;
  lblNova.Transparent := False;
  lblNova.StyleElements := [seClient, seBorder, seFont];

  MapLetraParaOrigem.Add(lblNova, lblOrigem);
  lblNova.OnClick := LetraNovaClick;

  AtualizarEstadoBotaoOrganizar;
  VerificarPalavraMontada;
end;

procedure TForm1.LetraNovaClick(Sender: TObject);
var
  lblTemp: TLabel;
begin
  lblTemp := TLabel(Sender);
  if MapLetraParaOrigem.ContainsKey(lblTemp) then
  begin
    MapLetraParaOrigem[lblTemp].Visible := True;
    MapLetraParaOrigem.Remove(lblTemp);
  end;
  lblTemp.Free;
  AtualizarEstadoBotaoOrganizar;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
var
  lblNova: TLabel;
  lblOrigem: TLabel;
  LabelsParaRemover: TList<TLabel>;
begin
  LabelsParaRemover := TList<TLabel>.Create;
  try
    // Coleta todos os labels adicionados no FlowPanel que estão no dicionário
    for lblNova in MapLetraParaOrigem.Keys do
    begin
      lblOrigem := MapLetraParaOrigem[lblNova];
      lblOrigem.Visible := True;  // Torna o label original visível novamente
      LabelsParaRemover.Add(lblNova); // Marca para remoção
    end;

    // Remove os labels do FlowPanel e do dicionário
    for lblNova in LabelsParaRemover do
    begin
      MapLetraParaOrigem.Remove(lblNova);
      lblNova.Free;
    end;
  finally
    LabelsParaRemover.Free;
  end;

  // NÃO limpar os EditsPalavras aqui, pois o usuário pediu para manter os textos

  AtualizarEstadoBotaoOrganizar;
  VerificarPalavraMontada;
end;


procedure TForm1.btnOrganizarClick(Sender: TObject);
var
  Letras: TList<string>;
  i, indiceAleatorio: Integer;
  tmp: string;
begin
  Letras := TList<string>.Create;
  try
    for i := 1 to 6 do
      Letras.Add(LetraOriginais[i].Caption);

    Randomize;
    for i := Letras.Count - 1 downto 1 do
    begin
      indiceAleatorio := Random(i + 1);
      tmp := Letras[i];
      Letras[i] := Letras[indiceAleatorio];
      Letras[indiceAleatorio] := tmp;
    end;

    for i := 1 to 6 do
      LetraOriginais[i].Caption := Letras[i - 1];
  finally
    Letras.Free;
  end;
end;

procedure TForm1.AtualizarEstadoBotaoOrganizar;
var
  i: Integer;
  TodasVisiveis: Boolean;
begin
  TodasVisiveis := True;
  for i := 1 to 6 do
  begin
    if not LetraOriginais[i].Visible then
    begin
      TodasVisiveis := False;
      Break;
    end;
  end;
  btnOrganizar.Enabled := TodasVisiveis;
end;

procedure TForm1.VerificarPalavraMontada;
var
  i: Integer;
  PalavraFormada: string;
  lbl: TLabel;
  idxPalavra: Integer;
  EditEncontrado: Boolean;
begin
  if FlowPanelMontagem.ControlCount = 0 then
    Exit;

  PalavraFormada := '';
  for i := 0 to FlowPanelMontagem.ControlCount - 1 do
  begin
    if FlowPanelMontagem.Controls[i] is TLabel then
      PalavraFormada := PalavraFormada + TLabel(FlowPanelMontagem.Controls[i]).Caption;
  end;

  PalavraFormada := UpperCase(PalavraFormada);

  idxPalavra := ListaPalavras.IndexOf(PalavraFormada);
  if idxPalavra <> -1 then
  begin
    for i := 1 to 32 do
    begin
      if EditsPalavras[i].Text = PalavraFormada then
        Exit;
    end;

    EditEncontrado := False;
    for i := 1 to 32 do
    begin
      if (Trim(EditsPalavras[i].Text) = '') or (EditsPalavras[i].Text = '******') then
      begin
        EditsPalavras[i].Text := PalavraFormada;
        EditEncontrado := True;
        Break;
      end;
    end;

    if EditEncontrado then
    begin
      for i := FlowPanelMontagem.ControlCount - 1 downto 0 do
      begin
        if FlowPanelMontagem.Controls[i] is TLabel then
        begin
          lbl := TLabel(FlowPanelMontagem.Controls[i]);
          if MapLetraParaOrigem.ContainsKey(lbl) then
          begin
            MapLetraParaOrigem[lbl].Visible := True;
            MapLetraParaOrigem.Remove(lbl);
            lbl.Free;
          end;
        end;
      end;
      AtualizarEstadoBotaoOrganizar;
    end;
  end;
end;

procedure TForm1.pnlDicasClick(Sender: TObject);
var
  dica: string;
begin
  dica := ObterDicaUnica;
  if dica <> '' then
    ShowMessage('Dica: ' + dica)
  else
    ShowMessage('Nenhuma sugestão encontrada com as letras restantes.');
end;

function TForm1.ObterDicaUnica: string;
var
  LetrasNoFlowPanel: string;
  Palavra: string;
  i, idx: Integer;
  lbl: TLabel;
  LetrasTemp: string;
  c: Char;
  PalavrasValidas: TList<string>;
  JaUsada: Boolean;
  ContemTodasLetras: Boolean;
begin
  Result := '';

  // Pega todas as letras visíveis no FlowPanelMontagem (em qualquer ordem)
  LetrasNoFlowPanel := '';
  for i := 0 to FlowPanelMontagem.ControlCount - 1 do
  begin
    if FlowPanelMontagem.Controls[i] is TLabel then
    begin
      lbl := TLabel(FlowPanelMontagem.Controls[i]);
      LetrasNoFlowPanel := LetrasNoFlowPanel + UpperCase(lbl.Caption);
    end;
  end;

  if LetrasNoFlowPanel = '' then
    Exit;  // Sem letras, sem dica

  PalavrasValidas := TList<string>.Create;
  try
    // Monta lista de palavras válidas que contenham as letras do flowpanel e não estejam nos Edits
    for Palavra in ListaPalavras do
    begin
      // Verifica se palavra já foi usada (está em algum TEdit)
      JaUsada := False;
      for i := 1 to 32 do
      begin
        if SameText(EditsPalavras[i].Text, Palavra) then
        begin
          JaUsada := True;
          Break;
        end;
      end;
      if JaUsada then
        Continue;

      LetrasTemp := UpperCase(Palavra);
      ContemTodasLetras := True;

      // Verifica se todas as letras do FlowPanel estão na palavra (contando quantidade)
      for c in LetrasNoFlowPanel do
      begin
        if Pos(c, LetrasTemp) > 0 then
          Delete(LetrasTemp, Pos(c, LetrasTemp), 1)
        else
        begin
          ContemTodasLetras := False;
          Break;
        end;
      end;

      if ContemTodasLetras then
        PalavrasValidas.Add(Palavra);
    end;

    // Se não achou nenhuma válida, retorna ''
    if PalavrasValidas.Count = 0 then
      Exit;

    // Escolhe uma palavra aleatória da lista válida
    Randomize;
    idx := Random(PalavrasValidas.Count);
    Result := PalavrasValidas[idx];
  finally
    PalavrasValidas.Free;
  end;
end;


end.

