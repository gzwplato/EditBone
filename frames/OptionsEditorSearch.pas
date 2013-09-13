unit OptionsEditorSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls;

type
  TEditorSearchFrame = class(TFrame)
    Panel: TPanel;
    ShowSearchStringNotFoundCheckBox: TBCCheckBox;
    BeepIfSearchStringNotFoundCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
