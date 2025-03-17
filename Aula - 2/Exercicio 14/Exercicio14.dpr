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
  Write('Informe o código do produto: ');
  ReadLn(ProdutoNovo.Codigo);


  for i := 0 to High(Produtos) do
  begin
    if Produtos[i].Codigo = ProdutoNovo.Codigo then
    begin
      Writeln('Erro: Já existe um produto com esse código.');
      Exit;
    end;
  end;


  Write('Informe a descrição do produto: ');
  ReadLn(ProdutoNovo.Descricao);
  Write('Informe o preço do produto: R$ ');
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
      Writeln('Código: ', Produtos[i].Codigo);
      Writeln('Descrição: ', Produtos[i].Descricao);
      Writeln('Preço: R$ ', FormatFloat('0.00', Produtos[i].Preco));
      Writeln('---');
    end;
  end;
end;

procedure PesquisarProduto;
begin
  Write('Informe o código do produto a ser pesquisado: ');
  ReadLn(CodigoBusca);
  ProdutoEncontrado := False;

  for i := 0 to High(Produtos) do
  begin
    if Produtos[i].Codigo = CodigoBusca then
    begin
      Writeln('Produto encontrado!');
      Writeln('Código: ', Produtos[i].Codigo);
      Writeln('Descrição: ', Produtos[i].Descricao);
      Writeln('Preço: R$ ', FormatFloat('0.00', Produtos[i].Preco));
      ProdutoEncontrado := True;
      Break;
    end;
  end;

  if not ProdutoEncontrado then
    Writeln('Produto não encontrado.');
end;

procedure ExcluirProduto;
begin
  Write('Informe o código do produto a ser excluído: ');
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
      Writeln('Produto excluído com sucesso.');
      ProdutoEncontrado := True;
      Break;
    end;
  end;

  if not ProdutoEncontrado then
    Writeln('Produto não encontrado.');
end;

begin
  QuantidadeProdutos := 0;

  repeat
    // Exibe o menu
    Writeln('Menu:');
    Writeln('1 - Cadastrar um novo produto');
    Writeln('2 - Listar produtos cadastrados');
    Writeln('3 - Pesquisar produto pelo código');
    Writeln('4 - Excluir um produto');
    Writeln('5 - Sair do sistema');
    Write('Escolha uma opção: ');
    ReadLn(Opcao);

    case Opcao of
      1: CadastrarProduto;
      2: ListarProdutos;
      3: PesquisarProduto;
      4: ExcluirProduto;
      5: Writeln('Saindo do sistema...');
    else
      Writeln('Opção inválida. Tente novamente.');
    end;

    Writeln;
  until Opcao = 5;

  ReadLn;
end.

