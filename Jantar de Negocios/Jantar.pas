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

    regra1, regra2, regra3, regra4, regra5, regra6, regra7, regra8, regra9, regra10,
    regra11, regra12, regra13, regra14, regra15, regra16, regra17, regra18,
    regra19, regra20, regra21, regra22: TCheckBox;

    Panel1, Panel2, Panel3, Panel4, Panel5: TPanel;

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

procedure TForm1.VerificarRegra1;
var
  i: Integer;
  ListaGravata, ListaCarros: array[0..4] of TComboBox;
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

  for i := 0 to 4 do
  begin
    if SameText(ListaGravata[i].Text, 'vermelho') and SameText(ListaCarros[i].Text, 'SUV') then
    begin
      regra1.Checked := True;
      Exit;
    end;
  end;
  regra1.Checked := False;
end;

procedure TForm1.VerificarRegra2;
var
  i: Integer;
  ListaCarros, ListaSuco: array[0..4] of TComboBox;
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

  for i := 0 to 4 do
  begin
    if SameText(ListaSuco[i].Text, 'morango') and SameText(ListaCarros[i].Text, 'sedan') then
    begin
      regra2.Checked := True;
      Exit;
    end;
  end;
  regra2.Checked := False;
end;

procedure TForm1.VerificarRegra3;
begin
  if SameText(Carro5.Text, 'Crossover') then
    regra3.Checked := True
  else
    regra3.Checked := False;
end;


procedure TForm1.CambioIdadeChange(Sender: TObject);
begin
  VerificarRegra4;
end;

procedure TForm1.CambioComidaChange(Sender: TObject);
begin
  VerificarRegra4;
end;

// Função de verificação da regra
procedure TForm1.VerificarRegra4;
var
  i, j: Integer;
  ListaIdade, ListaComida: array[0..4] of TComboBox;
begin
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

  // Procurar o executivo de 51 anos e o que está comendo Frango
  for i := 0 to 4 do
  begin
    if SameText(ListaIdade[i].Text, '51') then
    begin
      for j := 0 to 4 do
      begin
        if SameText(ListaComida[j].Text, 'Frango') then
        begin
          // Verificar se estão ao lado
          if Abs(i - j) = 1 then
          begin
            regra4.Checked := True;
            Exit;
          end;
        end;
      end;
    end;
  end;

  regra4.Checked := False;
end;

procedure TForm1.VerificarRegra5;
var
  ListaComida: array[0..4] of TComboBox;
begin
  ListaComida[0] := comida1;
  ListaComida[1] := comida2;
  ListaComida[2] := comida3;
  ListaComida[3] := comida4;
  ListaComida[4] := comida5;

  if (SameText(Trim(ListaComida[0].Text), 'sopa')) or
     (SameText(Trim(ListaComida[4].Text), 'sopa')) then
    regra5.Checked := True
  else
    regra5.Checked := False;
end;



procedure TForm1.VerificarRegra6;
var
  i: Integer;
  ListaCarros, ListaSuco, ListaGravatas, ListaComidas: array[0..4] of TComboBox;
begin
  // Atribuindo os ComboBoxes aos arrays para facilitar o acesso
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

  // Verificando a regra
  for i := 0 to 4 do
  begin
    // Verificando se o executivo tem gravata azul e está ao lado de quem pediu massa
    if SameText(ListaGravatas[i].Text, 'azul') then
    begin
      // Verifica se o executivo ao lado pediu "massa"
      if (i > 0) and SameText(ListaComidas[i-1].Text, 'massa') then
      begin
        regra6.Checked := True;
        Exit;
      end
      else if (i < 4) and SameText(ListaComidas[i+1].Text, 'massa') then
      begin
        regra6.Checked := True;
        Exit;
      end;
    end;
  end;

  // Se não encontrar a correspondência, desmarcar a regra
  regra6.Checked := False;
end;

procedure TForm1.VerificarRegra7;
var
  i: Integer;
  ListaIdades, ListaComidas: array[0..4] of TComboBox;
  MaisNovoIdx, ComendoSaladaIdx: Integer;
  Idade: Integer;
begin
  // Atribuindo os ComboBoxes às variáveis para facilitar o acesso
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

  MaisNovoIdx := -1;
  ComendoSaladaIdx := -1;

  // Encontrar o executivo mais novo e o executivo que está comendo salada
  for i := 0 to 4 do
  begin
    if SameText(ListaComidas[i].Text, 'salada') then
      ComendoSaladaIdx := i;

    // Verifica se a idade é válida antes de tentar converter
    if (ListaIdades[i].Text <> '') and TryStrToInt(ListaIdades[i].Text, Idade) then
    begin
      // Se for o primeiro executivo ou se a idade for menor que a idade do mais novo encontrado
      if (MaisNovoIdx = -1) or (Idade < StrToInt(ListaIdades[MaisNovoIdx].Text)) then
        MaisNovoIdx := i;
    end;
  end;

  // Verificar se o mais novo está à direita do que está comendo salada
  if (ComendoSaladaIdx >= 0) and (MaisNovoIdx = ComendoSaladaIdx + 1) then
    regra7.Checked := True
  else
    regra7.Checked := False;
end;


procedure TForm1.VerificarRegra8;
var
  i: Integer;
  ListaComidas, ListaGravatas: array[0..4] of TComboBox;
begin
  // Atribuindo os ComboBoxes para facilitar o acesso
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

  // Verifica se alguém que pediu Peixe está usando gravata Branca
  for i := 0 to 4 do
  begin
    if SameText(ListaComidas[i].Text, 'peixe') and SameText(ListaGravatas[i].Text, 'branca') then
    begin
      regra8.Checked := True;
      Exit;
    end;
  end;

  // Caso contrário, desmarcar a regra
  regra8.Checked := False;
end;


procedure TForm1.VerificarRegra9;
begin
  // Verificar se a pessoa na quarta posição está bebendo suco de Abacaxi
  if SameText(suco4.Text, 'abacaxi') then
  begin
    regra9.Checked := True;
  end
  else
  begin
    regra9.Checked := False;
  end;
end;


procedure TForm1.VerificarRegra10;
var
  idade: Integer;
begin
  // Tentar converter a idade para inteiro
  if TryStrToInt(idade1.Text, idade) and (idade = 51) and SameText(suco1.Text, 'laranja') or
     TryStrToInt(idade2.Text, idade) and (idade = 51) and SameText(suco2.Text, 'laranja') or
     TryStrToInt(idade3.Text, idade) and (idade = 51) and SameText(suco3.Text, 'laranja') or
     TryStrToInt(idade4.Text, idade) and (idade = 51) and SameText(suco4.Text, 'laranja') or
     TryStrToInt(idade5.Text, idade) and (idade = 51) and SameText(suco5.Text, 'laranja') then
  begin
    regra10.Checked := True;
  end
  else
  begin
    regra10.Checked := False;
  end;
end;



procedure TForm1.VerificarRegra11;
var
  i, idade: Integer;
begin
  // Verificar para cada executivo se tem a idade de 50 anos e está bebendo suco de Maracujá
  if TryStrToInt(idade1.Text, idade) and (idade = 50) and SameText(suco1.Text, 'maracujá') then
    regra11.Checked := True
  else if TryStrToInt(idade2.Text, idade) and (idade = 50) and SameText(suco2.Text, 'maracujá') then
    regra11.Checked := True
  else if TryStrToInt(idade3.Text, idade) and (idade = 50) and SameText(suco3.Text, 'maracujá') then
    regra11.Checked := True
  else if TryStrToInt(idade4.Text, idade) and (idade = 50) and SameText(suco4.Text, 'maracujá') then
    regra11.Checked := True
  else if TryStrToInt(idade5.Text, idade) and (idade = 50) and SameText(suco5.Text, 'maracujá') then
    regra11.Checked := True
  else
    regra11.Checked := False;
end;

procedure TForm1.VerificarRegra12;
begin
  // Verificar se o carro na primeira posição é "Hatch"
  if SameText(Carro1.Text, 'hatch') then
    regra12.Checked := True
  else
    regra12.Checked := False;
end;


procedure TForm1.VerificarRegra13;
begin
  // Verificar se o suco na primeira posição é "limonada"
  if SameText(suco1.Text, 'limão') then
    regra13.Checked := True
  else
    regra13.Checked := False;
end;


procedure TForm1.VerificarRegra14;
begin
  // Verificar se o Italiano está na primeira ou última posição
  if (SameText(Nacionalidade1.Text, 'Italiano')) or (SameText(Nacionalidade5.Text, 'Italiano')) then
    regra14.Checked := True
  else
    regra14.Checked := False;
end;


procedure TForm1.VerificarRegra15;
begin
  // Verificar se o Alemão está na terceira posição
  if SameText(Nacionalidade3.Text, 'Alemão') then
    regra15.Checked := True
  else
    regra15.Checked := False;
end;


procedure TForm1.VerificarRegra16;
var
  i, posIngles, posAmarela: Integer;
  ListaGravatas, ListaNacionalidades: array[0..4] of TComboBox;
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

  for i := 0 to 4 do
  begin
    if SameText(ListaNacionalidades[i].Text, 'inglês') then
      posIngles := i;
    if SameText(ListaGravatas[i].Text, 'amarelo') then
      posAmarela := i;
  end;

  if (posIngles <> -1) and (posAmarela <> -1) and (posIngles > posAmarela) then
    regra16.Checked := True
  else
    regra16.Checked := False;
end;


procedure TForm1.VerificarRegra17;
begin
  // Verifica se o Sueco está na primeira posição
  if SameText(Nacionalidade1.Text, 'Sueco') then
    regra17.Checked := True
  else
    regra17.Checked := False;
end;



procedure TForm1.VerificarRegra18;
begin
  if SameText(Gravata_cor1.Text, 'Branca') or SameText(Gravata_cor5.Text, 'Branca') then
    regra18.Checked := True
  else
    regra18.Checked := False;
end;


procedure TForm1.VerificarRegra19;
begin
  if SameText(Gravata_cor3.Text, 'Azul') then
    regra19.Checked := True
  else
    regra19.Checked := False;
end;


procedure TForm1.VerificarRegra20;
var
  i: Integer;
  ListaGravatas, ListaSuco: array[0..4] of TComboBox;
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

  for i := 0 to 4 do
  begin
    if SameText(ListaGravatas[i].Text, 'Verde') and SameText(ListaSuco[i].Text, 'Laranja') then
    begin
      regra20.Checked := True;
      Exit;
    end;
  end;
  regra20.Checked := False;
end;


procedure TForm1.VerificarRegra21;
var
  i, posBranca, posVerde: Integer;
  ListaGravatas: array[0..4] of TComboBox;
begin
  ListaGravatas[0] := gravata_cor1;
  ListaGravatas[1] := gravata_cor2;
  ListaGravatas[2] := gravata_cor3;
  ListaGravatas[3] := gravata_cor4;
  ListaGravatas[4] := gravata_cor5;

  posBranca := -1;
  posVerde := -1;

  for i := 0 to 4 do
  begin
    if SameText(ListaGravatas[i].Text, 'branca') then
      posBranca := i;
    if SameText(ListaGravatas[i].Text, 'verde') then
      posVerde := i;
  end;

  if (posBranca <> -1) and (posVerde <> -1) and (posBranca < posVerde) then
    regra21.Checked := True
  else
    regra21.Checked := False;
end;


procedure TForm1.VerificarRegra22;
var
  i, posMaisVelho: Integer;
  ListaCarros: array[0..4] of TComboBox;
  ListaIdades: array[0..4] of TComboBox;
  maiorIdade, idadeAtual: Integer;
begin
  ListaCarros[0] := Carro1;
  ListaCarros[1] := Carro2;
  ListaCarros[2] := Carro3;
  ListaCarros[3] := Carro4;
  ListaCarros[4] := Carro5;

  ListaIdades[0] := idade1;
  ListaIdades[1] := idade2;
  ListaIdades[2] := idade3;
  ListaIdades[3] := idade4;
  ListaIdades[4] := idade5;

  // Encontrar a posição do executivo mais velho
  maiorIdade := -1;
  posMaisVelho := -1;

  for i := 0 to 4 do
  begin
    if TryStrToInt(ListaIdades[i].Text, idadeAtual) then
    begin
      if idadeAtual > maiorIdade then
      begin
        maiorIdade := idadeAtual;
        posMaisVelho := i;
      end;
    end;
  end;

  // Verifica se há um executivo com Pickup imediatamente à esquerda do mais velho
  if (posMaisVelho > 0) and SameText(ListaCarros[posMaisVelho - 1].Text, 'pickup') then
    regra22.Checked := True
  else
    regra22.Checked := False;
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

