unit Jantar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Executivo1: TLabel;
    Executivo2: TLabel;
    Executivo3: TLabel;
    Executivo4: TLabel;
    Executivo5: TLabel;
    Gravata: TLabel;
    Nacionalid: TLabel;
    idade_1: TLabel;
    Suco_1: TLabel;
    Comida_1: TLabel;
    carro_1: TLabel;

    Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5: TComboBox;
    idade1, idade2, idade3, idade4, idade5: TComboBox;
    suco1, suco2, suco3, suco4, suco5: TComboBox;
    Comida1, Comida2, Comida3, Comida4, Comida5: TComboBox;
    Carro1, Carro2, Carro3, Carro4, Carro5: TComboBox;
    gravata_cor1, gravata_cor2, gravata_cor3, gravata_cor4, gravata_cor5: TComboBox;

    Panel1, Panel2, Panel3, Panel4, Panel5: TPanel;
    Regra1: TLabel;
    Regra2: TLabel;
    Regra3: TLabel;
    Regra4: TLabel;
    Regra5: TLabel;
    Regra6: TLabel;
    Regra7: TLabel;
    Regra8: TLabel;
    Regra9: TLabel;
    Regra10: TLabel;
    Regra11: TLabel;
    Regra12: TLabel;
    Regra13: TLabel;
    Regra14: TLabel;
    Regra15: TLabel;
    Regra16: TLabel;
    Regra17: TLabel;
    Regra18: TLabel;
    Regra19: TLabel;
    Regra20: TLabel;
    Regra21: TLabel;
    Regra22: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure gravata_corChange(Sender: TObject);
    procedure CarroChange(Sender: TObject);
    procedure CambioIdadeChange(Sender: TObject);
    procedure CambioComidaChange(Sender: TObject);
    procedure ComboBoxCloseUp(Sender: TObject);
    procedure AtualizarRegras;


  private
    function NomeParaCor(const Nome: string): TColor;
    procedure InicializarComboBox(const Combos: array of TComboBox; const Itens: array of string);
    procedure VerificarRegra1;
    procedure VerificarRegra2;
    procedure VerificarRegra3;
    procedure VerificarRegra4;
    procedure VerificarRegra5;
    procedure VerificarRegra6;
    procedure VerificarRegra7;
    procedure VerificarRegra8;
    procedure VerificarRegra9;
    procedure VerificarRegra10;
    procedure VerificarRegra11;
    procedure VerificarRegra12;
    procedure VerificarRegra13;
    procedure VerificarRegra14;
    procedure VerificarRegra15;
    procedure VerificarRegra16;
    procedure VerificarRegra17;
    procedure VerificarRegra18;
    procedure VerificarRegra19;
    procedure VerificarRegra20;
    procedure VerificarRegra21;
    procedure VerificarRegra22;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
const
  Cores: array[0..5] of string = ('', 'amarelo', 'azul', 'branca', 'verde', 'vermelho');
  Carros: array[0..5] of string = ('', 'crossover', 'hatch', 'pickup', 'sedan', 'SUV');
  Comidas: array[0..5] of string = ('', 'frango', 'massa', 'peixe', 'salada', 'sopa');
  Nacionalidades: array[0..5] of string = ('', 'alemão', 'inglês', 'japonês', 'sueco', 'italiano');
  Idades: array[0..5] of string = ('', '47', '50', '51', '53', '54');
  Sucos: array[0..5] of string = ('', 'abacaxi', 'laranja', 'limão', 'maracujá', 'morango');
begin
  // Configurar os ComboBoxes com os dados apropriados
  InicializarComboBox([gravata_cor1, gravata_cor2, gravata_cor3, gravata_cor4, gravata_cor5], Cores);
  InicializarComboBox([Carro1, Carro2, Carro3, Carro4, Carro5], Carros);
  InicializarComboBox([Comida1, Comida2, Comida3, Comida4, Comida5], Comidas);
  InicializarComboBox([Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5], Nacionalidades);
  InicializarComboBox([idade1, idade2, idade3, idade4, idade5], Idades);
  InicializarComboBox([suco1, suco2, suco3, suco4, suco5], Sucos);

  // Painéis sem fundo herdado
  Panel1.ParentBackground := False;
  Panel2.ParentBackground := False;
  Panel3.ParentBackground := False;
  Panel4.ParentBackground := False;
  Panel5.ParentBackground := False;

  // Associar eventos de mudança para gravata
  gravata_cor1.OnChange := gravata_corChange;
  gravata_cor2.OnChange := gravata_corChange;
  gravata_cor3.OnChange := gravata_corChange;
  gravata_cor4.OnChange := gravata_corChange;
  gravata_cor5.OnChange := gravata_corChange;

  Carro1.OnCloseUp := ComboBoxCloseUp;
  Carro2.OnCloseUp := ComboBoxCloseUp;
  Carro3.OnCloseUp := ComboBoxCloseUp;
  Carro4.OnCloseUp := ComboBoxCloseUp;
  Carro5.OnCloseUp := ComboBoxCloseUp;

  idade1.OnCloseUp := ComboBoxCloseUp;
  idade2.OnCloseUp := ComboBoxCloseUp;
  idade3.OnCloseUp := ComboBoxCloseUp;
  idade4.OnCloseUp := ComboBoxCloseUp;
  idade5.OnCloseUp := ComboBoxCloseUp;

  comida1.OnCloseUp := ComboBoxCloseUp;
  comida2.OnCloseUp := ComboBoxCloseUp;
  comida3.OnCloseUp := ComboBoxCloseUp;
  comida4.OnCloseUp := ComboBoxCloseUp;
  comida5.OnCloseUp := ComboBoxCloseUp;

  Nacionalidade1.OnCloseUp := ComboBoxCloseUp;
  Nacionalidade2.OnCloseUp := ComboBoxCloseUp;
  Nacionalidade3.OnCloseUp := ComboBoxCloseUp;
  Nacionalidade4.OnCloseUp := ComboBoxCloseUp;
  Nacionalidade5.OnCloseUp := ComboBoxCloseUp;

  suco1.OnCloseUp := ComboBoxCloseUp;
  suco2.OnCloseUp := ComboBoxCloseUp;
  suco3.OnCloseUp := ComboBoxCloseUp;
  suco4.OnCloseUp := ComboBoxCloseUp;
  suco5.OnCloseUp := ComboBoxCloseUp;

  // Verificar a regra1 ao carregar a tela para garantir que a regra seja avaliada
  AtualizarRegras;
end;

procedure TForm1.InicializarComboBox(const Combos: array of TComboBox; const Itens: array of string);
var
  i, j: Integer;
  OldIndex: Integer;
begin
  for i := Low(Combos) to High(Combos) do
  begin
    OldIndex := Combos[i].ItemIndex;
    Combos[i].Items.Clear;
    for j := Low(Itens) to High(Itens) do
      Combos[i].Items.Add(Itens[j]);
    Combos[i].Style := csDropDownList;
    Combos[i].ItemIndex := OldIndex;
  end;
end;

procedure TForm1.gravata_corChange(Sender: TObject);
var
  Combo: TComboBox;
  CorSelecionada: string;
  i: Integer;
  ListaCombos: array[0..4] of TComboBox;
  Painel: TPanel;
begin
  Combo := Sender as TComboBox;
  CorSelecionada := Combo.Text;

  ListaCombos[0] := gravata_cor1;
  ListaCombos[1] := gravata_cor2;
  ListaCombos[2] := gravata_cor3;
  ListaCombos[3] := gravata_cor4;
  ListaCombos[4] := gravata_cor5;

  // Verificar duplicação
  if CorSelecionada <> '' then
  begin
    for i := 0 to 4 do
    begin
      if (ListaCombos[i] <> Combo) and (SameText(ListaCombos[i].Text, CorSelecionada)) then
      begin
        ShowMessage('A cor "' + CorSelecionada + '" já foi selecionada em outro executivo.');
        Break;
      end;
    end;
  end;

  case Combo.Tag of
    0: Painel := Panel1;
    1: Painel := Panel2;
    2: Painel := Panel3;
    3: Painel := Panel4;
    4: Painel := Panel5;
  else
    Exit;
  end;

  // Atualizar cor do painel
  if Combo = gravata_cor1 then Painel := Panel1
  else if Combo = gravata_cor2 then Painel := Panel2
  else if Combo = gravata_cor3 then Painel := Panel3
  else if Combo = gravata_cor4 then Painel := Panel4
  else if Combo = gravata_cor5 then Painel := Panel5
  else Exit;

  Painel.Color := NomeParaCor(CorSelecionada);
  Painel.Repaint;

  // Verificar e atualizar as regras automaticamente
  AtualizarRegras;
end;

procedure TForm1.CarroChange(Sender: TObject);
begin
  AtualizarRegras;
end;

procedure AtualizarLabelRegra(LabelRegra: TLabel; RegraAtendida, Divergente: Boolean);
begin
  // Remove qualquer símbolo antigo do início
  LabelRegra.Caption := StringReplace(LabelRegra.Caption, '✔ ', '', []);
  LabelRegra.Caption := StringReplace(LabelRegra.Caption, '✘ ', '', []);

  if Divergente then
  begin
    LabelRegra.Font.Color := clRed;
    LabelRegra.Font.Style := [fsBold];
    LabelRegra.Caption := '✘ ' + LabelRegra.Caption;
  end
  else if RegraAtendida then
  begin
    LabelRegra.Font.Color := clGreen;
    LabelRegra.Font.Style := [fsUnderline];
    LabelRegra.Caption := '✔ ' + LabelRegra.Caption;
  end
  else
  begin
    LabelRegra.Font.Color := clBlack;
    LabelRegra.Font.Style := [];
    // Mantém o texto da regra sem símbolos
  end;
end;


procedure TForm1.VerificarRegra1;
var
  i: Integer;
  ListaGravata, ListaCarros: array[0..4] of TComboBox;
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  ListaGravata[0] := gravata_cor1;
  ListaGravata[1] := gravata_cor2;
  ListaGravata[2] := gravata_cor3;
  ListaGravata[3] := gravata_cor4;
  ListaGravata[4] := gravata_cor5;

  ListaCarros[0] := Carro1;
  ListaCarros[1] := Carro2;
  ListaCarros[2] := Carro3;
  ListaCarros[3] := Carro4;
  ListaCarros[4] := Carro5;

  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  for i := 0 to 4 do
  begin
    if (ListaGravata[i].Text <> '') or (ListaCarros[i].Text <> '') then
      TemCamposPreenchidos := True;

    if SameText(ListaGravata[i].Text, 'vermelho') and SameText(ListaCarros[i].Text, 'SUV') then
    begin
      RegraAtendida := True;
      Break;
    end;
  end;

  // Verificar divergência só se tudo estiver preenchido e não estiver correto
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    for i := 0 to 4 do
    begin
      if (ListaGravata[i].Text <> '') and (ListaCarros[i].Text <> '') then
      begin
        if SameText(ListaGravata[i].Text, 'vermelho') xor SameText(ListaCarros[i].Text, 'SUV') then
        begin
          Divergente := True;
          Break;
        end;
      end;
    end;
  end;

  AtualizarLabelRegra(Regra1, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra2;
var
  i: Integer;
  ListaCarros, ListaSuco: array[0..4] of TComboBox;
  RegraAtendida, Divergente, TemCamposPreenchidos: Boolean;
begin
  ListaCarros[0] := Carro1;
  ListaCarros[1] := Carro2;
  ListaCarros[2] := Carro3;
  ListaCarros[3] := Carro4;
  ListaCarros[4] := Carro5;

  ListaSuco[0] := suco1;
  ListaSuco[1] := suco2;
  ListaSuco[2] := suco3;
  ListaSuco[3] := suco4;
  ListaSuco[4] := suco5;

  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  for i := 0 to 4 do
  begin
    if (ListaSuco[i].Text <> '') or (ListaCarros[i].Text <> '') then
      TemCamposPreenchidos := True;

    if SameText(ListaSuco[i].Text, 'morango') and SameText(ListaCarros[i].Text, 'sedan') then
    begin
      RegraAtendida := True;
      Break;
    end;
  end;

  // Verificar divergência se houver dados preenchidos e a regra ainda não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    for i := 0 to 4 do
    begin
      if (ListaSuco[i].Text <> '') and (ListaCarros[i].Text <> '') then
      begin
        if SameText(ListaSuco[i].Text, 'morango') xor SameText(ListaCarros[i].Text, 'sedan') then
        begin
          Divergente := True;
          Break;
        end;
      end;
    end;
  end;

  AtualizarLabelRegra(Regra2, RegraAtendida, Divergente);
end;


procedure TForm1.VerificarRegra3;
var
  RegraAtendida, Divergente, TemCamposPreenchidos: Boolean;
begin
  TemCamposPreenchidos := Carro5.Text <> '';

  RegraAtendida := SameText(Carro5.Text, 'Crossover');

  Divergente := TemCamposPreenchidos and not RegraAtendida and (Carro5.Text <> '');

  AtualizarLabelRegra(Regra3, RegraAtendida, Divergente);
end;

procedure TForm1.CambioIdadeChange(Sender: TObject);
begin
  VerificarRegra4;
end;

procedure TForm1.CambioComidaChange(Sender: TObject);
begin
  VerificarRegra4;
end;

procedure TForm1.VerificarRegra4;
var
  i, j: Integer;
  RegraAtendida, Divergente, TemCamposPreenchidos: Boolean;
  ListaIdade, ListaComida: array[0..4] of TComboBox;
  idadeValida, comidaValida: Boolean;
begin
  // Inicializar as listas de ComboBoxes
  ListaIdade[0] := idade1;
  ListaIdade[1] := idade2;
  ListaIdade[2] := idade3;
  ListaIdade[3] := idade4;
  ListaIdade[4] := idade5;

  ListaComida[0] := comida1;
  ListaComida[1] := comida2;
  ListaComida[2] := comida3;
  ListaComida[3] := comida4;
  ListaComida[4] := comida5;

  RegraAtendida := False;
  TemCamposPreenchidos := True;

  // Verifica se todos os campos estão preenchidos
  for i := 0 to 4 do
  begin
    if (ListaIdade[i].Text = '') or (ListaComida[i].Text = '') then
    begin
      TemCamposPreenchidos := False;
      Break;
    end;
  end;

  // Verifica se existe um executivo de 51 anos ao lado de quem come frango
  for i := 0 to 4 do
  begin
    idadeValida := SameText(ListaIdade[i].Text, '51');

    if idadeValida then
    begin
      // Verifica vizinho da esquerda
      if (i > 0) and SameText(ListaComida[i - 1].Text, 'frango') then
        RegraAtendida := True;

      // Verifica vizinho da direita
      if (i < 4) and SameText(ListaComida[i + 1].Text, 'frango') then
        RegraAtendida := True;
    end;
  end;

  Divergente := TemCamposPreenchidos and not RegraAtendida;

  // Atualizar a label de acordo com o resultado
  AtualizarLabelRegra(Regra4, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra5;
var
  ListaComida: array[0..4] of TComboBox;
  RegraAtendida, Divergente, TemSopa: Boolean;
  i: Integer;
begin
  ListaComida[0] := comida1;
  ListaComida[1] := comida2;
  ListaComida[2] := comida3;
  ListaComida[3] := comida4;
  ListaComida[4] := comida5;

  RegraAtendida := False;
  Divergente := False;
  TemSopa := False;

  // Verifica se há 'sopa' e onde está
  for i := 0 to 4 do
  begin
    if SameText(Trim(ListaComida[i].Text), 'sopa') then
    begin
      TemSopa := True;
      if (i = 0) or (i = 4) then
        RegraAtendida := True
      else
        Divergente := True;
    end;
  end;

  // Aplica visual
  AtualizarLabelRegra(regra5, RegraAtendida, Divergente and TemSopa);
end;

procedure TForm1.VerificarRegra6;
var
  i: Integer;
  ListaGravatas, ListaComidas: array[0..4] of TComboBox;
  RegraAtendida, Divergente, TemGravataAzul: Boolean;
begin
  ListaGravatas[0] := gravata_cor1;
  ListaGravatas[1] := gravata_cor2;
  ListaGravatas[2] := gravata_cor3;
  ListaGravatas[3] := gravata_cor4;
  ListaGravatas[4] := gravata_cor5;

  ListaComidas[0] := comida1;
  ListaComidas[1] := comida2;
  ListaComidas[2] := comida3;
  ListaComidas[3] := comida4;
  ListaComidas[4] := comida5;

  RegraAtendida := False;
  Divergente := False;
  TemGravataAzul := False;

  for i := 0 to 4 do
  begin
    if SameText(ListaGravatas[i].Text, 'azul') then
    begin
      TemGravataAzul := True;
      if ((i > 0) and SameText(ListaComidas[i - 1].Text, 'massa')) or
         ((i < 4) and SameText(ListaComidas[i + 1].Text, 'massa')) then
      begin
        RegraAtendida := True;
        Break;
      end
      else
        Divergente := True;
    end;
  end;

  AtualizarLabelRegra(regra6, RegraAtendida, Divergente and TemGravataAzul);
end;

procedure TForm1.VerificarRegra7;
var
  i: Integer;
  ListaIdades, ListaComidas: array[0..4] of TComboBox;
  MaisNovoIdx: Integer;
  Idade, MenorIdade: Integer;
  RegraAtendida, Divergente, TemCamposPreenchidos: Boolean;
begin
  ListaIdades[0] := idade1;
  ListaIdades[1] := idade2;
  ListaIdades[2] := idade3;
  ListaIdades[3] := idade4;
  ListaIdades[4] := idade5;

  ListaComidas[0] := comida1;
  ListaComidas[1] := comida2;
  ListaComidas[2] := comida3;
  ListaComidas[3] := comida4;
  ListaComidas[4] := comida5;

  MenorIdade := MaxInt;
  MaisNovoIdx := -1;
  RegraAtendida := False;
  TemCamposPreenchidos := True;

  // Verificar se todas as idades e comidas estão preenchidas
  for i := 0 to 4 do
  begin
    if (ListaIdades[i].Text = '') or (ListaComidas[i].Text = '') then
    begin
      TemCamposPreenchidos := False;
      Break;
    end;
  end;

  // Encontrar o índice do executivo mais novo
  for i := 0 to 4 do
  begin
    if TryStrToInt(ListaIdades[i].Text, Idade) then
    begin
      if Idade < MenorIdade then
      begin
        MenorIdade := Idade;
        MaisNovoIdx := i;
      end;
    end;
  end;

  // Verificar se o mais novo está à direita de quem come salada
  if (MaisNovoIdx > 0) and SameText(ListaComidas[MaisNovoIdx - 1].Text, 'Salada') then
    RegraAtendida := True;

  Divergente := TemCamposPreenchidos and not RegraAtendida;

  AtualizarLabelRegra(Regra7, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra8;
var
  i: Integer;
  ListaComidas, ListaGravatas: array[0..4] of TComboBox;
  RegraAtendida, Divergente, TemPeixe: Boolean;
begin
  ListaComidas[0] := comida1;
  ListaComidas[1] := comida2;
  ListaComidas[2] := comida3;
  ListaComidas[3] := comida4;
  ListaComidas[4] := comida5;

  ListaGravatas[0] := gravata_cor1;
  ListaGravatas[1] := gravata_cor2;
  ListaGravatas[2] := gravata_cor3;
  ListaGravatas[3] := gravata_cor4;
  ListaGravatas[4] := gravata_cor5;

  RegraAtendida := False;
  Divergente := False;
  TemPeixe := False;

  for i := 0 to 4 do
  begin
    if SameText(ListaComidas[i].Text, 'peixe') then
    begin
      TemPeixe := True;
      if SameText(ListaGravatas[i].Text, 'branca') then
        RegraAtendida := True
      else
        Divergente := True;
    end;
  end;

  AtualizarLabelRegra(regra8, RegraAtendida, Divergente and TemPeixe);
end;

procedure TForm1.VerificarRegra9;
var
  RegraAtendida, Divergente: Boolean;
begin
  RegraAtendida := SameText(Trim(suco4.Text), 'abacaxi');
  Divergente := (Trim(suco4.Text) <> '') and not RegraAtendida;
  AtualizarLabelRegra(regra9, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra10;
var
  i, idade: Integer;
  ListaIdades, ListaSucos: array[0..4] of TComboBox;
  RegraAtendida, Divergente: Boolean;
begin
  ListaIdades[0] := idade1;
  ListaIdades[1] := idade2;
  ListaIdades[2] := idade3;
  ListaIdades[3] := idade4;
  ListaIdades[4] := idade5;

  ListaSucos[0] := suco1;
  ListaSucos[1] := suco2;
  ListaSucos[2] := suco3;
  ListaSucos[3] := suco4;
  ListaSucos[4] := suco5;

  RegraAtendida := False;
  Divergente := False;

  for i := 0 to 4 do
  begin
    if TryStrToInt(Trim(ListaIdades[i].Text), idade) then
    begin
      if (idade = 51) and SameText(Trim(ListaSucos[i].Text), 'laranja') then
      begin
        RegraAtendida := True;
        Break;
      end
      else if (idade = 51) and (ListaSucos[i].Text <> '') then
      begin
        Divergente := True;
      end;
    end;
  end;

  AtualizarLabelRegra(regra10, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra11;
var
  i, idade: Integer;
  ListaIdade, ListaSuco: array[0..4] of TComboBox;
  RegraAtendida, Divergente, TemCamposPreenchidos: Boolean;
begin
  // Inicializa as listas de idade e suco
  ListaIdade[0] := idade1;
  ListaIdade[1] := idade2;
  ListaIdade[2] := idade3;
  ListaIdade[3] := idade4;
  ListaIdade[4] := idade5;

  ListaSuco[0] := suco1;
  ListaSuco[1] := suco2;
  ListaSuco[2] := suco3;
  ListaSuco[3] := suco4;
  ListaSuco[4] := suco5;

  RegraAtendida := False;
  TemCamposPreenchidos := True;

  // Verificar se todos os campos de idade e suco estão preenchidos
  for i := 0 to 4 do
  begin
    if (ListaIdade[i].Text = '') or (ListaSuco[i].Text = '') then
    begin
      TemCamposPreenchidos := False;
      Break;
    end;
  end;

  // Verificar se existe algum executivo de 50 anos que está bebendo maracujá
  for i := 0 to 4 do
  begin
    if TryStrToInt(ListaIdade[i].Text, idade) and SameText(ListaSuco[i].Text, 'maracujá') then
    begin
      if idade = 50 then
      begin
        RegraAtendida := True;
        Break;
      end;
    end;
  end;

  Divergente := TemCamposPreenchidos and not RegraAtendida;

  AtualizarLabelRegra(Regra11, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra12;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se o carro na primeira posição é "Hatch"
  if SameText(Carro1.Text, 'hatch') then
    RegraAtendida := True;

  // Verificar se o campo Carro1 está preenchido
  if Carro1.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência apenas se o campo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if not SameText(Carro1.Text, 'hatch') then
      Divergente := True;
  end;

  // Atualiza o label com base na regra
  AtualizarLabelRegra(Regra12, RegraAtendida, Divergente);
end;


procedure TForm1.VerificarRegra13;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se o suco na primeira posição é "limão"
  if SameText(suco1.Text, 'limão') then
    RegraAtendida := True;

  // Verificar se o campo suco1 está preenchido
  if suco1.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência apenas se o campo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if not SameText(suco1.Text, 'limão') then
      Divergente := True;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra13, RegraAtendida, Divergente);
end;


procedure TForm1.VerificarRegra14;
var
  IndiceItaliano, TotalItalianos: Integer;
  ListaNacionalidade: array[0..4] of TComboBox;
  RegraAtendida, Divergente, PontasPreenchidas: Boolean;
begin
  ListaNacionalidade[0] := Nacionalidade1;
  ListaNacionalidade[1] := Nacionalidade2;
  ListaNacionalidade[2] := Nacionalidade3;
  ListaNacionalidade[3] := Nacionalidade4;
  ListaNacionalidade[4] := Nacionalidade5;

  TotalItalianos := 0;
  IndiceItaliano := -1;

  // Verifica se as duas pontas estão preenchidas
  PontasPreenchidas := (ListaNacionalidade[0].Text <> '') and (ListaNacionalidade[4].Text <> '');

  // Conta Italianos e obtém o índice
  if SameText(ListaNacionalidade[0].Text, 'Italiano') then
  begin
    Inc(TotalItalianos);
    IndiceItaliano := 0;
  end;
  if SameText(ListaNacionalidade[4].Text, 'Italiano') then
  begin
    Inc(TotalItalianos);
    IndiceItaliano := 4;
  end;
  // Os do meio não importam, pois só verificamos se está nas pontas

  RegraAtendida := (TotalItalianos = 1) and ((IndiceItaliano = 0) or (IndiceItaliano = 4));
  Divergente := PontasPreenchidas and not RegraAtendida;

  AtualizarLabelRegra(regra14, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra15;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se o Alemão está na terceira posição
  if SameText(Nacionalidade3.Text, 'Alemão') then
    RegraAtendida := True;

  // Verificar se o campo Nacionalidade3 está preenchido
  if Nacionalidade3.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência apenas se o campo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if not SameText(Nacionalidade3.Text, 'Alemão') then
      Divergente := True;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra15, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra16;
var
  i, posIngles, posAmarela: Integer;
  ListaGravatas, ListaNacionalidades: array[0..4] of TComboBox;
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  ListaGravatas[0] := gravata_cor1;
  ListaGravatas[1] := gravata_cor2;
  ListaGravatas[2] := gravata_cor3;
  ListaGravatas[3] := gravata_cor4;
  ListaGravatas[4] := gravata_cor5;

  ListaNacionalidades[0] := nacionalidade1;
  ListaNacionalidades[1] := nacionalidade2;
  ListaNacionalidades[2] := nacionalidade3;
  ListaNacionalidades[3] := nacionalidade4;
  ListaNacionalidades[4] := nacionalidade5;

  posIngles := -1;
  posAmarela := -1;
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar as posições de "Inglês" e "Amarelo"
  for i := 0 to 4 do
  begin
    if SameText(ListaNacionalidades[i].Text, 'inglês') then
      posIngles := i;
    if SameText(ListaGravatas[i].Text, 'amarelo') then
      posAmarela := i;
  end;

  // Verificar se a regra foi atendida (Inglês após Amarela)
  if (posIngles <> -1) and (posAmarela <> -1) and (posIngles > posAmarela) then
    RegraAtendida := True;

  // Verificar se algum campo de nacionalidade ou gravata está preenchido
  for i := 0 to 4 do
  begin
    if (ListaNacionalidades[i].Text <> '') or (ListaGravatas[i].Text <> '') then
      TemCamposPreenchidos := True;
  end;

  // Verificar divergência apenas se os campos estiverem preenchidos e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if (posIngles <> -1) and (posAmarela <> -1) and (posIngles < posAmarela) then
      Divergente := True;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra16, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra17;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se a nacionalidade na primeira posição é "Sueco"
  if SameText(Nacionalidade1.Text, 'Sueco') then
    RegraAtendida := True;

  // Verificar se algum campo de nacionalidade está preenchido
  if Nacionalidade1.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência somente se os campos estiverem preenchidos e a regra não foi atendida
  if TemCamposPreenchidos and not RegraAtendida then
    Divergente := True;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra17, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra18;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Exemplo de verificação
  if SameText(Gravata_cor1.Text, 'Branca') then
    RegraAtendida := True;

  // Verificar se o campo de gravata está preenchido
  if Gravata_cor1.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência somente se o campo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
    Divergente := True; // Corrigido para garantir que o tipo é compatível

  // Atualizar o label com base na regra
  AtualizarLabelRegra(Regra18, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra19;
var
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se a gravata na terceira posição é "Azul"
  if SameText(Gravata_cor3.Text, 'Azul') then
    RegraAtendida := True;

  // Verificar se o campo de gravata está preenchido
  if Gravata_cor3.Text <> '' then
    TemCamposPreenchidos := True;

  // Verificar divergência somente se o campo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
    Divergente := True;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra19, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra20;
var
  i: Integer;
  ListaGravatas, ListaSuco: array[0..4] of TComboBox;
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  ListaGravatas[0] := Gravata_cor1;
  ListaGravatas[1] := Gravata_cor2;
  ListaGravatas[2] := Gravata_cor3;
  ListaGravatas[3] := Gravata_cor4;
  ListaGravatas[4] := Gravata_cor5;

  ListaSuco[0] := suco1;
  ListaSuco[1] := suco2;
  ListaSuco[2] := suco3;
  ListaSuco[3] := suco4;
  ListaSuco[4] := suco5;

  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se para algum executivo a gravata é "Verde" e o suco é "Laranja"
  for i := 0 to 4 do
  begin
    if (ListaGravatas[i].Text <> '') or (ListaSuco[i].Text <> '') then
      TemCamposPreenchidos := True;

    if SameText(ListaGravatas[i].Text, 'Verde') and SameText(ListaSuco[i].Text, 'Laranja') then
    begin
      RegraAtendida := True;
      Break;
    end;
  end;

  // Verificar divergência só se tudo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    for i := 0 to 4 do
    begin
      if (ListaGravatas[i].Text <> '') and (ListaSuco[i].Text <> '') then
      begin
        if SameText(ListaGravatas[i].Text, 'Verde') xor SameText(ListaSuco[i].Text, 'Laranja') then
        begin
          Divergente := True;
          Break;
        end;
      end;
    end;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra20, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra21;
var
  i, posBranca, posVerde: Integer;
  ListaGravatas: array[0..4] of TComboBox;
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  ListaGravatas[0] := gravata_cor1;
  ListaGravatas[1] := gravata_cor2;
  ListaGravatas[2] := gravata_cor3;
  ListaGravatas[3] := gravata_cor4;
  ListaGravatas[4] := gravata_cor5;

  posBranca := -1;
  posVerde := -1;
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Verificar se há gravatas "Branca" e "Verde"
  for i := 0 to 4 do
  begin
    if (ListaGravatas[i].Text <> '') then
      TemCamposPreenchidos := True;

    if SameText(ListaGravatas[i].Text, 'branca') then
      posBranca := i;
    if SameText(ListaGravatas[i].Text, 'verde') then
      posVerde := i;
  end;

  // A regra é atendida se a gravata branca vier antes da verde
  if (posBranca <> -1) and (posVerde <> -1) and (posBranca < posVerde) then
    RegraAtendida := True;

  // Verificar divergência só se tudo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if (posBranca <> -1) and (posVerde <> -1) and (posBranca > posVerde) then
    begin
      Divergente := True;
    end;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra21, RegraAtendida, Divergente);
end;

procedure TForm1.VerificarRegra22;
var
  i, posMaisVelho: Integer;
  ListaCarros: array[0..4] of TComboBox;
  ListaIdades: array[0..4] of TComboBox;
  maiorIdade, idadeAtual: Integer;
  RegraAtendida, Divergente: Boolean;
  TemCamposPreenchidos: Boolean;
begin
  ListaCarros[0] := Carro1;
  ListaCarros[1] := Carro2;
  ListaCarros[2] := Carro3;
  ListaCarros[3] := Carro4;
  ListaCarros[4] := Carro5;

  ListaIdades[0] := Idade1;
  ListaIdades[1] := Idade2;
  ListaIdades[2] := Idade3;
  ListaIdades[3] := Idade4;
  ListaIdades[4] := Idade5;

  maiorIdade := -1;
  posMaisVelho := -1;
  RegraAtendida := False;
  Divergente := False;
  TemCamposPreenchidos := False;

  // Encontrar a posição do executivo mais velho
  for i := 0 to 4 do
  begin
    if (ListaIdades[i].Text <> '') then
      TemCamposPreenchidos := True;

    if TryStrToInt(ListaIdades[i].Text, idadeAtual) then
    begin
      if idadeAtual > maiorIdade then
      begin
        maiorIdade := idadeAtual;
        posMaisVelho := i;
      end;
    end;
  end;

  // Verifica se o executivo mais velho tem "Pickup" à sua esquerda
  if (posMaisVelho > 0) and SameText(ListaCarros[posMaisVelho - 1].Text, 'pickup') then
    RegraAtendida := True;

  // Verifica divergência só se tudo estiver preenchido e a regra não for atendida
  if TemCamposPreenchidos and not RegraAtendida then
  begin
    if (posMaisVelho > 0) and SameText(ListaCarros[posMaisVelho - 1].Text, 'pickup') then
    begin
      Divergente := True;
    end;
  end;

  // Atualizar o label com base na regra
  AtualizarLabelRegra(regra22, RegraAtendida, Divergente);
end;

procedure TForm1.AtualizarRegras;
begin
  VerificarRegra1;
  VerificarRegra2;
  VerificarRegra3;
  VerificarRegra4;
  VerificarRegra5;
  VerificarRegra6;
  VerificarRegra7;
  VerificarRegra8;
  VerificarRegra9;
  VerificarRegra10;
  VerificarRegra11;
  VerificarRegra12;
  VerificarRegra13;
  VerificarRegra14;
  VerificarRegra15;
  VerificarRegra16;
  VerificarRegra17;
  VerificarRegra18;
  VerificarRegra19;
  VerificarRegra20;
  VerificarRegra21;
  VerificarRegra22;

  Application.ProcessMessages; // força a atualização da interface
end;


function TForm1.NomeParaCor(const Nome: string): TColor;
begin
  if SameText(Nome, 'amarelo') then Result := clYellow
  else if SameText(Nome, 'azul') then Result := clBlue
  else if SameText(Nome, 'branca') then Result := clWhite
  else if SameText(Nome, 'verde') then Result := clGreen
  else if SameText(Nome, 'vermelho') then Result := clRed
  else Result := clBtnFace; // cor padrão para vazio
end;

procedure TForm1.ComboBoxCloseUp(Sender: TObject);
begin
  AtualizarRegras;
end;


end.

