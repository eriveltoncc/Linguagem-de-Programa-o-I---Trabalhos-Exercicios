unit ExercicioImagem1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.CheckLst, Vcl.Imaging.jpeg, Vcl.WinXCtrls, Vcl.ComCtrls, RxCombos,
  Vcl.ActnMan, Vcl.ActnColorMaps, Vcl.Samples.Spin, Vcl.FileCtrl;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox: TComboBox;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Memo: TMemo;
    Button1: TButton;
    CheckListBox1: TCheckListBox;
    LabeledEdit: TLabeledEdit;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    ColorListBox1: TColorListBox;
    ToggleSwitch1: TToggleSwitch;
    ColorBox1: TColorBox;
    SpinEdit1: TSpinEdit;
    MonthCalendar1: TMonthCalendar;
    DateTimePicker1: TDateTimePicker;
    DriveComboBox1: TDriveComboBox;
    GroupBox: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    RichEdit: TRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
