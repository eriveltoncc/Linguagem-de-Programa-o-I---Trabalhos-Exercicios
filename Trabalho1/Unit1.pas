unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.ExtCtrls,System.StrUtils,System.RegularExpressions,DateUtils;

type
  TForm1 = class(TForm)
    Usuario: TStaticText;
    Cadastro_Usuario: TButton;
    Data_Aniversario: TDateTimePicker;
    Telefone: TStaticText;
    Senha1: TEdit;
    Senha: TStaticText;
    email: TEdit;
    Aniversario: TStaticText;
    email1: TStaticText;
    Cadastro: TPanel;
    Cadastro_User: TStaticText;
    Panel1: TPanel;
    Tipo_usuario: TStaticText;
    Administrador: TCheckBox;
    Normal: TCheckBox;
    Lista_Cad_Usuario: TStringGrid;
    Numero_Tel: TMaskEdit;
    Nome: TEdit;
    Editar: TButton;
    Excluir: TButton;
    Confirma_Senha: TStaticText;
    Confirmar_Senhas: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Cadastro_UsuarioClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure AdministradorClick(Sender: TObject);
    procedure NormalClick(Sender: TObject);
  private
    FCodigo: Integer;
    FLinha: Integer;
    EmEdicao: Boolean; // Variável para controle de edição
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AdministradorClick(Sender: TObject);
begin
  // Se "Administrador" for marcado, desmarque "Normal"
  if Administrador.Checked then
    Normal.Checked := False;
end;

procedure TForm1.Cadastro_UsuarioClick(Sender: TObject);
var
  EmailRegex, TelefoneRegex: TRegEx;
  TelefoneTexto: string;
  DataNascimento: TDate;
  Idade: Integer;
  i: Integer;
begin
  // Validação dos campos obrigatórios
  if Trim(Nome.Text) = '' then
  begin
    MessageDlg('O campo Nome Usuario é obrigatório.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Trim(email.Text) = '' then
  begin
    MessageDlg('O campo E-mail é obrigatório.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Validação da estrutura do e-mail
  EmailRegex := TRegEx.Create('^[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,}$');
  if not EmailRegex.IsMatch(email.Text) then
  begin
    MessageDlg('E-mail inválido. Insira um e-mail válido.', mtError, [mbOK], 0);
    Exit;
  end;

  TelefoneTexto := Trim(Numero_Tel.Text);
  TelefoneTexto := StringReplace(TelefoneTexto, '.', '', [rfReplaceAll]); // Remove ponto final

  TelefoneRegex := TRegEx.Create('^\(\d{2}\) \d{5}-\d{4}$');
  if not TelefoneRegex.IsMatch(TelefoneTexto) then
begin
  MessageDlg('O telefone deve estar no formato (XX)XXXXX-XXXX.', mtError, [mbOK], 0);
  Exit;
end;

  // Validação de idade mínima (18 anos)
  DataNascimento := Data_Aniversario.Date;
  Idade := YearsBetween(Date, DataNascimento); // Calcula a diferença de anos

  if Idade < 18 then
  begin
    MessageDlg('Você deve ter pelo menos 18 anos para se cadastrar.', mtError, [mbOK], 0);
    Exit;
  end;

  // Validação de senha e confirmação de senha
  if Trim(Senha1.Text) = '' then
  begin
    MessageDlg('O campo Senha é obrigatório.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Trim(Confirmar_Senhas.Text) = '' then
  begin
    MessageDlg('O campo Confirmar Senha é obrigatório.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if Senha1.Text <> Confirmar_Senhas.Text then
  begin
    MessageDlg('As senhas não conferem. Digite novamente.', mtError, [mbOK], 0);
    Exit;
  end;

  if not (Administrador.Checked or Normal.Checked) then
  begin
    MessageDlg('É obrigatório marcar Administrador ou Normal.', mtWarning, [mbOK], 0);
    Exit;
  end;

   // Se estiver em modo de edição, atualiza o registro existente
  if EmEdicao then
  begin
    Lista_Cad_Usuario.Cells[1, FLinha] := Nome.Text;
    Lista_Cad_Usuario.Cells[2, FLinha] := email.Text;
    Lista_Cad_Usuario.Cells[3, FLinha] := Numero_Tel.Text;
    Lista_Cad_Usuario.Cells[4, FLinha] := DateToStr(Data_Aniversario.Date);
    Lista_Cad_Usuario.Cells[5, FLinha] := IfThen(Administrador.Checked, 'Administrador', 'Normal');

    // Mensagem de sucesso
    MessageDlg('Registro atualizado com sucesso!', mtInformation, [mbOK], 0);

    EmEdicao := False; // Resetar a variável para não editar mais
    Cadastro_Usuario.Caption := 'Cadastrar'; // Volta ao nome original do botão

  end
  else

 // Procurar pela primeira linha vazia para adicionar o novo usuário
  for i := 1 to Lista_Cad_Usuario.RowCount - 1 do
  begin
    if Lista_Cad_Usuario.Cells[0, i] = '' then
    begin
      FLinha := i;
      Break;
    end;
  end;

  // Caso não encontre uma linha vazia, cria uma nova linha
  if FLinha = 0 then
  begin
    FLinha := Lista_Cad_Usuario.RowCount;
    Lista_Cad_Usuario.RowCount := Lista_Cad_Usuario.RowCount + 1; // Adiciona uma nova linha
  end;

  Lista_Cad_Usuario.Cells[0, FLinha] := FCodigo.ToString;
  Lista_Cad_Usuario.Cells[1, FLinha] := Nome.Text;
  Lista_Cad_Usuario.Cells[2, FLinha] := email.Text;
  Lista_Cad_Usuario.Cells[3, FLinha] := Numero_Tel.Text;
  Lista_Cad_Usuario.Cells[4, FLinha] := DateToStr(Data_Aniversario.Date);
  Lista_Cad_Usuario.Cells[5, FLinha] := IfThen(Administrador.Checked, 'Administrador', 'Normal');

  // Atualiza o código para o próximo número para o próximo cadastro
  Inc(FCodigo);

  // Mensagem de sucesso
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);


  // Limpa os campos para um novo registro
  Nome.Clear;
  email.Clear;
  Numero_Tel.Clear;
  Data_Aniversario.Date := Date;
  Senha1.Clear;
  Confirmar_Senhas.Clear;
  Administrador.Checked := False;
  Normal.Checked := False;
end;

procedure TForm1.EditarClick(Sender: TObject);
begin
  if Lista_Cad_Usuario.Row > 0 then
  begin
    FLinha := Lista_Cad_Usuario.Row;

    Nome.Text := Lista_Cad_Usuario.Cells[1, FLinha];
    Numero_Tel.Text := Lista_Cad_Usuario.Cells[3, FLinha];
    email.Text := Lista_Cad_Usuario.Cells[2, FLinha];
    Data_Aniversario.Date := StrToDate(Lista_Cad_Usuario.Cells[4, FLinha]);

    if Lista_Cad_Usuario.Cells[5, FLinha] = 'Administrador' then
    begin
      Administrador.Checked := True;
      Normal.Checked := False;
    end
    else if Lista_Cad_Usuario.Cells[5, FLinha] = 'Normal' then
    begin
      Administrador.Checked := False;
      Normal.Checked := True;
    end;

    // Modo de edição ativado
    EmEdicao := True;
    Cadastro_Usuario.Caption := 'Salvar'; // Altera o nome do botão para "Salvar"
  end
  else
    MessageDlg('Selecione um registro para editar.', mtWarning, [mbOK], 0);
end;

procedure TForm1.ExcluirClick(Sender: TObject);
var
  i: Integer;
begin
  if Lista_Cad_Usuario.Row > 0 then
  begin
    // Exclui o registro
    Lista_Cad_Usuario.Rows[Lista_Cad_Usuario.Row].Clear;

    // Move as linhas abaixo para cima
    for i := Lista_Cad_Usuario.Row to Lista_Cad_Usuario.RowCount - 2 do
    begin
      Lista_Cad_Usuario.Cells[0, i] := Lista_Cad_Usuario.Cells[0, i + 1];
      Lista_Cad_Usuario.Cells[1, i] := Lista_Cad_Usuario.Cells[1, i + 1];
      Lista_Cad_Usuario.Cells[2, i] := Lista_Cad_Usuario.Cells[2, i + 1];
      Lista_Cad_Usuario.Cells[3, i] := Lista_Cad_Usuario.Cells[3, i + 1];
      Lista_Cad_Usuario.Cells[4, i] := Lista_Cad_Usuario.Cells[4, i + 1];
      Lista_Cad_Usuario.Cells[5, i] := Lista_Cad_Usuario.Cells[5, i + 1];
      Lista_Cad_Usuario.Cells[6, i] := Lista_Cad_Usuario.Cells[6, i + 1];
    end;

    // Limpa a última linha
    Lista_Cad_Usuario.Rows[Lista_Cad_Usuario.RowCount - 1].Clear;

    // Atualiza a contagem de linhas
    Lista_Cad_Usuario.RowCount := Lista_Cad_Usuario.RowCount - 1;

    MessageDlg('Registro excluído com sucesso!', mtInformation, [mbOK], 0);
  end
  else
    MessageDlg('Selecione um registro para excluir.', mtWarning, [mbOK], 0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCodigo := 0;
  FLinha := 0;
  Lista_Cad_Usuario.Cells[0,0] := 'Codigo';
  Lista_Cad_Usuario.Cells[1,0] := 'Usuario';
  Lista_Cad_Usuario.Cells[2,0] := 'E-mail';
  Lista_Cad_Usuario.Cells[3,0] := 'Telefone';
  Lista_Cad_Usuario.Cells[4,0] := 'Aniversario';
  Lista_Cad_Usuario.Cells[5,0] := 'Tipo Usuario';
  Fcodigo := 0;
end;

procedure TForm1.NormalClick(Sender: TObject);
begin
  // Se "Normal" for marcado, desmarque "Administrador"
  if Normal.Checked then
    Administrador.Checked := False;
end;

end.
