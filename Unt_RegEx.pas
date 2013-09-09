{
  José Mário Silva Guedes
  jmarioguedes@gmail.com
  http://eugostododelphi.blogspot.com
  Junho/2012
}

unit Unt_RegEx;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.CheckLst,
  RegularExpressions,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TfRegEx = class(TForm)
    Panel1: TPanel;
    clbModificador: TCheckListBox;
    mTexto: TMemo;
    Splitter1: TSplitter;
    mRegEx: TMemo;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    mResultado: TMemo;
    Splitter3: TSplitter;
    Panel4: TPanel;
    Label1: TLabel;
    stQuantidade: TStaticText;
    tvResultado: TTreeView;
    bProcessar: TButton;
    bReplace: TButton;
    mReplace: TMemo;
    Splitter4: TSplitter;
    procedure bProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvResultadoChange(Sender: TObject; Node: TTreeNode);
    procedure Label1Click(Sender: TObject);
    procedure bReplaceClick(Sender: TObject);
  private
    function ObterModificadores: TRegExOptions;
    function ObterRegex: string;
  public
    { Public declarations }
  end;

var
  fRegEx: TfRegEx;

implementation

uses
  TypInfo,
  Diagnostics,
  ShellApi;

{$R *.dfm}

procedure TfRegEx.bProcessarClick(Sender: TObject);
var
  _Matches: RegularExpressions.TMatchCollection; // Coleção de combinações
  _Matche : RegularExpressions.TMatch; // Uma combinação
  _Group  : RegularExpressions.TGroup; // Um grupo

  oNode         : TTreeNode; // Nó da treeview com as informações de uma combinação
  oNodeGrupo    : TTreeNode; // Nó da treeview criando o nó de grupos
  oNodeItemGrupo: TTreeNode; // Nó do treeviwe criando um grupo

  _cronus: Diagnostics.TStopwatch; // Cronômetro para medição do tempo
begin
  Screen.Cursor := crHourGlass;
  try
    Self.tvResultado.Items.Clear;
    Self.mResultado.Clear;

{$REGION 'Fazendo a pesquisa'}
    _cronus := TStopwatch.StartNew;
    _Matches := TRegEx.Matches(mTexto.Text, Self.ObterRegex, Self.ObterModificadores);
    _cronus.Stop;

{$ENDREGION}
{$REGION 'Registrando o tempo de processamento'}
    if (_cronus.ElapsedMilliseconds = 0) then
    begin
      StatusBar1.Panels[1].Text := Format('Tempo de processamento: [%d] Ticks', [_cronus.ElapsedTicks]);
    end else begin
      StatusBar1.Panels[1].Text := Format('Tempo de processamento: [%d] Milisegundos - %d Ticks', [_cronus.ElapsedMilliseconds, _cronus.ElapsedTicks]);
    end;

{$ENDREGION}
{$REGION 'Analisando as combinações'}
    Self.stQuantidade.Caption := Format('Quantidade: [%d]', [_Matches.Count]);
    if (_Matches.Count > 0) then
    begin
      for _Matche in _Matches do
      begin
        oNode := tvResultado.Items.Add(nil, _Matche.Value);
        tvResultado.Items.AddChild(oNode, Format('Posição: %d', [_Matche.Index]));
        tvResultado.Items.AddChild(oNode, Format('Tamanho: %d', [_Matche.Length]));

{$REGION 'Analisando os grupos'}
        if (_Matche.Groups.Count > 0) then
        begin
          oNodeGrupo := tvResultado.Items.AddChild(oNode, 'Agrupamentos');
          for _Group in _Matche.Groups do
          begin
            oNodeItemGrupo := tvResultado.Items.AddChild(oNodeGrupo, _Group.Value);
            tvResultado.Items.AddChild(oNodeItemGrupo, Format('Posição: %d', [_Group.Index]));
            tvResultado.Items.AddChild(oNodeItemGrupo, Format('Tamanho: %d', [_Group.Length]));
          end;
        end;

{$ENDREGION}
      end;
    end;

{$ENDREGION}
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfRegEx.bReplaceClick(Sender: TObject);
begin
  Self.mTexto.Text := TRegEx.Replace(Self.mTexto.Text, Self.mRegEx.Text, mReplace.Text, Self.ObterModificadores);
end;

procedure TfRegEx.FormCreate(Sender: TObject);
var
  eModificador: RegularExpressions.TRegExOption;
  sModificador: string;
begin
  // Varremos toda a coleção de modificadores
  for eModificador := low(TRegExOption) to high(TRegExOption) do
  begin
    // Transformamos o tipo enumerado para string
    sModificador := TypInfo.GetEnumName(TypeInfo(TRegExOption), Ord(eModificador));
    // Adicionamos a opção ao CheckListBox
    Self.clbModificador.AddItem(sModificador, nil);
  end;
end;

procedure TfRegEx.Label1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Self.Label1.Caption), nil, nil, SW_SHOWNORMAL);
end;

function TfRegEx.ObterModificadores: TRegExOptions;
var
  sModificador: string;
  eModificador: RegularExpressions.TRegExOption;
  i           : Integer;
begin
  // Iniciamos o Result como um conjunto vazio
  Result := [];
  // Varremos todos os itens do CheckListBox
  for i := 0 to Pred(Self.clbModificador.Count) do
  begin
    // Verificamos se a opção está marcada
    if (Self.clbModificador.Checked[i]) then
    begin
      // Gravamos a opção em um string auxiliar
      sModificador := Self.clbModificador.Items[i];
      // Transformamos a string para o tipo enumerado
      eModificador := TRegExOption(TypInfo.GetEnumValue(TypeInfo(TRegExOption), sModificador));
      // Incluímos o resultado no conjunto
      Include(Result, eModificador);
    end;
  end;
end;

function TfRegEx.ObterRegex: string;
var
  sOpcao        : string;
  iItem         : Integer;
  bPrimeiraLinha: Boolean;
begin
  sOpcao := GetEnumName(TypeInfo(TRegExOption), Ord(roIgnorePatternSpace));
  iItem := Self.clbModificador.Items.IndexOf(sOpcao);
  bPrimeiraLinha := not(Self.clbModificador.Checked[iItem]);
  if (bPrimeiraLinha) then
  begin
    Result := Self.mRegEx.Lines[0];
  end else begin
    Result := Self.mRegEx.Text;
  end;
end;

procedure TfRegEx.tvResultadoChange(Sender: TObject; Node: TTreeNode);
begin
  if (Node.Level in [0, 2]) then
  begin
    Self.mResultado.Text := Node.Text;
  end;
end;

end.
