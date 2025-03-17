program Exercicio14;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TProduto = record
    Codigo: Integer;
    Descricao: string[100];
    Preco: Real;
  end;

var
  Produtos: array of TProduto;
  Opcao, i, CodigoBusca, QuantidadeProdutos: Integer;
  ProdutoNovo: TProduto;
  ProdutoEncontrado: Boolean;

procedure CadastrarProduto;
begin
  Write('Informe o c�digo do produto: ');
  ReadLn(ProdutoNovo.Codigo);


  for i := 0 to High(Produtos) do
  begin
    if Produtos[i].Codigo = ProdutoNovo.Codigo then
    begin
      Writeln('Erro: J� existe um produto com esse c�digo.');
      Exit;
    end;
  end;


  Write('Informe a descri��o do produto: ');
  ReadLn(ProdutoNovo.Descricao);
  Write('Informe o pre�o do produto: R$ ');
  ReadLn(ProdutoNovo.Preco);


  SetLength(Produtos, Length(Produtos) + 1);
  Produtos[High(Produtos)] := ProdutoNovo;
  Writeln('Produto cadastrado com sucesso!');
end;

procedure ListarProdutos;
begin
  if Length(Produtos) = 0 then
  begin
    Writeln('Nenhum produto cadastrado.');
  end
  else
  begin
    Writeln('Lista de Produtos:');
    for i := 0 to High(Produtos) do
    begin
      Writeln('C�digo: ', Produtos[i].Codigo);
      Writeln('Descri��o: ', Produtos[i].Descricao);
      Writeln('Pre�o: R$ ', FormatFloat('0.00', Produtos[i].Preco));
      Writeln('---');
    end;
  end;
end;

procedure PesquisarProduto;
begin
  Write('Informe o c�digo do produto a ser pesquisado: ');
  ReadLn(CodigoBusca);
  ProdutoEncontrado := False;

  for i := 0 to High(Produtos) do
  begin
    if Produtos[i].Codigo = CodigoBusca then
    begin
      Writeln('Produto encontrado!');
      Writeln('C�digo: ', Produtos[i].Codigo);
      Writeln('Descri��o: ', Produtos[i].Descricao);
      Writeln('Pre�o: R$ ', FormatFloat('0.00', Produtos[i].Preco));
      ProdutoEncontrado := True;
      Break;
    end;
  end;

  if not ProdutoEncontrado then
    Writeln('Produto n�o encontrado.');
end;

procedure ExcluirProduto;
begin
  Write('Informe o c�digo do produto a ser exclu�do: ');
  ReadLn(CodigoBusca);
  ProdutoEncontrado := False;

  for i := 0 to High(Produtos) do
  begin
    if Produtos[i].Codigo = CodigoBusca then
    begin
      // Excluir o produto
      for i := i to High(Produtos)-1 do
      begin
        Produtos[i] := Produtos[i+1];
      end;
      SetLength(Produtos, Length(Produtos) - 1);
      Writeln('Produto exclu�do com sucesso.');
      ProdutoEncontrado := True;
      Break;
    end;
  end;

  if not ProdutoEncontrado then
    Writeln('Produto n�o encontrado.');
end;

begin
  QuantidadeProdutos := 0;

  repeat
    // Exibe o menu
    Writeln('Menu:');
    Writeln('1 - Cadastrar um novo produto');
    Writeln('2 - Listar produtos cadastrados');
    Writeln('3 - Pesquisar produto pelo c�digo');
    Writeln('4 - Excluir um produto');
    Writeln('5 - Sair do sistema');
    Write('Escolha uma op��o: ');
    ReadLn(Opcao);

    case Opcao of
      1: CadastrarProduto;
      2: ListarProdutos;
      3: PesquisarProduto;
      4: ExcluirProduto;
      5: Writeln('Saindo do sistema...');
    else
      Writeln('Op��o inv�lida. Tente novamente.');
    end;

    Writeln;
  until Opcao = 5;

  ReadLn;
end.

