unit Document;

interface

uses
  Winapi.Windows, Winapi.CommDlg, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, SynEdit,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList, JvExComCtrls, JvComCtrls, Vcl.Menus, BCControls.PageControl, Vcl.Buttons,
  SynEditPrint, SynEditMiscClasses, SynEditSearch, SynEditTypes, SynEditPlugins, Vcl.StdCtrls,
  Vcl.ActnList, BCControls.CheckBox, System.Actions, BCControls.ProgressBar,
  BCControls.ImageList, Vcl.ActnPopup, BCControls.PopupMenu, SynMacroRecorder, SynEditKeyCmds, Vcl.Themes,
  SynEditRegexSearch, BCControls.SynEdit, DocumentTabSheet, BCFrames.Compare, Vcl.PlatformDefaultStyleActnCtrls,
  SynHighlighterPas, SynHighlighterCobol, SynHighlighterWebData, SynHighlighterTeX,
  SynHighlighterProgress, SynHighlighterPerl, SynHighlighterKix, SynHighlighterJScript, SynHighlighterGalaxy,
  SynHighlighterFoxpro, SynHighlighterWeb, SynHighlighterCache, SynHighlighterDml, SynHighlighterGWS, SynHighlighterIDL,
  SynHighlighterCPM, SynHighlighterHaskell, SynHighlighterHP48, SynHighlighterDOT, SynHighlighterADSP21xx,
  SynHighlighterLDraw, SynHighlighterModelica, SynHighlighterM3, SynHighlighterMsg, SynHighlighterBat,
  SynHighlighterSQL, SynHighlighterSDD, SynHighlighterRuby, SynHighlighterRC, SynHighlighterPython,
  SynHighlighterUNIXShellScript, SynHighlighterVB, SynHighlighterVBScript, SynHighlighterVrml97, SynHighlighterAsm,
  SynHighlighterSml, SynHighlighterST, SynHighlighterTclTk, SynHighlighterJava, SynHighlighterInno, SynHighlighterIni,
  SynHighlighterDWS, SynHighlighterEiffel, SynHighlighterFortran, SynHighlighterCAC, SynHighlighterCpp,
  SynHighlighterCS, SynHighlighterBaan, SynHighlighterAWK, SynEditHighlighter, SynHighlighterHC11,
  SynHighlighterYAML, SynHighlighterWebIDL, SynHighlighterLLVM, SynEditWildcardSearch;

type
  TDocumentFrame = class(TFrame)
    BookmarkImagesList: TBCImageList;
    CaseSensitiveCheckBox: TBCCheckBox;
    CaseSensitiveLabel: TLabel;
    ClassicCppSyn: TSynCppSyn;
    ClassicCSSyn: TSynCSSyn;
    ClassicPasSyn: TSynPasSyn;
    ClearBookmarksMenuItem: TMenuItem;
    CopyMenuItem: TMenuItem;
    CutMenuItem: TMenuItem;
    DecreaseIndentMenuItem: TMenuItem;
    DefaultCppSyn: TSynCppSyn;
    DefaultCSSyn: TSynCSSyn;
    DefaultPasSyn: TSynPasSyn;
    DeleteEOLMenuItem: TMenuItem;
    DeleteLineMenuItem: TMenuItem;
    DeleteWordMenuItem: TMenuItem;
    DocumentPanel: TPanel;
    EditorPopupMenu: TBCPopupMenu;
    FormatXMLMenuItem: TMenuItem;
    GotoBookmark1MenuItem: TMenuItem;
    GotoBookmark2MenuItem: TMenuItem;
    GotoBookmark3MenuItem: TMenuItem;
    GotoBookmark4MenuItem: TMenuItem;
    GotoBookmark5MenuItem: TMenuItem;
    GotoBookmark6MenuItem: TMenuItem;
    GotoBookmark7MenuItem: TMenuItem;
    GotoBookmark8MenuItem: TMenuItem;
    GotoBookmark9MenuItem: TMenuItem;
    GotoBookmarksMenuItem: TMenuItem;
    ImageList16: TBCImageList;
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    IncreaseIndentMenuItem: TMenuItem;
    InsertLineMenuItem: TMenuItem;
    SearchCloseSpeedButton: TSpeedButton;
    PageControl: TBCPageControl;
    AfterCaseSensitivePanel: TPanel;
    AfterWholeWordsOnlyPanel: TPanel;
    PasteMenuItem: TMenuItem;
    RedoMenuItem: TMenuItem;
    XMLRefreshMenuItem: TMenuItem;
    RegularExpressionCheckBox: TBCCheckBox;
    RegularExpressionLabel: TLabel;
    RemoveWhiteSpaceMenuItem: TMenuItem;
    SearchActionList: TActionList;
    SearchCloseAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    SearchForEdit: TButtonedEdit;
    SearchForLabel: TLabel;
    SearchPanel: TPanel;
    SearchPanel1: TPanel;
    SearchPanel2: TPanel;
    SearchPanel3: TPanel;
    SearchPanel5: TPanel;
    SearchPanel6: TPanel;
    SearchPanel7: TPanel;
    SearchPanel8: TPanel;
    SelectAllMenuItem: TMenuItem;
    Separator1MenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    Separator4MenuItem: TMenuItem;
    Separator6MenuItem: TMenuItem;
    SortAscendingMenuItem: TMenuItem;
    SortDescendingMenuItem: TMenuItem;
    SearchFindNextSpeedButton: TSpeedButton;
    SearchFindPreviousSpeedButton: TSpeedButton;
    SynADSP21xxSyn: TSynADSP21xxSyn;
    SynAsmSyn: TSynAsmSyn;
    SynAWKSyn: TSynAWKSyn;
    SynBaanSyn: TSynBaanSyn;
    SynBatSyn: TSynBatSyn;
    SynCacheSyn: TSynCacheSyn;
    SynCACSyn: TSynCACSyn;
    SynCobolSyn: TSynCobolSyn;
    SynCPMSyn: TSynCPMSyn;
    SynDmlSyn: TSynDmlSyn;
    SynDOTSyn: TSynDOTSyn;
    SynEditPrint: TSynEditPrint;
    SynEditRegexSearch: TSynEditRegexSearch;
    SynEditSearch: TSynEditSearch;
    SynEiffelSyn: TSynEiffelSyn;
    SynFortranSyn: TSynFortranSyn;
    SynFoxproSyn: TSynFoxproSyn;
    SynGalaxySyn: TSynGalaxySyn;
    SynGWScriptSyn: TSynGWScriptSyn;
    SynHaskellSyn: TSynHaskellSyn;
    SynHC11Syn: TSynHC11Syn;
    SynHP48Syn: TSynHP48Syn;
    SynIdlSyn: TSynIdlSyn;
    SynIniSyn: TSynIniSyn;
    SynInnoSyn: TSynInnoSyn;
    SynJavaSyn: TSynJavaSyn;
    SynJScriptSyn: TSynJScriptSyn;
    SynKixSyn: TSynKixSyn;
    SynLDRSyn: TSynLDRSyn;
    SynM3Syn: TSynM3Syn;
    SynMacroRecorder: TSynMacroRecorder;
    SynModelicaSyn: TSynModelicaSyn;
    SynMsgSyn: TSynMsgSyn;
    SynPerlSyn: TSynPerlSyn;
    SynProgressSyn: TSynProgressSyn;
    SynPythonSyn: TSynPythonSyn;
    SynRCSyn: TSynRCSyn;
    SynRubySyn: TSynRubySyn;
    SynSDDSyn: TSynSDDSyn;
    SynSMLSyn: TSynSMLSyn;
    SynSQLSyn: TSynSQLSyn;
    SynSTSyn: TSynSTSyn;
    SynTclTkSyn: TSynTclTkSyn;
    SynTeXSyn: TSynTeXSyn;
    SynUNIXShellScriptSyn: TSynUNIXShellScriptSyn;
    SynVBScriptSyn: TSynVBScriptSyn;
    SynVBSyn: TSynVBSyn;
    SynWebCssSyn: TSynWebCssSyn;
    SynWebEngine: TSynWebEngine;
    SynWebHtmlSyn: TSynWebHtmlSyn;
    SynWebXmlSyn: TSynWebXmlSyn;
    SynVrml97Syn: TSynVrml97Syn;
    ToggleBookmark1MenuItem: TMenuItem;
    ToggleBookmark2MenuItem: TMenuItem;
    ToggleBookmark3MenuItem: TMenuItem;
    ToggleBookmark4MenuItem: TMenuItem;
    ToggleBookmark5MenuItem: TMenuItem;
    ToggleBookmark6MenuItem: TMenuItem;
    ToggleBookmark7MenuItem: TMenuItem;
    ToggleBookmark8MenuItem: TMenuItem;
    ToggleBookmark9MenuItem: TMenuItem;
    ToggleBookmarkMenuItem: TMenuItem;
    ToggleBookmarksMenuItem: TMenuItem;
    ToggleCaseMenuItem: TMenuItem;
    TwilightCppSyn: TSynCppSyn;
    TwilightCSSyn: TSynCSSyn;
    TwilightPasSyn: TSynPasSyn;
    UndoMenuItem: TMenuItem;
    WholeWordsCheckBox: TBCCheckBox;
    WholeWordsOnlyLabel: TLabel;
    XMLTreeImageList: TImageList;
    XMLTreePopupActionList: TActionList;
    XMLTreePopupImagesList: TBCImageList;
    XMLTreePopupMenu: TPopupMenu;
    XMLTreeRefreshAction: TAction;
    GotoLinePanel: TPanel;
    GotoLineClosePanel: TPanel;
    GotoLineCloseSpeedButton: TSpeedButton;
    GotoLineLabelPanel: TPanel;
    GotoLineLabel: TLabel;
    LineNumberPanel: TPanel;
    GotoLineNumberEdit: TButtonedEdit;
    GotoLineButtonPanel: TPanel;
    GotoLineGoSpeedButton: TSpeedButton;
    GotoLineAction: TAction;
    GotoLineCloseAction: TAction;
    Separator7MenuItem: TMenuItem;
    InsertMenuItem: TMenuItem;
    InsertTagMenuItem: TMenuItem;
    DateandTimeMenuItem: TMenuItem;
    SynDWSSyn: TSynDWSSyn;
    SynYAMLSyn: TSynYAMLSyn;
    SynWebIDLSyn: TSynWebIDLSyn;
    SynLLVMIRSyn: TSynLLVMIRSyn;
    SynEditWildcardSearch: TSynEditWildcardSearch;
    DeleteMenuItem: TMenuItem;
    N1: TMenuItem;
    IndentMenuItem: TMenuItem;
    SortMenuItem: TMenuItem;
    SearchClearAction: TAction;
    GotoLineClearAction: TAction;
    procedure PageControlChange(Sender: TObject);
    procedure SearchCloseActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure SearchForEditChange(Sender: TObject);
    procedure SynEditOnChange(Sender: TObject);
    procedure SynEditEnter(Sender: TObject);
    procedure SynEditorReplaceText(Sender: TObject; const ASearch, AReplace: UnicodeString; Line, Column: Integer; var Action: TSynReplaceAction);
    procedure SynEditSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure SynEditSplitOnChange(Sender: TObject);
    procedure XMLTreeRefreshActionExecute(Sender: TObject);
    procedure GotoLineCloseActionExecute(Sender: TObject);
    procedure GotoLineActionExecute(Sender: TObject);
    procedure GotoLineNumberEditKeyPress(Sender: TObject; var Key: Char);
    procedure PageControlCloseButtonClick(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GotoLineNumberEditChange(Sender: TObject);
    procedure SearchClearActionExecute(Sender: TObject);
    procedure GotoLineClearActionExecute(Sender: TObject);
    procedure SearchForEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCaseCycle: Byte;
    FCompareImageIndex, FNewImageIndex: Integer;
    FHTMLDocumentChanged: Boolean;
    FHTMLErrorList: TList;
    FNumberOfNewDocument: Integer;
    FSelectedText: UnicodeString;
    FImages: TBCImageList;
    FProcessing: Boolean;
    FProgressBar: TBCProgressBar;
    FModifiedDocuments: Boolean;
    function CanFindNextPrevious: Boolean;
    function CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
    function FindHtmlVersion(Lines: TStrings): TSynWebHtmlVersion;
    function FindOpenFile(FileName: string): TBCSynEdit;
    function GetActiveDocumentFound: Boolean;
    function GetActiveDocumentModified: Boolean;
    function GetActiveDocumentName: string;
    function GetActivePageCaption: string;
    function GetActiveTabSheetCaption: string;
    function GetCanRedo: Boolean;
    function GetCanUndo: Boolean;
    function GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
    function GetDocTabSheetFrame(TabSheet: TTabSheet): TDocTabSheetFrame;
    function GetModifiedDocuments(CheckActive: Boolean = True): Boolean;
    function GetOpenTabSheetCount: Integer;
    function GetOpenTabSheets: Boolean;
    function GetSelectionFound: Boolean;
    function GetSelectionModeChecked: Boolean;
    function GetSplitChecked: Boolean;
    function GetMinimapChecked: Boolean;
    function GetSplitSynEdit(TabSheet: TTabSheet): TBCSynEdit;
    function GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
    function GetXMLTreeVisible: Boolean;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string; overload;
    function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    procedure AddToReopenFiles(FileName: string);
    procedure CheckHTMLErrors;
    procedure CheckModifiedDocuments;
    procedure DestroyHTMLErrorListItems;
    procedure DoSearch(SynEdit: TBCSynEdit);
    procedure InitializeSynEditPrint;
    procedure SelectHighlighter(DocTabSheetFrame: TDocTabSheetFrame; FileName: string);
    procedure SetActivePageCaptionModified;
    procedure SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
    procedure SetMainEncodingCombo(SynEdit: TBCSynEdit);
    procedure SetMainHighlighterCombo(SynEdit: TBCSynEdit);
    procedure SynEditHTMLOnChange(Sender: TObject);
    procedure SynEditHTMLPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure SynEditPASPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure UpdateMarginAndColors(DocTabSheetFrame: TDocTabSheetFrame);
    procedure UpdateHighlighterColors;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetActiveSplitSynEdit: TBCSynEdit;
    function GetActiveSynEdit: TBCSynEdit;
    function GetCaretInfo: string;
    function GetHTMLErrors: TList;
    function GetMacroRecordPauseImageIndex: Integer;
    function GetModifiedInfo: string;
    function GetActiveBookmarkList: TSynEditMarkList;
    function IsCompareFilesActivePage: Boolean;
    function InsertTag: Boolean;
    function IsMacroStopped: Boolean;
    function IsRecordingMacro: Boolean;
    function IsXMLDocument: Boolean;
    function Options: Boolean;
    function ReadIniOpenFiles: Boolean;
    function SaveAs: string;
    function ToggleLineNumbers: Boolean;
    function ToggleSpecialChars: Boolean;
    function ToggleWordWrap: Boolean;
    function ToggleXMLTree: Boolean;
    procedure CheckFileDateTimes;
    procedure ClearBookmarks;
    procedure Close;
    procedure CloseAll(CloseDocuments: Boolean = True);
    procedure CloseAllOtherPages;
    procedure CompareFiles(FileName: string = ''; AFileDragDrop: Boolean = False);
    procedure Copy;
    procedure Cut;
    procedure DecreaseIndent;
    procedure DeleteEOL;
    procedure DeleteLine;
    procedure DeleteWord;
    procedure FileProperties;
    procedure FindNext;
    procedure FindPrevious;
    procedure FormatXML;
    procedure GotoBookmarks(ItemIndex: Integer);
    procedure GotoLine;
    procedure IncreaseIndent;
    procedure InsertLine;
    procedure InsertDateAndTime;
    procedure LoadMacro;
    procedure New;
    procedure NextPage;
    procedure Open(FileName: string = ''; Bookmarks: TStrings = nil; Ln: Integer = 0;
      Ch: Integer = 0; StartUp: Boolean = False);
    procedure Paste;
    procedure PlaybackMacro;
    procedure PreviousPage;
    procedure Print;
    procedure PrintPreview;
    procedure ReadIniFile;
    procedure RecordMacro;
    procedure Redo;
    procedure Refresh(Page: Integer);
    procedure RemoveWhiteSpace;
    procedure Replace;
    procedure Save; overload;
    procedure SaveAll;
    procedure SaveMacro;
    procedure Search;
    procedure SelectAll;
    procedure SelectForCompare;
    procedure SetActiveEncoding(Value: Integer);
    procedure SetActiveHighlighter(Value: Integer);
    procedure ShowWordCount;
    procedure SortAsc;
    procedure SortDesc;
    procedure StopMacro;
    procedure ToggleBookmarks(ItemIndex: Integer);
    procedure ToggleCase;
    procedure ToggleMiniMap;
    procedure ToggleSelectionMode;
    procedure ToggleSplit;
    procedure Undo;
    procedure UpdateMarginAndControls;
    procedure UpdateLanguage(SelectedLanguage: string);
    procedure WriteIniFile;
    property ActiveDocumentFound: Boolean read GetActiveDocumentFound;
    property ActiveDocumentModified: Boolean read GetActiveDocumentModified;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveTabSheetCaption: string read GetActiveTabSheetCaption;
    property CanRedo: Boolean read GetCanRedo;
    property CanUndo: Boolean read GetCanUndo;
    property MinimapChecked: Boolean read GetMinimapChecked;
    property ModifiedDocuments: Boolean Read FModifiedDocuments write FModifiedDocuments;
    property OpenTabSheetCount: Integer read GetOpenTabSheetCount;
    property OpenTabSheets: Boolean read GetOpenTabSheets;
    property Processing: Boolean read FProcessing;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property SelectionFound: Boolean read GetSelectionFound;
    property SelectionModeChecked: Boolean read GetSelectionModeChecked;
    property SplitChecked: Boolean read GetSplitChecked;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible;
  end;

implementation

{$R *.dfm}

uses
  BCForms.PrintPreview, BCDialogs.Replace, BCDialogs.ConfirmReplace, Lib, Options, BCCommon.StyleUtils, VirtualTrees,
  Vcl.ActnMenus, SynTokenMatch, SynHighlighterWebMisc, System.Types, Winapi.ShellAPI, System.WideStrings, System.Math,
  Main, BigIni, Vcl.GraphUtil, SynUnicode, BCCommon.LanguageStrings, BCCommon.Dialogs, SynEditTextBuffer, BCCommon.Encoding,
  InsertTag, BCCommon.LanguageUtils, BCCommon.FileUtils, BCCommon.Messages, BCCommon.Lib, BCCommon.StringUtils,
  Winapi.CommCtrl, SynEditPrintTypes;

{ TDocumentFrame }

constructor TDocumentFrame.Create(AOwner: TComponent);
var
  SysImageList: THandle;
  SHFileInfo: TSHFileInfo;
  PathInfo: String;
  Icon: TIcon;
begin
  inherited;
  FNumberOfNewDocument := 0;
  FCaseCycle := 0;
  FSelectedText := '';
  FProcessing := False;
  FModifiedDocuments := False;
  FHTMLErrorList := TList.Create;

  { IDE will lose these, if the main form is not open }
  EditorPopupMenu.Images := MainForm.ImageList;
  CutMenuItem.Action := MainForm.EditCutAction;
  CopyMenuItem.Action := MainForm.EditCopyAction;
  PasteMenuItem.Action := MainForm.EditPasteAction;
  SelectAllMenuItem.Action := MainForm.EditSelectAllAction;
  UndoMenuItem.Action := MainForm.EditUndoAction;
  RedoMenuItem.Action := MainForm.EditRedoAction;
  ToggleBookmarkMenuItem.Action := MainForm.ToggleBookmarkAction;
  ToggleBookmarksMenuItem.Action := MainForm.ToggleBookmarksAction;
  ToggleBookmark1MenuItem.Action := MainForm.ToggleBookmarks1Action;
  ToggleBookmark2MenuItem.Action := MainForm.ToggleBookmarks2Action;
  ToggleBookmark3MenuItem.Action := MainForm.ToggleBookmarks3Action;
  ToggleBookmark4MenuItem.Action := MainForm.ToggleBookmarks4Action;
  ToggleBookmark5MenuItem.Action := MainForm.ToggleBookmarks5Action;
  ToggleBookmark6MenuItem.Action := MainForm.ToggleBookmarks6Action;
  ToggleBookmark7MenuItem.Action := MainForm.ToggleBookmarks7Action;
  ToggleBookmark8MenuItem.Action := MainForm.ToggleBookmarks8Action;
  ToggleBookmark9MenuItem.Action := MainForm.ToggleBookmarks9Action;
  GotoBookmarksMenuItem.Action := MainForm.GotoBookmarksAction;
  GotoBookmark1MenuItem.Action := MainForm.GotoBookmarks1Action;
  GotoBookmark2MenuItem.Action := MainForm.GotoBookmarks2Action;
  GotoBookmark3MenuItem.Action := MainForm.GotoBookmarks3Action;
  GotoBookmark4MenuItem.Action := MainForm.GotoBookmarks4Action;
  GotoBookmark5MenuItem.Action := MainForm.GotoBookmarks5Action;
  GotoBookmark6MenuItem.Action := MainForm.GotoBookmarks6Action;
  GotoBookmark7MenuItem.Action := MainForm.GotoBookmarks7Action;
  GotoBookmark8MenuItem.Action := MainForm.GotoBookmarks8Action;
  GotoBookmark9MenuItem.Action := MainForm.GotoBookmarks9Action;
  ClearBookmarksMenuItem.Action := MainForm.ClearBookmarksAction;
  InsertMenuItem.Action := MainForm.EditInsertAction;
  InsertLineMenuItem.Action := MainForm.EditInsertLineAction;
  InsertTagMenuItem.Action := MainForm.EditInsertTagAction;
  DateandTimeMenuItem.Action := MainForm.EditInsertDateTimeAction;
  DeleteMenuItem.Action := MainForm.EditDeleteAction;
  DeleteLineMenuItem.Action := MainForm.EditDeleteLineAction;
  DeleteEOLMenuItem.Action := MainForm.EditDeleteEOLAction;
  DeleteWordMenuItem.Action := MainForm.EditDeleteWordAction;
  RemoveWhiteSpaceMenuItem.Action := MainForm.EditRemoveWhiteSpaceAction;
  IndentMenuItem.Action := MainForm.EditIndentAction;
  IncreaseIndentMenuItem.Action := MainForm.EditIncreaseIndentAction;
  DecreaseIndentMenuItem.Action := MainForm.EditDecreaseIndentAction;
  SortMenuItem.Action := MainForm.EditSortAction;
  SortAscendingMenuItem.Action := MainForm.EditSortAscAction;
  SortDescendingMenuItem.Action := MainForm.EditSortDescAction;
  ToggleCaseMenuItem.Action := MainForm.EditToggleCaseAction;
  FormatXMLMenuItem.Action := MainForm.FormatXMLAction;

  FImages := TBCImageList.Create(Self);
  PageControl.Images := FImages;
  SysImageList := SHGetFileInfo(PChar(PathInfo), 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
  begin
    PageControl.Images.Handle := SysImageList;
    PageControl.Images.BkColor := ClNone;
    PageControl.Images.ShareImages := True;
  end;

  { compare and new image index }
  Icon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case PageControl.Images.Height of
      16:
      begin
        { smaller }
        ImageList16.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList16.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
      20:
      begin
        { medium }
        ImageList20.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList20.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
      24:
      begin
        { larger }
        ImageList24.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList24.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
    end;
  finally
    Icon.Free;
  end;
end;

destructor TDocumentFrame.Destroy;
begin
  if Assigned(FHTMLErrorList) then
  begin
    DestroyHTMLErrorListItems;
    FreeAndNil(FHTMLErrorList);
  end;
  if Assigned(FImages) then
    FImages.Free;

  inherited Destroy;
end;

function TDocumentFrame.FindHtmlVersion(Lines: TStrings): TSynWebHtmlVersion;
var
  Ln: Integer;
  S: string;
begin
  Result := OptionsContainer.HtmlVersion; { Default }

  try
    for Ln := 0 to 10 do
    begin
      S := Lines[Ln];

      if Pos(UpperCase('<!DOCTYPE html'), UpperCase(S)) <> 0 then
      begin
        Result := shvHtml5;
        Exit;
      end;
      if Pos(UpperCase('DTD HTML 4.01 Transitional'), UpperCase(S)) <> 0 then
      begin
        Result := shvHtml401Transitional;
        Exit;
      end;
      if Pos(UpperCase('DTD HTML 4.01 Frameset'), UpperCase(S)) <> 0 then
      begin
        Result := shvHtml401Frameset;
        Exit;
      end;
      if Pos(UpperCase('DTD XHTML 1.0 Strict'), UpperCase(S)) <> 0 then
      begin
        Result := shvXHtml10Strict;
        Exit;
      end;
      if Pos(UpperCase('DTD XHTML 1.0 Transitional'), UpperCase(S)) <> 0 then
      begin
        Result := shvXHtml10Transitional;
        Exit;
      end;
      if Pos(UpperCase('DTD XHTML 1.0 Frameset'), UpperCase(S)) <> 0 then
      begin
        Result := shvXHtml10Frameset;
        Exit;
      end;
    end;
  except

  end;
end;

procedure TDocumentFrame.DestroyHTMLErrorListItems;
var
  i: Integer;
  Data: POutputRec;
begin
  for i := FHTMLErrorList.Count - 1 downto 0 do
  begin
    Data := FHTMLErrorList.Items[i];
    Finalize(Data^);
  end;
  FHTMLErrorList.Clear;
end;

function TDocumentFrame.ToggleXMLTree: Boolean;
var
  i: Integer;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DocTabSheetFrame) then
      if DocTabSheetFrame.SynEdit.Highlighter = SynWebXmlSyn then
      begin
        DocTabSheetFrame.XMLTreeVisible := not DocTabSheetFrame.XMLTreeVisible;
        if DocTabSheetFrame.XMLTreeVisible then
          DocTabSheetFrame.LoadFromXML(DocTabSheetFrame.SynEdit.Text);
        Result := DocTabSheetFrame.XMLTreeVisible;
      end;
  end;
end;

function TDocumentFrame.GetXMLTreeVisible: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.VirtualDrawTree.Visible;
end;

function TDocumentFrame.CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
var
  TabSheet: TTabSheet;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;

  if FileName <> '' then
    TabSheet.ImageIndex := GetIconIndex(FileName)
  else
    TabSheet.ImageIndex := FNewImageIndex;

  PageControl.ActivePage := TabSheet;

  { set the Caption property }
  if FileName = '' then
    PageControl.ActivePageCaption := LanguageDataModule.GetConstant('Document') + IntToStr(FNumberOfNewDocument)
  else
    PageControl.ActivePageCaption := ExtractFileName(FileName);

  DocTabSheetFrame := TDocTabSheetFrame.Create(TabSheet);
  with DocTabSheetFrame do
  begin
    SynEdit.Visible := False;
    Parent := TabSheet;
    { SynEdit }
    with SynEdit do
    begin
      DocumentName := FileName;
      FileDateTime := GetFileDateTime(FileName);
      OnChange := SynEditOnChange;
      OnSpecialLineColors := SynEditSpecialLineColors;
      OnEnter := SynEditEnter;
      OnReplaceText := SynEditorReplaceText;
      SearchEngine := SynEditSearch;
      PopupMenu := EditorPopupMenu;
      BookMarkOptions.BookmarkImages := BookmarkImagesList;
      WordWrap.Enabled := OptionsContainer.EnableWordWrap;
      Gutter.ShowLineNumbers := OptionsContainer.EnableLineNumbers;
      if OptionsContainer.EnableSpecialChars then
        Options := Options + [eoShowSpecialChars]
      else
        Options := Options - [eoShowSpecialChars]
    end;
    { SynEditMinimap }
    SynEditMinimap.OnSpecialLineColors := SynEditSpecialLineColors;
    SplitSynEditMinimap.OnSpecialLineColors := SynEditSpecialLineColors;
    { VirtualDrawTree }
    with VirtualDrawTree do
    begin
      Images := XMLTreeImageList;
      PopupMenu := XMLTreePopupMenu;
    end;
    OptionsContainer.AssignTo(SynEdit);
    SynWebEngine.Options.HtmlVersion := shvUndefined;

    if Filename <> '' then
    begin
      SynEdit.LoadFromFile(FileName);
      SelectHighlighter(DocTabSheetFrame, FileName);
    end
    else
    begin
      SetActiveEncoding(OptionsContainer.DefaultEncoding);
      SetActiveHighlighter(OptionsContainer.DefaultHighlighter); { UrlSyn }
    end;

    { XML Tree }
    XMLTreeVisible := OptionsContainer.ShowXMLTree and IsXMLDocument;
    if XMLTreeVisible then
      LoadFromXML(SynEdit.Text);

    UpdateMarginAndColors(DocTabSheetFrame);

    { reduce flickering by setting width & height }
    SynEdit.Width := 0;
    SynEdit.Height := 0;

    SetMainHighlighterCombo(SynEdit);
    SetMainEncodingCombo(SynEdit);

    SynEdit.Visible := True;

    if SynEdit.CanFocus then
      SynEdit.SetFocus;

    Result := SynEdit;
  end;
end;

procedure TDocumentFrame.UpdateHighlighterColors;
var
  i: Integer;
  LStyles: TCustomStyleServices;
  DocTabSheetFrame: TDocTabSheetFrame;
  WhiteBackground: Boolean;
begin
  LStyles := StyleServices;
  if Assigned(LStyles) then
  begin
    WhiteBackground := (TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS) or (LStyles.GetStyleColor(scEdit) = clWhite);

    UpdateHC11SynColors(SynHC11Syn, WhiteBackground);
    UpdateAWKSynColors(SynAWKSyn, WhiteBackground);
    UpdateBaanSynColors(SynBaanSyn, WhiteBackground);
    UpdateBatSynColors(SynBatSyn, WhiteBackground);
    UpdateCACSynColors(SynCACSyn, WhiteBackground);
    UpdateCacheSynColors(SynCacheSyn, WhiteBackground);
    UpdateCobolSynColors(SynCobolSyn, WhiteBackground);
    UpdateIdlSynColors(SynIdlSyn, WhiteBackground);
    UpdateCPMSynColors(SynCPMSyn, WhiteBackground);
    UpdateDOTSynColors(SynDOTSyn, WhiteBackground);
    UpdateADSP21xxSynColors(SynADSP21xxSyn, WhiteBackground);
    UpdateDWSSynColors(SynDWSSyn, WhiteBackground);
    UpdateEiffelSynColors(SynEiffelSyn, WhiteBackground);
    UpdateFortranSynColors(SynFortranSyn, WhiteBackground);
    UpdateFoxproSynColors(SynFoxproSyn, WhiteBackground);
    UpdateGalaxySynColors(SynGalaxySyn, WhiteBackground);
    UpdateGWScriptSynColors(SynGWScriptSyn, WhiteBackground);
    UpdateHaskellSynColors(SynHaskellSyn, WhiteBackground);
    UpdateIniSynColors(SynIniSyn, WhiteBackground);
    UpdateInnoSynColors(SynInnoSyn, WhiteBackground);
    UpdateJavaSynColors(SynJavaSyn, WhiteBackground);
    UpdateJScriptSynColors(SynJScriptSyn, WhiteBackground);
    UpdateKixSynColors(SynKixSyn, WhiteBackground);
    UpdateLDRSynColors(SynLDRSyn, WhiteBackground);
    UpdateLLVMSynColors(SynLLVMIRSyn, WhiteBackground);
    UpdateModelicaSynColors(SynModelicaSyn, WhiteBackground);
    UpdateM3SynColors(SynM3Syn, WhiteBackground);
    UpdateMsgSynColors(SynMsgSyn, WhiteBackground);
    UpdateBatSynColors(SynBatSyn, WhiteBackground);
    UpdatePerlSynColors(SynPerlSyn, WhiteBackground);
    UpdateProgressSynColors(SynProgressSyn, WhiteBackground);
    UpdatePythonSynColors(SynPythonSyn, WhiteBackground);
    UpdateRCSynColors(SynRCSyn, WhiteBackground);
    UpdateRubySynColors(SynRubySyn, WhiteBackground);
    UpdateSDDSynColors(SynSDDSyn, WhiteBackground);
    UpdateSQLSynColors(SynSQLSyn, WhiteBackground);
    UpdateSTSynColors(SynSTSyn, WhiteBackground);
    UpdateSMLSynColors(SynSMLSyn, WhiteBackground);
    UpdateTclTkSynColors(SynTclTkSyn, WhiteBackground);
    UpdateTexSynColors(SynTexSyn, WhiteBackground);
    UpdateUNIXShellScriptSynColors(SynUNIXShellScriptSyn, WhiteBackground);
    for i := 0 to PageControl.PageCount - 1 do
    begin
      DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
      if Assigned(DocTabSheetFrame) then
        UpdateURISynColors(DocTabSheetFrame.SynURISyn, WhiteBackground);
    end;
    UpdateWebIDLSynColors(SynWebIDLSyn, WhiteBackground);
    UpdateVBSynColors(SynVBSyn, WhiteBackground);
    UpdateVBScriptSynColors(SynVBScriptSyn, WhiteBackground);
    UpdateASMSynColors(SynASMSyn, WhiteBackground);
    UpdateYAMLSynColors(SynYAMLSyn, WhiteBackground);
    UpdateWebEngineColors(SynWebEngine, WhiteBackground);
  end;
end;

procedure TDocumentFrame.UpdateMarginAndControls;
var
  i, Right: Integer;
  DocTabSheetFrame: TDocTabSheetFrame;
  CompareFrame: TCompareFrame;
begin
  PageControl.DoubleBuffered := OptionsContainer.DocDoubleBuffered;
  PageControl.MultiLine := OptionsContainer.DocMultiLine;
  PageControl.ShowCloseButton := OptionsContainer.DocShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DocRightClickSelect;
  if OptionsContainer.DocShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;

  Right := GetRightPadding;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DocTabSheetFrame) then
    begin
      UpdateMarginAndColors(DocTabSheetFrame);
      DocTabSheetFrame.UpdateOptionsAndStyles(Right);
    end;
    CompareFrame := GetCompareFrame(PageControl.Pages[i]);
    if Assigned(CompareFrame) then
      CompareFrame.Panel.Padding.Right := Right  // TODO: Fix UpdateStyles
  end;
  UpdateHighlighterColors;
end;

procedure TDocumentFrame.SynEditSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
var
  LStyles: TCustomStyleServices;
begin
  if not TBCSynEdit(Sender).SelAvail then
    if TBCSynEdit(Sender).CaretY = Line then
    begin
      Special := True;
      LStyles := StyleServices;
      if LStyles.Enabled then
        BG := LightenColor(TBCSynEdit(Sender).Color, 1 - (10 - OptionsContainer.ColorBrightness)/10);
    end;
end;

procedure TDocumentFrame.UpdateMarginAndColors(DocTabSheetFrame: TDocTabSheetFrame);
begin
  BCCommon.StyleUtils.UpdateMarginAndColors(DocTabSheetFrame.SynEdit);
  BCCommon.StyleUtils.UpdateMarginAndColors(DocTabSheetFrame.SplitSynEdit);
end;

procedure TDocumentFrame.SynEditEnter(Sender: TObject);
begin
  CheckFileDateTimes;
end;

procedure TDocumentFrame.CompareFiles(FileName: string; AFileDragDrop: Boolean);
var
  i: Integer;
  TabSheet: TTabSheet;
  Frame: TCompareFrame;
  TempList: TStringList;
  SynEdit: TBCSynEdit;
begin
  SearchPanel.Visible := False;
  GotoLinePanel.Visible := False;
  { create list of open documents }
  TempList := TStringList.Create;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      TempList.Add(SynEdit.DocumentName);
  end;
  if Filename <> '' then
  begin
    { find compare tab }
    for i := 0 to PageControl.PageCount - 1 do
      if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
      begin
        Frame := GetCompareFrame(PageControl.Pages[i]);
        { if there already are two files to compare then continue }
        if Frame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit}
          PageControl.ActivePageIndex := i;
          Frame.SetCompareFile(Filename, AFileDragDrop);
          Exit;
        end;
      end;
  end;
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := FCompareImageIndex;
  TabSheet.Caption := LanguageDataModule.GetConstant('CompareFiles');
  PageControl.UpdatePageCaption(TabSheet);
  PageControl.ActivePage := TabSheet;
  { create a compare frame }
  Frame := TCompareFrame.Create(TabSheet);
  with Frame do
  begin
    Parent := TabSheet;
    Align := alClient;
    OpenDocumentsList := TempList;
    SetCompareFile(Filename);
    SpecialChars := OptionsContainer.EnableSpecialChars;
    LineNumbers := OptionsContainer.EnableLineNumbers;
    UpdateLanguage(GetSelectedLanguage);
  end;
end;

procedure TDocumentFrame.SelectForCompare;
begin
  CompareFiles(GetActiveSynEdit.DocumentName);
end;

function TDocumentFrame.FindOpenFile(FileName: string): TBCSynEdit;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if CompareText(UpperCase(SynEdit.DocumentName), UpperCase(FileName)) = 0 then
      begin
        PageControl.ActivePage := PageControl.Pages[i];
        Result := SynEdit;
        Break;
      end;
  end;
end;

procedure TDocumentFrame.New;
begin
  Inc(FNumberOfNewDocument);
  CreateNewTabSheet;
end;

procedure TDocumentFrame.SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
var
  i: Integer;
  Temp: string;
  BookmarkNumber, Ln, Ch: Integer;
begin
  if Assigned(Bookmarks) then
  begin
    for i := 0 to Bookmarks.Count - 1 do
    begin
      Temp := Bookmarks.Strings[i];
      if Pos(SynEdit.DocumentName, Temp) <> 0 then
      begin
        Temp := System.Copy(Temp, Pos('=', Temp) + 1, Length(Temp));
        BookmarkNumber := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ln := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ch := StrToInt(Temp);

        SynEdit.SetBookMark(BookmarkNumber, Ch, Ln);
      end;
    end;
  end;
end;

procedure TDocumentFrame.AddToReopenFiles(FileName: string);
var
  i: Integer;
  Files: TStrings;
  IniFile: string;
begin
  IniFile := GetIniFilename;
  Files := TStringList.Create;
  { Read section }
  with TBigIniFile.Create(IniFile) do
  try
    ReadSectionValues('FileReopenFiles', Files);
  finally
    Free;
  end;
  { Insert filename }
  for i := 0 to Files.Count - 1 do
    Files[i] := System.Copy(Files[i], Pos('=', Files[i]) + 1, Length(Files[i]));
  for i := Files.Count - 1 downto 0 do
    if Files[i] = FileName then
      Files.Delete(i);
  Files.Insert(0, FileName);
  while Files.Count > 10 do
    Files.Delete(Files.Count - 1);
  { write section }
  with TBigIniFile.Create(IniFile) do
  try
    EraseSection('FileReopenFiles');
    for i := 0 to Files.Count - 1 do
      WriteString('FileReopenFiles', IntToStr(i), Files.Strings[i]);
  finally
    Free;
  end;
  { if ini file is open in editor reload it because time has changed }
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = ExtractFileName(IniFile) then
      Refresh(i);
end;

procedure TDocumentFrame.Open(FileName: string = ''; Bookmarks: TStrings = nil;
  Ln: Integer = 0; Ch: Integer = 0; StartUp: Boolean = False);
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  FProcessing := True;
  try
    if FileName = '' then
    begin
      if BCCommon.Dialogs.OpenFiles(Handle, '', OptionsContainer.Filters, LanguageDataModule.GetConstant('Open')) then
      begin
        Application.ProcessMessages; { style fix }
        for i := 0 to BCCommon.Dialogs.Files.Count - 1 do
          Open(BCCommon.Dialogs.Files[i])
      end;
    end
    else
    begin
      if FileExists(FileName) then
      begin
        SynEdit := FindOpenFile(FileName);
        if not Assigned(SynEdit) then
          SynEdit := CreateNewTabSheet(FileName);
        SynEdit.CaretXY := BufferCoord(Ch, Ln);
        SetBookmarks(SynEdit, Bookmarks);
        CheckHTMLErrors;
        try
          SetMainHighlighterCombo(SynEdit);
          SetMainEncodingCombo(SynEdit);
          if SynEdit.CanFocus then
            SynEdit.SetFocus;
          if not StartUp then
          begin
            AddToReopenFiles(FileName);
            MainForm.CreateFileReopenList;
          end;
        except
          { It is not always possible to focus... }
        end;
      end
      else
      if ExtractFileName(FileName) <> '' then
        ShowErrorMessage(Format(LanguageDataModule.GetErrorMessage('FileNotFound'), [Filename]))
    end;
  finally
    FProcessing := False;
  end;
end;

procedure TDocumentFrame.Close;
var
  ActivePageIndex: Integer;
  Rslt: Integer;
  SynEdit: TBCSynEdit;
begin
  Rslt := mrNone;

  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
  begin
    Rslt := SaveChanges;
    if Rslt = mrYes then
      Save;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.TabClosed := True;
    ActivePageIndex := PageControl.ActivePageIndex;
    { Fixed Delphi Bug: http://qc.embarcadero.com/wc/qcmain.aspx?d=5473 }
    if (ActivePageIndex = PageControl.PageCount - 1) and (PageControl.PageCount > 1) then
    begin
      Dec(ActivePageIndex);
      PageControl.ActivePage.PageIndex := ActivePageIndex;
    end;
    if PageControl.PageCount > 0 then
      PageControl.Pages[ActivePageIndex].Free;
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  SynEdit := GetActiveSynEdit;
  SetMainHighlighterCombo(SynEdit);
  SetMainEncodingCombo(SynEdit);
  CheckModifiedDocuments;
  CheckHTMLErrors;
  PageControl.Repaint; { Icon paint bug fix }
  if Assigned(SynEdit) then
    if SynEdit.CanFocus then
      SynEdit.SetFocus;
end;

procedure TDocumentFrame.CloseAll(CloseDocuments: Boolean);
var
  Rslt, i, j: Integer;
begin
  Rslt := mrNone;

  if FModifiedDocuments then
  begin
    Rslt := SaveChanges(CloseDocuments);
    if Rslt = mrYes then
      SaveAll;
  end;
  if CloseDocuments and (Rslt <> mrCancel) then
  begin
    FProcessing := True;
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Visible := True;
      j := PageControl.PageCount;
      for i := j - 1 downto 0 do
      begin
        FProgressBar.Position := 100 - Trunc((i / j) * 100);
        PageControl.Pages[i].Free;
      end;
    finally
      Screen.Cursor := crDefault;
      FProgressBar.Visible := False;
      FProcessing := False;
    end;
    FNumberOfNewDocument := 0;
  end;
  CheckModifiedDocuments;
  CheckHTMLErrors;
  PageControl.Repaint; { Icon paint bug fix }
end;

procedure TDocumentFrame.CloseAllOtherPages;
var
  i, j: Integer;
  Rslt: Integer;
  SynEdit: TBCSynEdit;
begin
  Rslt := mrNone;
  PageControl.ActivePage.PageIndex := 0; { move the page first }
  if GetModifiedDocuments(False) then
  begin
    Rslt := SaveChanges(True);

    if Rslt = mrYes then
      for i := 1 to PageControl.PageCount - 1 do
      begin
        SynEdit := GetSynEdit(PageControl.Pages[i]);
        if Assigned(SynEdit) and SynEdit.Modified then
          Save(PageControl.Pages[i]);
      end;
  end;

  if Rslt <> mrCancel then
  begin
    FProcessing := True;
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Visible := True;
      j := PageControl.PageCount;
      for i := j - 1 downto 1 do
      begin
        FProgressBar.Position := 100 - Trunc((i / j) * 100);
        PageControl.Pages[i].Free;
      end;
      FProgressBar.Visible := False;
    finally
      Screen.Cursor := crDefault;
      FProcessing := False;
    end;

    if GetActiveSynEdit.DocumentName = '' then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;
  CheckModifiedDocuments;
  CheckHTMLErrors;
  PageControl.Repaint; { Icon paint bug fix }
end;

procedure TDocumentFrame.CheckModifiedDocuments;
begin
  FModifiedDocuments := GetModifiedDocuments;
end;

function TDocumentFrame.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  DocTabSheetFrame: TDocTabSheetFrame;
  AFileName, FilePath: string;
  FilterIndex: Cardinal;
begin
  Result := '';
  DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
  begin
    if (DocTabSheetFrame.SynEdit.DocumentName = '') or ShowDialog then
    begin
      if DocTabSheetFrame.SynEdit.DocumentName = '' then
      begin
        AFileName := Trim(TabSheet.Caption);
        AFileName := FormatFileName(AFileName);
      end
      else
        AFileName := ExtractFileName(DocTabSheetFrame.SynEdit.DocumentName);

      FilePath := ExtractFilePath(DocTabSheetFrame.SynEdit.DocumentName);
      FilterIndex := OptionsContainer.GetFilterIndex(ExtractFileExt(AFileName));
      if BCCommon.Dialogs.SaveFile(Handle, FilePath, OptionsContainer.Filters, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, AFileName) then
      begin
        Application.ProcessMessages; { style fix }
        Result := BCCommon.Dialogs.Files[0];
        if ExtractFileExt(Result) = '' then
          if (FilterIndex > 1) and (FilterIndex < OptionsContainer.FilterCount) then
            Result := Format('%s%s', [Result, OptionsContainer.GetFilterExt(FilterIndex)]);
        TabSheet.Caption := ExtractFileName(Result);
        DocTabSheetFrame.SynEdit.DocumentName := Result;
      end
      else
      begin
        if DocTabSheetFrame.SynEdit.CanFocus then
          DocTabSheetFrame.SynEdit.SetFocus;
        Exit;
      end;
    end;
    with DocTabSheetFrame.SynEdit do
    begin
      SaveToFile(DocumentName);
      if not OptionsContainer.UndoAfterSave then
        UndoList.Clear;
      FileDateTime := GetFileDateTime(DocumentName);
      Modified := False;
      TabSheet.ImageIndex := GetIconIndex(DocumentName);
      TabSheet.Caption := FormatFileName(TabSheet.Caption);
      PageControl.UpdatePageCaption(TabSheet);
      SelectHighlighter(DocTabSheetFrame, DocumentName);
      SetMainHighlighterCombo(DocTabSheetFrame.SynEdit);
      UpdateMarginAndColors(DocTabSheetFrame);
    end;
    CheckModifiedDocuments;
  end;
end;

procedure TDocumentFrame.Save;
begin
  if Assigned(PageControl.ActivePage) then
    Save(PageControl.ActivePage);
end;

function TDocumentFrame.SaveAs: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := Save(PageControl.ActivePage, True);
end;

procedure TDocumentFrame.SaveAll;
var
  i, j: Integer;
  SynEdit: TBCSynEdit;
begin
  Screen.Cursor := crHourGlass;
  try
    FProcessing := True;
    Application.ProcessMessages;
    FProgressBar.Visible := True;
    j := PageControl.PageCount;
    for i := 0 to j - 1 do
    begin
      FProgressBar.Position := Trunc((i / j) * 100);
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) and SynEdit.Modified then
        Save(PageControl.Pages[i]);
    end;
    FProgressBar.Visible := False;
  finally
    Screen.Cursor := crDefault;
    FProcessing := False;
  end;
end;

function TDocumentFrame.GetActivePageCaption: string;
begin
  Result := FormatFileName(PageControl.ActivePageCaption);
end;

procedure TDocumentFrame.Undo;

  procedure Undo(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        SynEdit.Undo;
        if SynEdit.UndoList.ItemCount = 0 then
          PageControl.ActivePageCaption := GetActivePageCaption;
      end;
  end;

begin
  Undo(GetActiveSynEdit);
  Undo(GetActiveSplitSynEdit);
  CheckModifiedDocuments;
end;

procedure TDocumentFrame.Redo;

  procedure Redo(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.Redo;
  end;

begin
  Redo(GetActiveSynEdit);
  Redo(GetActiveSplitSynEdit);
  CheckModifiedDocuments;
end;

procedure TDocumentFrame.Cut;

  procedure Cut(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.CutToClipboard;
  end;

begin
  Cut(GetActiveSynEdit);
  Cut(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.Copy;

  procedure Copy(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.CopyToClipboard;
  end;

begin
  Copy(GetActiveSynEdit);
  Copy(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.SetMainHighlighterCombo(SynEdit: TBCSynEdit);
begin
  if Assigned(SynEdit) then
    if Assigned(SynEdit.Highlighter) then
      MainForm.HighlighterComboIndex := SynEdit.Highlighter.Tag
end;

procedure TDocumentFrame.SetMainEncodingCombo(SynEdit: TBCSynEdit);
begin
  if Assigned(SynEdit) then
  begin
    if SynEdit.Encoding = TEncoding.ASCII then
      MainForm.EncodingComboIndex := 0
    else
    if SynEdit.Encoding = TEncoding.ANSI then
      MainForm.EncodingComboIndex := 1
    else
    if SynEdit.Encoding = TEncoding.BigEndianUnicode then
      MainForm.EncodingComboIndex := 2
    else
    if SynEdit.Encoding = TEncoding.Unicode then
      MainForm.EncodingComboIndex := 3
    else
    if SynEdit.Encoding = TEncoding.UTF7 then
      MainForm.EncodingComboIndex := 4
    else
    if SynEdit.Encoding = TEncoding.UTF8 then
      MainForm.EncodingComboIndex := 5
    else
    if SynEdit.Encoding = TEncoding.UTF8WithoutBOM then
      MainForm.EncodingComboIndex := 6
    else
      MainForm.EncodingComboIndex := 1; { ANSI }
  end;
end;

procedure TDocumentFrame.PageControlChange(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  if FProcessing then
    Exit;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    SynWebEngine.Options.HtmlVersion := SynEdit.HtmlVersion;
    SetMainHighlighterCombo(SynEdit);
    SetMainEncodingCombo(SynEdit);
  end
  else
  begin
    SearchPanel.Visible := False;
    GotoLinePanel.Visible := False;
  end;
  PageControl.Repaint;
end;

procedure TDocumentFrame.PageControlCloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TDocumentFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.DocCloseTabByDblClick then
    Close;
end;

procedure TDocumentFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.DocCloseTabByMiddleClick then
    Close;
end;

procedure TDocumentFrame.Paste;
var
  SynEdit, SplitSynedit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  SplitSynedit := GetActiveSplitSynEdit;
  if Assigned(SynEdit) and SynEdit.Focused then
    SynEdit.PasteFromClipboard
  else
  if Assigned(SplitSynedit) and SplitSynedit.Focused then
    SplitSynedit.PasteFromClipboard
  else
  if SearchPanel.Visible then
    SearchForEdit.PasteFromClipboard;
end;

procedure TDocumentFrame.InitializeSynEditPrint;
var
  SynEdit: TBCSynEdit;
  Alignment: TAlignment;

  procedure SetHeaderFooter(Option: Integer; Value: string);
  begin
    case Option of
    0, 1:
      with SynEditPrint.Footer do
      begin
        case Option of
          0: Alignment := taLeftJustify;
          1: Alignment := taRightJustify;
        end;
        Add(Value, nil, Alignment, 1);
      end;
    2, 3:
      with SynEditPrint.Header do
      begin
        case Option of
          2: Alignment := taLeftJustify;
          3: Alignment := taRightJustify;
        end;
        Add(Value, nil, Alignment, 1);
      end;
    end;
  end;

begin
  SynEdit := GetActiveSynEdit;
  SynEditPrint.Header.Clear;
  SynEditPrint.Footer.Clear;

  SetHeaderFooter(OptionsContainer.PrintDocumentName, SynEdit.DocumentName);
  SetHeaderFooter(OptionsContainer.PrintPageNumber, LanguageDataModule.GetConstant('PreviewDocumentPage'));
  SetHeaderFooter(OptionsContainer.PrintPrintedBy, Format(LanguageDataModule.GetConstant('PrintedBy'), [Application.Title]));
  SetHeaderFooter(OptionsContainer.PrintDateTime, '$DATE$ $TIME$');

  if OptionsContainer.PrintShowHeaderLine then
    SynEditPrint.Header.FrameTypes := [ftLine]
  else
    SynEditPrint.Header.FrameTypes := [];

  if OptionsContainer.PrintShowFooterLine then
    SynEditPrint.Footer.FrameTypes := [ftLine]
  else
    SynEditPrint.Footer.FrameTypes := [];
  SynEditPrint.LineNumbers := OptionsContainer.PrintShowLineNumbers;
  SynEditPrint.Wrap := OptionsContainer.PrintWordWrapLine;

  SynEditPrint.SynEdit := SynEdit;
  SynEditPrint.Title := SynEdit.DocumentName;
end;

procedure TDocumentFrame.Print;
var
  PrintDlgRec: TPrintDlg;
begin
  if BCCommon.Dialogs.Print(Handle, PrintDlgRec) then
  begin
    Application.ProcessMessages; { style fix }
    SynEditPrint.Copies := PrintDlgRec.nCopies;
    SynEditPrint.SelectedOnly := PrintDlgRec.Flags and PD_SELECTION <> 0;
    if PrintDlgRec.Flags and PD_PAGENUMS <> 0 then
      SynEditPrint.PrintRange(PrintDlgRec.nFromPage, PrintDlgRec.nToPage);
    InitializeSynEditPrint;
    SynEditPrint.Print;
  end;
end;

procedure TDocumentFrame.PrintPreview;
begin
  InitializeSynEditPrint;
  with PrintPreviewDialog do
  begin
    SynEditPrintPreview.SynEditPrint := SynEditPrint;
    ShowModal;
  end;
end;

function TDocumentFrame.SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
begin
  Result := [];
  if IncludeBackwards then
    Include(Result, ssoBackwards);
  if CaseSensitiveCheckBox.Checked then
    Include(Result, ssoMatchCase);
  if WholeWordsCheckBox.Checked then
    Include(Result, ssoWholeWord);
end;

procedure TDocumentFrame.Search;
var
  DocTabSheetFrame: TDocTabSheetFrame;
  SynEdit: TBCSynEdit;
begin
  SearchPanel.Show; // Visible := True;
  //if SearchPanel.Visible then
  //begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if DocTabSheetFrame.SplitSynEdit.Focused then
    SynEdit := DocTabSheetFrame.SplitSynEdit
  else
    SynEdit := DocTabSheetFrame.SynEdit;
  if Assigned(SynEdit) then
  begin
    SearchPanel.Height := SearchForEdit.Height;
    if SynEdit.SelAvail then
      SearchForEdit.Text := SynEdit.SelText;
    SearchForEdit.SetFocus;
    SynEdit.CaretXY := BufferCoord(0, 0);
    DoSearch(SynEdit);
  end;
  //end;
end;

procedure TDocumentFrame.DoSearch(SynEdit: TBCSynEdit);
var
  SynSearchOptions: TSynSearchOptions;
begin
  if SearchForEdit.Text = '' then
    Exit;

  if RegularExpressionCheckBox.Checked then
    SynEdit.SearchEngine := SynEditRegexSearch
  else
  if (Pos('*', SearchForEdit.Text) <> 0) or (Pos('?', SearchForEdit.Text) <> 0) then
    SynEdit.SearchEngine := SynEditWildCardSearch
  else
    SynEdit.SearchEngine := SynEditSearch;
  SynSearchOptions := SearchOptions(False);
  try
    if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
    begin
      if OptionsContainer.BeepIfSearchStringNotFound then
        MessageBeep;
      SynEdit.BlockBegin := SynEdit.BlockEnd;
      SynEdit.CaretXY := SynEdit.BlockBegin;
      if OptionsContainer.ShowSearchStringNotFound then
        ShowMessage(Format(LanguageDataModule.GetYesOrNoMessage('SearchStringNotFound'), [SearchForEdit.Text]))
    end;
  except
    { silent }
  end;
end;

procedure TDocumentFrame.SearchClearActionExecute(Sender: TObject);
begin
  SearchForEdit.Text := '';
end;

procedure TDocumentFrame.SearchCloseActionExecute(Sender: TObject);
begin
  SearchPanel.Hide;
end;

procedure TDocumentFrame.SearchFindNextActionExecute(Sender: TObject);
begin
  FindNext;
end;

procedure TDocumentFrame.SearchFindPreviousActionExecute(Sender: TObject);
begin
  FindPrevious;
end;

procedure TDocumentFrame.FindNext;
var
  SynSearchOptions: TSynSearchOptions;
  DocTabSheetFrame: TDocTabSheetFrame;
  SynEdit: TBCSynEdit;
begin
  if SearchForEdit.Text = '' then
    Exit;
  SynSearchOptions := SearchOptions(False);

  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if DocTabSheetFrame.SplitSynEdit.Focused then
    SynEdit := DocTabSheetFrame.SplitSynEdit
  else
    SynEdit := DocTabSheetFrame.SynEdit;

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    if OptionsContainer.BeepIfSearchStringNotFound then
      MessageBeep;
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
    if (SynEdit.CaretX = 1) and (SynEdit.CaretY = 1) then
    begin
      if OptionsContainer.ShowSearchStringNotFound then
        ShowMessage(Format(LanguageDataModule.GetYesOrNoMessage('SearchStringNotFound'), [SearchForEdit.Text]))
    end
    else
    if AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('SearchMatchNotFound'), [CHR_DOUBLE_ENTER])) then
    begin
      SynEdit.CaretX := 0;
      SynEdit.CaretY := 0;
      FindNext;
    end;
  end;
end;

procedure TDocumentFrame.FindPrevious;
var
  SynSearchOptions: TSynSearchOptions;
  DocTabSheetFrame: TDocTabSheetFrame;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;
  SynSearchOptions := SearchOptions(True);

  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if DocTabSheetFrame.SplitSynEdit.Focused then
    SynEdit := DocTabSheetFrame.SplitSynEdit
  else
    SynEdit := DocTabSheetFrame.SynEdit;

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep;
    SynEdit.BlockEnd := SynEdit.BlockBegin;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TDocumentFrame.Replace;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
  i, j, MResult: Integer;
begin
  with ReplaceDialog do
  begin
    SynEdit := GetActiveSynEdit;
    if SynEdit.SelAvail then
      SearchForComboBox.Text := SynEdit.SelText;
    MResult := ShowModal;
    if (MResult = mrOK) or (MResult = mrYes) then
    begin
      SynSearchOptions := SearchOptions(False);
      if MResult = mrOK then
        Include(SynSearchOptions, ssoPrompt);
      Include(SynSearchOptions, ssoReplace);
      Include(SynSearchOptions, ssoReplaceAll);
      if ReplaceInWholeFile then
      begin
        SynEdit.CaretXY := BufferCoord(0, 0);
        SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
      end
      else
      begin
        FProcessing := True;
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        try
          FProgressBar.Visible := True;
          j := PageControl.PageCount;
          for i := 0 to j - 1 do
          begin
            FProgressBar.Position := Trunc((i / j) * 100);
            SynEdit := GetSynEdit(PageControl.Pages[i]);
            if Assigned(SynEdit) then
            begin
              SynEdit.CaretXY := BufferCoord(0, 0);
              SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);

              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, SynEdit.Modified);
              PageControl.UpdatePageCaption(PageControl.Pages[i]);
            end;
          end;
        finally
          Screen.Cursor := crDefault;
          FProgressBar.Visible := False;
          FProcessing := False;
        end;
      end;
    end;
  end;
end;

procedure TDocumentFrame.ToggleBookmarks(ItemIndex: Integer);
var
  SynEdit: TBCSynEdit;
  SynEditorCommand: TSynEditorCommand;
begin
  SynEditorCommand := ecNone;
  case ItemIndex of
    0: SynEditorCommand := ecSetMarker0;
    1: SynEditorCommand := ecSetMarker1;
    2: SynEditorCommand := ecSetMarker2;
    3: SynEditorCommand := ecSetMarker3;
    4: SynEditorCommand := ecSetMarker4;
    5: SynEditorCommand := ecSetMarker5;
    6: SynEditorCommand := ecSetMarker6;
    7: SynEditorCommand := ecSetMarker7;
    8: SynEditorCommand := ecSetMarker8;
    9: SynEditorCommand := ecSetMarker9;
  end;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(ItemIndex), nil);
end;

procedure TDocumentFrame.SearchForEditChange(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  SearchForEdit.RightButton.Visible := Trim(SearchForEdit.Text) <> '';
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    SynEdit.CaretXY := BufferCoord(0, 0);
    SearchFindNextAction.Enabled := CanFindNextPrevious;
    SearchFindPreviousAction.Enabled := SearchFindNextAction.Enabled;
    DoSearch(SynEdit);
  end;
end;

procedure TDocumentFrame.SearchForEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    SearchPanel.Hide;
    Key := #0;
  end;
end;

function TDocumentFrame.CanFindNextPrevious: Boolean;
begin
  Result := SearchForEdit.Text <> '';
end;

function TDocumentFrame.ToggleWordWrap: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.WordWrap.Enabled := not SynEdit.WordWrap.Enabled;
      Result := SynEdit.WordWrap.Enabled;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      SynEdit.WordWrap.Enabled := not SynEdit.WordWrap.Enabled;
  end;
  OptionsContainer.EnableWordWrap := Result;
end;

function TDocumentFrame.ToggleSpecialChars: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if eoShowSpecialChars in SynEdit.Options then
        SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
      else
        SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
      Result := eoShowSpecialChars in SynEdit.Options;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if eoShowSpecialChars in SynEdit.Options then
        SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
      else
        SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
    end;
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleSpecialChars
  end;
  OptionsContainer.EnableSpecialChars := Result;
end;

function TDocumentFrame.GetSelectionModeChecked: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelectionMode = smColumn;
end;

procedure TDocumentFrame.ToggleSelectionMode;
var
  i: Integer;

  procedure ToggleSelectionMode(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        if SynEdit.SelectionMode = smColumn then
        begin
          SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
          SynEdit.SelectionMode := smNormal
        end
        else
        begin
          SynEdit.Options := SynEdit.Options - [eoAltSetsColumnMode];
          SynEdit.SelectionMode := smColumn;
        end;
      end;
  end;

begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    ToggleSelectionMode(GetSynEdit(PageControl.Pages[i]));
    ToggleSelectionMode(GetSplitSynEdit(PageControl.Pages[i]));
  end;
end;

function TDocumentFrame.ToggleLineNumbers: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
      Result := SynEdit.Gutter.ShowLineNumbers;
    end;
    SynEdit := GetSplitSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleLineNumbers
  end;
  OptionsContainer.EnableLineNumbers := Result;
end;

procedure TDocumentFrame.ReadIniFile;
var
  i, j: Integer;
  s: string;
  FileTypes: TStrings;
begin
  FileTypes := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    { Options }
    OptionsContainer.FontName := ReadString('Options', 'FontName', 'Courier New');
    OptionsContainer.FontSize := StrToInt(ReadString('Options', 'FontSize', '9'));
    OptionsContainer.ColorBrightness := StrToInt(ReadString('Options', 'ActiveLineColorBrightness', '2'));
    OptionsContainer.MarginFontName := ReadString('Options', 'MarginFontName', 'Courier New');
    OptionsContainer.MarginFontSize := StrToInt(ReadString('Options', 'MarginFontSize', '9'));
    OptionsContainer.MarginLeftMarginAutoSize := ReadBool('Options', 'MarginLeftMarginAutoSize', True);
    OptionsContainer.MarginVisibleRightMargin := ReadBool('Options', 'MarginVisibleRightMargin', True);
    OptionsContainer.MarginRightMargin := StrToInt(ReadString('Options', 'RightMargin', '80'));
    OptionsContainer.MarginVisibleLeftMargin := ReadBool('Options', 'MarginVisibleLeftMargin', True);
    OptionsContainer.MarginShowBookmarks := ReadBool('Options', 'MarginShowBookmarks', True);
    OptionsContainer.MarginLeftMarginWidth := StrToInt(ReadString('Options', 'MarginLeftMarginWidth', '48'));

    OptionsContainer.MarginInTens := ReadBool('Options', 'MarginInTens', True);
    OptionsContainer.MarginZeroStart := ReadBool('Options', 'MarginZeroStart', False);
    OptionsContainer.MarginLineModified := ReadBool('Options', 'MarginLineModified', True);
    OptionsContainer.MarginModifiedColor := ReadString('Options', 'MarginModifiedColor', 'clYellow');
    OptionsContainer.MarginNormalColor := ReadString('Options', 'MarginNormalColor', 'clGreen');

    OptionsContainer.ShowSearchStringNotFound := ReadBool('Options', 'ShowSearchStringNotFound', True);
    OptionsContainer.BeepIfSearchStringNotFound := ReadBool('Options', 'BeepIfSearchStringNotFound', True);
    OptionsContainer.InsertCaret := TSynEditCaretType(StrToInt(ReadString('Options', 'InsertCaret', '0')));
    OptionsContainer.NonblinkingCaretColor := ReadString('Options', 'NonblinkingCaretColor', 'clBlack');
    OptionsContainer.MinimapFontSize :=  StrToInt(ReadString('Options', 'MinimapFontSize', '3'));
    OptionsContainer.LineSpacing := StrToInt(ReadString('Options', 'LineSpacing', '0'));
    OptionsContainer.TabWidth := StrToInt(ReadString('Options', 'TabWidth', '2'));
    OptionsContainer.CompletionProposalEnabled := ReadBool('Options', 'CompletionProposalEnabled', True);
    OptionsContainer.CompletionProposalCaseSensitive := ReadBool('Options', 'CompletionProposalCaseSensitive', True);
    OptionsContainer.CompletionProposalShortcut := ReadString('Options', 'CompletionProposalShortcut', 'Ctrl+Space');
    OptionsContainer.DocCloseTabByDblClick := ReadBool('Options', 'DocCloseTabByDblClick', False);
    OptionsContainer.DocCloseTabByMiddleClick := ReadBool('Options', 'DocCloseTabByMiddleClick', False);
    OptionsContainer.DocDoubleBuffered := ReadBool('Options', 'DocDoubleBuffered', True);
    OptionsContainer.DocMultiLine := ReadBool('Options', 'DocMultiLine', False);
    OptionsContainer.DocSaveTabs:= ReadBool('Options', 'DocSaveTabs', True);
    OptionsContainer.DocShowCloseButton := ReadBool('Options', 'DocShowCloseButton', False);
    OptionsContainer.DocRightClickSelect := ReadBool('Options', 'DocRightClickSelect', True);
    OptionsContainer.DocShowImage := ReadBool('Options', 'DocShowImage', True);
    OptionsContainer.DirShowTreeLines:= ReadBool('Options', 'DirShowTreeLines', False);
    OptionsContainer.DirShowHiddenFiles:= ReadBool('Options', 'DirShowHiddenFiles', False);
    OptionsContainer.DirShowSystemFiles:= ReadBool('Options', 'DirShowSystemFiles', False);
    OptionsContainer.DirShowArchiveFiles:= ReadBool('Options', 'DirShowArchiveFiles', True);
    OptionsContainer.DirIndent := StrToInt(ReadString('Options', 'DirIndent', '20'));
    OptionsContainer.DirCloseTabByDblClick := ReadBool('Options', 'DirCloseTabByDblClick', False);
    OptionsContainer.DirCloseTabByMiddleClick := ReadBool('Options', 'DirCloseTabByMiddleClick', False);
    OptionsContainer.DirDoubleBuffered := ReadBool('Options', 'DirDoubleBuffered', True);
    OptionsContainer.DirMultiLine := ReadBool('Options', 'DirMultiLine', False);
    OptionsContainer.DirSaveTabs:= ReadBool('Options', 'DirSaveTabs', True);
    OptionsContainer.DirShowCloseButton := ReadBool('Options', 'DirShowCloseButton', False);
    OptionsContainer.DirRightClickSelect := ReadBool('Options', 'DirRightClickSelect', True);
    OptionsContainer.DirShowImage := ReadBool('Options', 'DirShowImage', True);
    OptionsContainer.OutputCloseTabByDblClick := ReadBool('Options', 'OutputCloseTabByDblClick', False);
    OptionsContainer.OutputCloseTabByMiddleClick := ReadBool('Options', 'OutputCloseTabByMiddleClick', False);
    OptionsContainer.OutputDoubleBuffered := ReadBool('Options', 'OutputDoubleBuffered', True);
    OptionsContainer.OutputMultiLine := ReadBool('Options', 'OutputMultiLine', False);
    OptionsContainer.OutputSaveTabs:= ReadBool('Options', 'OutputSaveTabs', True);
    OptionsContainer.OutputShowCloseButton := ReadBool('Options', 'OutputShowCloseButton', False);
    OptionsContainer.OutputRightClickSelect := ReadBool('Options', 'OutputRightClickSelect', True);
    OptionsContainer.OutputShowImage := ReadBool('Options', 'OutputShowImage', True);
    OptionsContainer.HTMLErrorChecking := ReadBool('Options', 'HTMLErrorChecking', True);
    OptionsContainer.HtmlVersion := TSynWebHtmlVersion(StrToInt(ReadString('Options', 'HTMLVersion', '4'))); { default: HTML5 }
    OptionsContainer.AutoIndent := ReadBool('Options', 'AutoIndent', True);
    OptionsContainer.AutoSave := ReadBool('Options', 'AutoSave', False);
    OptionsContainer.NonblinkingCaret := ReadBool('Options', 'NonblinkingCaret', False);
    OptionsContainer.UndoAfterSave := ReadBool('Options', 'UnfoAfterSave', False);
    OptionsContainer.TrimTrailingSpaces := ReadBool('Options', 'TrimTrailingSpaces', True);
    OptionsContainer.TripleClickRowSelect := ReadBool('Options', 'TripleClickRowSelect', True);
    OptionsContainer.ScrollPastEof := ReadBool('Options', 'ScrollPastEof', False);
    OptionsContainer.ScrollPastEol := ReadBool('Options', 'ScrollPastEol', True);
    OptionsContainer.TabsToSpaces := ReadBool('Options', 'TabsToSpaces', True);
    OptionsContainer.SmartTabs := ReadBool('Options', 'SmartTabs', False);
    OptionsContainer.SmartTabDelete := ReadBool('Options', 'SmartTabDelete', False);
    OptionsContainer.IgnoreCase := ReadBool('Options', 'IgnoreCase', True);
    OptionsContainer.IgnoreBlanks := ReadBool('Options', 'IgnoreBlanks', True);
    OptionsContainer.PersistentHotKeys := ReadBool('Options', 'PersistentHotKeys', False);
    OptionsContainer.Shadows := ReadBool('Options', 'Shadows', True);
    DeleteKey('Options', 'UseSystemFont'); { deprecated }
    OptionsContainer.MainMenuUseSystemFont := ReadBool('Options', 'MainMenuUseSystemFont', False);
    OptionsContainer.MainMenuFontName := ReadString('Options', 'MainMenuFontName', 'Tahoma');
    OptionsContainer.MainMenuFontSize := StrToInt(ReadString('Options', 'MainMenuFontSize', '8'));
    OptionsContainer.MainMenuSystemFontName := ReadString('Options', 'MainMenuSystemFontName', Screen.MenuFont.Name);
    OptionsContainer.MainMenuSystemFontSize := StrToInt(ReadString('Options', 'MainMenuSystemFontSize', IntToStr(Screen.MenuFont.Size)));
    OptionsContainer.PrintDocumentName := StrToInt(ReadString('Options', 'PrintDocumentName', '2'));
    OptionsContainer.PrintPageNumber := StrToInt(ReadString('Options', 'PrintPageNumber', '3'));
    OptionsContainer.PrintPrintedBy := StrToInt(ReadString('Options', 'PrintPrintedBy', '0'));
    OptionsContainer.PrintDateTime :=  StrToInt(ReadString('Options', 'PrintDateTime', '1'));
    OptionsContainer.PrintShowHeaderLine := ReadBool('Options', 'PrintShowHeaderLine', True);
    OptionsContainer.PrintShowFooterLine := ReadBool('Options', 'PrintShowFooterLine', True);
    OptionsContainer.PrintShowLineNumbers := ReadBool('Options', 'PrintShowLineNumbers', False);
    OptionsContainer.PrintWordWrapLine := ReadBool('Options', 'PrintWordWrapLine', False);
    OptionsContainer.AnimationStyle := TAnimationStyle(StrToInt(ReadString('Options', 'AnimationStyle', '1')));
    OptionsContainer.AnimationDuration := StrToInt(ReadString('Options', 'AnimationDuration', '150'));
    OptionsContainer.StatusBarUseSystemFont := ReadBool('Options', 'StatusBarUseSystemFont', False);
    OptionsContainer.StatusBarFontName := ReadString('Options', 'StatusBarFontName', 'Tahoma');
    OptionsContainer.StatusBarFontSize := StrToInt(ReadString('Options', 'StatusBarFontSize', '8'));
    OptionsContainer.ShowXMLTree := ReadBool('Options', 'ShowXMLTree', True);
    OptionsContainer.EnableWordWrap := ReadBool('Options', 'EnableWordWrap', False);
    OptionsContainer.EnableLineNumbers := ReadBool('Options', 'EnableLineNumbers', True);
    OptionsContainer.EnableSpecialChars := ReadBool('Options', 'EnableSpecialChars', False);
    OptionsContainer.EnableSelectionMode := ReadBool('Options', 'EnableSelectionMode', False);
    OptionsContainer.OutputShowTreeLines:= ReadBool('Options', 'OutputShowTreeLines', False);
    OptionsContainer.OutputIndent := StrToInt(ReadString('Options', 'OutputIndent', '20'));
    { FileTypes }
    ReadSectionValues('FileTypes', FileTypes);
    for i := 0 to FileTypes.Count - 1 do
    begin
      j := Pos('=', FileTypes.Strings[i]);
      s := System.Copy(FileTypes.Strings[i], j + 1, Pos('(', FileTypes.Strings[i]) - j - 2);
      { search file type }
      for j := 0 to OptionsContainer.FileTypes.Count - 1 do
        if Pos(s, OptionsContainer.FileTypes.Strings[j]) = 1 then
        begin
          OptionsContainer.FileTypes.Strings[j] := System.Copy(FileTypes.Strings[i],
            Pos('=', FileTypes.Strings[i]) + 1, Length(FileTypes.Strings[i]));
          Break;
        end;
    end;
    {for i := 0 to FileTypes.Count - 1 do
      OptionsContainer.FileTypes.Strings[i] := System.Copy
        (FileTypes.Strings[i], Pos('=', FileTypes.Strings[i]) + 1, Length
          (FileTypes.Strings[i]));}
    OptionsContainer.SQLDialect := TSQLDialect(StrToInt(ReadString('Options', 'SQLDialect', '0')));
    OptionsContainer.CPASHighlighter := TCPASHighlighter(StrToInt(ReadString('Options', 'CPASHighlighter', '0')));
    OptionsContainer.CSSVersion := TSynWebCssVersion(StrToInt(ReadString('Options', 'CSSVersion', '2')));
    OptionsContainer.PHPVersion := TSynWebPhpVersion(StrToInt(ReadString('Options', 'PHPVersion', '1')));
    OptionsContainer.DefaultEncoding := StrToInt(ReadString('Options', 'DefaultEncoding', '1'));
    OptionsContainer.DefaultHighlighter := StrToInt(ReadString('Options', 'DefaultHighlighter', '52'));
    { Tool Bar }
    OptionsContainer.ToolBarStandard := ReadBool('ActionToolBar', 'Standard', True);
    OptionsContainer.ToolBarPrint := ReadBool('ActionToolBar', 'Print', True);
    OptionsContainer.ToolBarDirectory := ReadBool('ActionToolBar', 'Directory', True);
    OptionsContainer.ToolBarIndent := ReadBool('ActionToolBar', 'Indent', True);
    OptionsContainer.ToolBarSort := ReadBool('ActionToolBar', 'Sort', True);
    OptionsContainer.ToolBarCase := ReadBool('ActionToolBar', 'Case', True);
    OptionsContainer.ToolBarCommand := ReadBool('ActionToolBar', 'Command', True);
    OptionsContainer.ToolBarSearch := ReadBool('ActionToolBar', 'Search', True);
    OptionsContainer.ToolBarMode := ReadBool('ActionToolBar', 'Mode', True);
    OptionsContainer.ToolBarTools := ReadBool('ActionToolBar', 'Tools', True);
    OptionsContainer.ToolBarMacro := ReadBool('ActionToolBar', 'Macro', True);
    OptionsContainer.ToolBarDocument := ReadBool('ActionToolBar', 'Document', True);
  finally
    FileTypes.Free;
    Free;
  end;
end;

function TDocumentFrame.ReadIniOpenFiles: Boolean;
var
  i: Integer;
  FName: string;
  FileNames, Bookmarks, Minimaps: TStrings;
  SynEdit: TBCSynEdit;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  FileNames := TStringList.Create;
  Bookmarks := TStringList.Create;
  Minimaps := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    PageControl.Visible := False;
    { Open Files }
    ReadSectionValues('OpenFiles', FileNames);
    ReadSectionValues('Bookmarks', Bookmarks);
    for i := 0 to FileNames.Count - 1 do
    begin
      FName := System.Copy(FileNames.Strings[i], Pos('=', FileNames.Strings[i]) + 1, Length(FileNames.Strings[i]));
      if FileExists(FName) then
        Open(FName, Bookmarks, 0, 0, True);
    end;
    { Minimaps }
    ReadSectionValues('Minimaps', Minimaps);
    for i := 0 to Minimaps.Count - 1 do
    if Pos('=1', Minimaps.Strings[i]) <> 0 then
    begin
      DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
      if Assigned(DocTabSheetFrame) then
        DocTabSheetFrame.MinimapVisible := True;
    end;

    i := ReadInteger('Options', 'ActivePageIndex', 0);
    if i < PageControl.PageCount then
    begin
      PageControl.ActivePageIndex := i;
      SynEdit := GetActiveSynEdit;
      SetMainHighlighterCombo(SynEdit);
      SetMainEncodingCombo(SynEdit);
    end;

    Result := FileNames.Count > 0;
  finally
    FileNames.Free;
    Bookmarks.Free;
    Minimaps.Free;
    Free;
    PageControl.Visible := True;
  end;
end;

procedure TDocumentFrame.WriteIniFile;
var
  i, j: Integer;
  FileType: string;
  SynEdit: TBCSynEdit;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    { Options }
    WriteString('Options', 'FontName', OptionsContainer.FontName);
    WriteString('Options', 'FontSize', IntToStr(OptionsContainer.FontSize));
    WriteString('Options', 'MarginFontName', OptionsContainer.MarginFontName);
    WriteString('Options', 'MarginFontSize', IntToStr(OptionsContainer.MarginFontSize));
    WriteString('Options', 'RightMargin', IntToStr(OptionsContainer.MarginRightMargin));
    DeleteKey('Options', 'MarginAutoSize');
    WriteBool('Options', 'MarginLeftMarginAutoSize', OptionsContainer.MarginLeftMarginAutoSize);
    DeleteKey('Options', 'MarginWidth');
    WriteString('Options', 'MarginLeftMarginWidth', IntToStr(OptionsContainer.MarginLeftMarginWidth));
    WriteBool('Options', 'MarginVisibleRightMargin', OptionsContainer.MarginVisibleRightMargin);

    WriteBool('Options', 'MarginInTens', OptionsContainer.MarginInTens);
    WriteBool('Options', 'MarginZeroStart', OptionsContainer.MarginZeroStart);
    WriteBool('Options', 'MarginLineModified', OptionsContainer.MarginLineModified);
    WriteString('Options', 'MarginModifiedColor', OptionsContainer.MarginModifiedColor);
    WriteString('Options', 'MarginNormalColor', OptionsContainer.MarginNormalColor);

    WriteBool('Options', 'ShowSearchStringNotFound', OptionsContainer.ShowSearchStringNotFound);
    WriteBool('Options', 'BeepIfSearchStringNotFound', OptionsContainer.BeepIfSearchStringNotFound);

    DeleteKey('Options', 'ExtraLineSpacing'); { deprecated }

    WriteString('Options', 'LineSpacing', IntToStr(OptionsContainer.LineSpacing));
    WriteString('Options', 'TabWidth', IntToStr(OptionsContainer.TabWidth));
    WriteString('Options', 'ActiveLineColorBrightness', IntToStr(OptionsContainer.ColorBrightness));
    DeleteKey('Options', 'MarginVisible');
    WriteBool('Options', 'MarginVisibleLeftMargin', OptionsContainer.MarginVisibleLeftMargin);
    WriteBool('Options', 'MarginShowBookmarks', OptionsContainer.MarginShowBookmarks);
    WriteString('Options', 'InsertCaret', IntToStr(Ord(OptionsContainer.InsertCaret)));
    WriteString('Options', 'NonblinkingCaretColor', OptionsContainer.NonblinkingCaretColor);
    DeleteKey('Options', 'MinimapFontFactor'); { deprecated }
    WriteString('Options', 'MinimapFontSize', IntToStr(OptionsContainer.MinimapFontSize));
    WriteBool('Options', 'CompletionProposalEnabled', OptionsContainer.CompletionProposalEnabled);
    WriteBool('Options', 'CompletionProposalCaseSensitive', OptionsContainer.CompletionProposalCaseSensitive);
    WriteString('Options', 'CompletionProposalShortcut', OptionsContainer.CompletionProposalShortcut);
    WriteBool('Options', 'DocCloseTabByDblClick', OptionsContainer.DocCloseTabByDblClick);
    WriteBool('Options', 'DocCloseTabByMiddleClick', OptionsContainer.DocCloseTabByMiddleClick);
    WriteBool('Options', 'DocDoubleBuffered', OptionsContainer.DocDoubleBuffered);
    WriteBool('Options', 'DocMultiLine', OptionsContainer.DocMultiLine);
    WriteBool('Options', 'DocSaveTabs', OptionsContainer.DocSaveTabs);
    WriteBool('Options', 'DocShowCloseButton', OptionsContainer.DocShowCloseButton);
    WriteBool('Options', 'DocRightClickSelect', OptionsContainer.DocRightClickSelect);
    WriteBool('Options', 'DocShowImage', OptionsContainer.DocShowImage);
    WriteBool('Options', 'DirShowTreeLines', OptionsContainer.DirShowTreeLines);
    WriteBool('Options', 'DirShowHiddenFiles', OptionsContainer.DirShowHiddenFiles);
    WriteBool('Options', 'DirShowSystemFiles', OptionsContainer.DirShowSystemFiles);
    WriteBool('Options', 'DirShowArchiveFiles', OptionsContainer.DirShowArchiveFiles);
    WriteString('Options', 'DirIndent', IntToStr(OptionsContainer.DirIndent));
    WriteBool('Options', 'DirCloseTabByDblClick', OptionsContainer.DirCloseTabByDblClick);
    WriteBool('Options', 'DirCloseTabByMiddleClick', OptionsContainer.DirCloseTabByMiddleClick);
    WriteBool('Options', 'DirDoubleBuffered', OptionsContainer.DirDoubleBuffered);
    WriteBool('Options', 'DirMultiLine', OptionsContainer.DirMultiLine);
    WriteBool('Options', 'DirSaveTabs', OptionsContainer.DirSaveTabs);
    WriteBool('Options', 'DirShowCloseButton', OptionsContainer.DirShowCloseButton);
    WriteBool('Options', 'DirRightClickSelect', OptionsContainer.DirRightClickSelect);
    WriteBool('Options', 'DirShowImage', OptionsContainer.DirShowImage);
    WriteBool('Options', 'OutputCloseTabByDblClick', OptionsContainer.OutputCloseTabByDblClick);
    WriteBool('Options', 'OutputCloseTabByMiddleClick', OptionsContainer.OutputCloseTabByMiddleClick);
    WriteBool('Options', 'OutputDoubleBuffered', OptionsContainer.OutputDoubleBuffered);
    WriteBool('Options', 'OutputMultiLine', OptionsContainer.OutputMultiLine);
    WriteBool('Options', 'OutputSaveTabs', OptionsContainer.OutputSaveTabs);
    WriteBool('Options', 'OutputShowCloseButton', OptionsContainer.OutputShowCloseButton);
    WriteBool('Options', 'OutputRightClickSelect', OptionsContainer.OutputRightClickSelect);
    WriteBool('Options', 'HTMLErrorChecking', OptionsContainer.HTMLErrorChecking);
    WriteString('Options', 'HTMLVersion', IntToStr(Ord(OptionsContainer.HtmlVersion)));
    WriteBool('Options', 'AutoIndent', OptionsContainer.AutoIndent);
    WriteBool('Options', 'AutoSave', OptionsContainer.AutoSave);
    WriteBool('Options', 'NonblinkingCaret', OptionsContainer.NonblinkingCaret);
    WriteBool('Options', 'UndoAfterSave', OptionsContainer.UndoAfterSave);
    WriteBool('Options', 'TrimTrailingSpaces', OptionsContainer.TrimTrailingSpaces);
    WriteBool('Options', 'TripleClickRowSelect', OptionsContainer.TripleClickRowSelect);
    WriteBool('Options', 'ScrollPastEof', OptionsContainer.ScrollPastEof);
    WriteBool('Options', 'ScrollPastEol', OptionsContainer.ScrollPastEol);
    WriteBool('Options', 'TabsToSpaces', OptionsContainer.TabsToSpaces);
    WriteBool('Options', 'SmartTabs', OptionsContainer.SmartTabs);
    WriteBool('Options', 'SmartTabDelete', OptionsContainer.SmartTabDelete);
    WriteBool('Options', 'IgnoreCase', OptionsContainer.IgnoreCase);
    WriteBool('Options', 'IgnoreBlanks', OptionsContainer.IgnoreBlanks);
    WriteBool('Options', 'PersistentHotKeys', OptionsContainer.PersistentHotKeys);
    WriteBool('Options', 'Shadows', OptionsContainer.Shadows);
    WriteBool('Options', 'MainMenuUseSystemFont', OptionsContainer.MainMenuUseSystemFont);
    WriteString('Options', 'MainMenuFontName', OptionsContainer.MainMenuFontName);
    WriteString('Options', 'MainMenuFontSize', IntToStr(OptionsContainer.MainMenuFontSize));
    WriteString('Options', 'MainMenuSystemFontName', OptionsContainer.MainMenuSystemFontName);
    WriteString('Options', 'MainMenuSystemFontSize', IntToStr(OptionsContainer.MainMenuSystemFontSize));
    WriteString('Options', 'PrintDocumentName', IntToStr(OptionsContainer.PrintDocumentName));
    WriteString('Options', 'PrintPageNumber', IntToStr(OptionsContainer.PrintPageNumber));
    WriteString('Options', 'PrintPrintedBy', IntToStr(OptionsContainer.PrintPrintedBy));
    WriteString('Options', 'PrintDateTime', IntToStr(OptionsContainer.PrintDateTime));
    WriteBool('Options', 'PrintShowHeaderLine', OptionsContainer.PrintShowHeaderLine);
    WriteBool('Options', 'PrintShowFooterLine', OptionsContainer.PrintShowFooterLine);
    WriteBool('Options', 'PrintShowLineNumbers', OptionsContainer.PrintShowLineNumbers);
    WriteBool('Options', 'PrintWordWrapLine', OptionsContainer.PrintWordWrapLine);
    WriteString('Options', 'AnimationStyle', IntToStr(Ord(OptionsContainer.AnimationStyle)));
    WriteString('Options', 'AnimationDuration', IntToStr(OptionsContainer.AnimationDuration));
    WriteBool('Options', 'StatusBarUseSystemFont', OptionsContainer.StatusBarUseSystemFont);
    WriteString('Options', 'StatusBarFontName', OptionsContainer.StatusBarFontName);
    WriteString('Options', 'StatusBarFontSize', IntToStr(OptionsContainer.StatusBarFontSize));
    WriteBool('Options', 'OutputShowTreeLines', OptionsContainer.OutputShowTreeLines);
    WriteBool('Options', 'OutputShowImage', OptionsContainer.OutputShowImage);
    WriteString('Options', 'OutputIndent', IntToStr(OptionsContainer.OutputIndent));
    EraseSection('OpenFiles');
    EraseSection('Bookmarks');
    { Open documents and bookmarks }
    if OptionsContainer.DocSaveTabs then
    for i := 0 to PageControl.PageCount - 1 do
    begin
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) then
      begin
        if Trim(SynEdit.DocumentName) <> '' then
          WriteString('OpenFiles', IntToStr(i), SynEdit.DocumentName);
        for j := 0 to SynEdit.Marks.Count - 1 do
          WriteString('Bookmarks', Format('%s:%s', [SynEdit.DocumentName, IntToStr(j)]),
            Format('%s;%s;%s', [IntToStr(SynEdit.Marks.Items[j].BookmarkNumber),
            IntToStr(SynEdit.Marks.Items[j].Line), IntToStr(SynEdit.Marks.Items[j].Char)]));
      end;
    end;
    { Minimaps }
    EraseSection('Minimaps');
    if OptionsContainer.DocSaveTabs then
    for i := 0 to PageControl.PageCount - 1 do
    begin
      DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
      if Assigned(DocTabSheetFrame) then
        WriteBool('Minimaps', IntToStr(i), DocTabSheetFrame.MinimapVisible);
    end;
    { Active document }
    WriteInteger('Options', 'ActivePageIndex', PageControl.ActivePageIndex);
    EraseSection('FileTypes');
    { FileTypes }
    for i := 0 to OptionsContainer.FileTypes.Count - 1 do
    begin
      FileType := Trim(System.Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
        Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
      WriteString('FileTypes', IntToStr(i), Format('%s (%s)', [
        FileType, StringBetween(OptionsContainer.FileTypes.Strings[i], '(', ')')]));
    end;
    WriteString('Options', 'SQLDialect', IntToStr(Ord(OptionsContainer.SQLDialect)));
    WriteString('Options', 'CPASHighlighter', IntToStr(Ord(OptionsContainer.CPASHighlighter)));
    WriteString('Options', 'CSSVersion', IntToStr(Ord(OptionsContainer.CSSVersion)));
    WriteString('Options', 'PHPVersion', IntToStr(Ord(OptionsContainer.PHPVersion)));
    WriteString('Options', 'DefaultEncoding', IntToStr(OptionsContainer.DefaultEncoding));
    WriteString('Options', 'DefaultHighlighter', IntToStr(OptionsContainer.DefaultHighlighter));
  finally
    Free;
  end;
end;

function TDocumentFrame.InsertTag: Boolean;
var
  SynEdit: TBCSynEdit;
  TagName: string;
begin
  Result := InsertTagDialog(Self).Execute;
  if Result then
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) then
    begin
      TagName := InsertTagDialog(Self).TagName;
      SynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(Format('<%s></%s>', [TagName, TagName])));
      SynEdit.CaretX := SynEdit.CaretX - Length(TagName) - 3; { -3 from </> }
    end;
  end;
end;

procedure TDocumentFrame.InsertDateAndTime;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(DateTimeToStr(Now)));
end;

function TDocumentFrame.Options: Boolean;
var
  i: Integer;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := OptionsDialog.Execute(OptionsContainer);

  if Result then
  begin
    { assign to every synedit }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
      if Assigned(DocTabSheetFrame) then
      begin
        OptionsContainer.AssignTo(DocTabSheetFrame.SynEdit);
        OptionsContainer.AssignTo(DocTabSheetFrame.SplitSynEdit);
        { file types might have changed }
        SelectHighlighter(DocTabSheetFrame, DocTabSheetFrame.SynEdit.DocumentName);
      end;
    end;
    UpdateMarginAndControls;
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
      SetMainHighlighterCombo(DocTabSheetFrame.SynEdit);
    WriteIniFile;
  end;
end;

function TDocumentFrame.GetDocTabSheetFrame(TabSheet: TTabSheet): TDocTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TDocTabSheetFrame then
        Result := TDocTabSheetFrame(TabSheet.Components[0]);
end;

function TDocumentFrame.GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TCompareFrame then
        Result := TCompareFrame(TabSheet.Components[0]);
end;

function TDocumentFrame.GetSplitSynEdit(TabSheet: TTabSheet): TBCSynEdit;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := nil;
  DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
    if DocTabSheetFrame.SplitVisible then
      Result := DocTabSheetFrame.SplitSynEdit;
end;

function TDocumentFrame.GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := nil;
  DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.SynEdit;
end;

procedure TDocumentFrame.GotoBookmarks(ItemIndex: Integer);
var
  SynEdit: TBCSynEdit;
  SynEditorCommand: TSynEditorCommand;
begin
  SynEditorCommand := ecNone;
  case ItemIndex of
    0: SynEditorCommand := ecGotoMarker0;
    1: SynEditorCommand := ecGotoMarker1;
    2: SynEditorCommand := ecGotoMarker2;
    3: SynEditorCommand := ecGotoMarker3;
    4: SynEditorCommand := ecGotoMarker4;
    5: SynEditorCommand := ecGotoMarker5;
    6: SynEditorCommand := ecGotoMarker6;
    7: SynEditorCommand := ecGotoMarker7;
    8: SynEditorCommand := ecGotoMarker8;
    9: SynEditorCommand := ecGotoMarker9;
  end;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(ItemIndex), nil);
end;

procedure TDocumentFrame.GotoLineActionExecute(Sender: TObject);
begin
  try
    GetActiveSynEdit.CaretY := StrToInt(GotoLineNumberEdit.Text);
  except
    { silent }
  end;
end;

procedure TDocumentFrame.GotoLine;
begin
  GotoLinePanel.Visible := not GotoLinePanel.Visible;
  if GotoLinePanel.Visible then
    if GotoLineNumberEdit.CanFocus then
      GotoLineNumberEdit.SetFocus;
end;

procedure TDocumentFrame.GotoLineClearActionExecute(Sender: TObject);
begin
  GotoLineNumberEdit.Text := '';
end;

procedure TDocumentFrame.GotoLineCloseActionExecute(Sender: TObject);
begin
  GotoLinePanel.Hide;
end;

procedure TDocumentFrame.GotoLineNumberEditChange(Sender: TObject);
begin
  GotoLineNumberEdit.RightButton.Visible := Trim(GotoLineNumberEdit.Text) <> '';
end;

procedure TDocumentFrame.GotoLineNumberEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GotoLineAction.Execute;
end;

function TDocumentFrame.GetActiveSplitSynEdit: TBCSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSplitSynEdit(PageControl.ActivePage)
  else
    Result := nil;
end;

function TDocumentFrame.GetActiveSynEdit: TBCSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSynEdit(PageControl.ActivePage)
  else
    Result := nil;
end;

procedure TDocumentFrame.SetActivePageCaptionModified;
begin
  PageControl.ActivePageCaption := FormatFileName(PageControl.ActivePageCaption, True);
end;

procedure TDocumentFrame.SynEditOnChange(Sender: TObject);
var
  ActiveSynEdit: TBCSynEdit;
  DocTabSheetFrame: TDocTabSheetFrame;

  procedure LinesChange(SynEdit: TBCSynEdit);
  var
    i: Integer;
  begin
    if Assigned(SynEdit) then
    begin
      SynEdit.BeginUpdate;

      while SynEdit.Lines.Count > ActiveSynEdit.Lines.Count do
        SynEdit.Lines.Delete(SynEdit.Lines.Count);
      while SynEdit.Lines.Count < ActiveSynEdit.Lines.Count do
        SynEdit.Lines.Add('');
      for i := 0 to SynEdit.Lines.Count - 1 do
        if ActiveSynEdit.Lines[i] <> SynEdit.Lines[i] then
          SynEdit.Lines[i] := ActiveSynEdit.Lines[i];
      SynEdit.EndUpdate;
      SynEdit.Repaint;
    end;
  end;

begin
  inherited;
  FModifiedDocuments := True;

  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;

  if Assigned(PageControl.ActivePage) then
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
    begin
      ActiveSynEdit := DocTabSheetFrame.SynEdit;
      if DocTabSheetFrame.SplitVisible then
        LinesChange(DocTabSheetFrame.SplitSynEdit);
      if DocTabSheetFrame.MinimapVisible then
        LinesChange(DocTabSheetFrame.SplitSynEditMinimap);
    end;
  end;
end;

procedure TDocumentFrame.SynEditSplitOnChange(Sender: TObject);
{var
  i: Integer;
  SynEdit, SplitSynEdit: TBCSynEdit;
begin
  inherited;
  SynEdit := GetActiveSynEdit;

  if OptionsContainer.AutoSave then
    Save
  else
    SetActivePageCaptionModified;

  SplitSynEdit := GetActiveSplitSynEdit;
  if Assigned(SplitSynEdit) then
  begin
    SynEdit.BeginUpdate;
    while SynEdit.Lines.Count > SplitSynEdit.Lines.Count do
      SynEdit.Lines.Delete(SynEdit.Lines.Count);
    while SynEdit.Lines.Count < SplitSynEdit.Lines.Count do
      SynEdit.Lines.Add('');
    for i := 0 to SplitSynEdit.Lines.Count - 1 do
      if SynEdit.Lines[i] <> SplitSynEdit.Lines[i] then
        SynEdit.Lines[i] := SplitSynEdit.Lines[i];
    SynEdit.EndUpdate;
  end;
  SynEdit.Repaint;
end; }
var
  ActiveSynEdit: TBCSynEdit;
  DocTabSheetFrame: TDocTabSheetFrame;

  procedure LinesChange(SynEdit: TBCSynEdit);
  var
    i: Integer;
  begin
    if Assigned(SynEdit) then
    begin
      SynEdit.BeginUpdate;
      SynEdit.Modified := True;
      while SynEdit.Lines.Count > ActiveSynEdit.Lines.Count do
        SynEdit.Lines.Delete(SynEdit.Lines.Count);
      while SynEdit.Lines.Count < ActiveSynEdit.Lines.Count do
        SynEdit.Lines.Add('');
      for i := 0 to SynEdit.Lines.Count - 1 do
        if ActiveSynEdit.Lines[i] <> SynEdit.Lines[i] then
          SynEdit.Lines[i] := ActiveSynEdit.Lines[i];
      SynEdit.EndUpdate;
      SynEdit.Repaint;
    end;
  end;

begin
  inherited;
  FModifiedDocuments := True;

  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;

  if Assigned(PageControl.ActivePage) then
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
    begin
      ActiveSynEdit := DocTabSheetFrame.SplitSynEdit;
      if DocTabSheetFrame.SplitVisible then
        LinesChange(DocTabSheetFrame.SynEdit);
      if DocTabSheetFrame.MinimapVisible then
        LinesChange(DocTabSheetFrame.SynEditMinimap);
    end;
  end;
end;

function TDocumentFrame.GetActiveTabSheetCaption: string;
begin
  Result := '';
  
  if Assigned(PageControl.ActivePage) then
    Result := PageControl.ActivePageCaption;
end;

function TDocumentFrame.GetActiveDocumentFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;

  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) then
      Result := True;
  end;
end;

function TDocumentFrame.GetActiveDocumentName: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
        Result := FormatFileName(SynEdit.DocumentName, SynEdit.Modified);
  end;
end;

function TDocumentFrame.GetOpenTabSheets: Boolean;
begin
  Result := PageControl.PageCount > 0;
end;

function TDocumentFrame.GetOpenTabSheetCount: Integer;
begin
  Result := PageControl.PageCount;
end;

function TDocumentFrame.GetModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := True;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    if CheckActive or ((PageControl.ActivePageIndex = i) and not CheckActive) then
    begin
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) then
        if SynEdit.Modified then
          Exit;
    end;
  end;
  Result := False;
end;

function TDocumentFrame.GetSelectionFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelAvail;

  SynEdit := GetActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or SynEdit.SelAvail;
end;

function TDocumentFrame.GetCanUndo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.UndoList.ItemCount > 0;

  SynEdit := GetActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or (SynEdit.UndoList.ItemCount > 0);
end;

function TDocumentFrame.GetCanRedo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.RedoList.ItemCount > 0;

  SynEdit := GetActiveSplitSynEdit;
  if Assigned(SynEdit) then
    Result := Result or (SynEdit.RedoList.ItemCount > 0);
end;

procedure TDocumentFrame.SynEditorReplaceText(Sender: TObject; const ASearch,
  AReplace: UnicodeString; Line, Column: Integer;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
  SynEdit: TBCSynEdit;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    SynEdit := GetActiveSynEdit;
    APos := SynEdit.ClientToScreen(SynEdit.RowColumnToPixels
        (SynEdit.BufferToDisplayPos(BufferCoord(Column, Line))));

    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y, APos.Y + SynEdit.LineHeight,
      ASearch);
    try
      case ConfirmReplaceDialog.ShowModal of
        mrYes:
          Action := raReplace;
        mrYesToAll:
          Action := raReplaceAll;
        mrNo:
          Action := raSkip;
      else
        Action := raCancel;
      end;
    finally
      ConfirmReplaceDialog.Free;
    end;
  end;
end;

procedure TDocumentFrame.SynEditHTMLPaintTransient
  (Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
const
  Tokens: array [0 .. 15] of TSynTokenMatch =
    ((OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkCssSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkEsSymbol)),
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(stkPhpSymbol)),
    (OpenToken: '<'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<'; CloseToken: '/>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '</'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<!'; CloseToken: '>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<![cdata['; CloseToken: ']]>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<?'; CloseToken: '?>'; TokenKind: Integer(stkMLTag)),
    (OpenToken: '<%'; CloseToken: '%>'; TokenKind: Integer(stkMLTag)));
var
  Editor: TSynEdit;
  Pix: TPoint;
  Match: TSynTokenMatched;
  i: Integer;
  LStyles: TCustomStyleServices;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

  function TryMatch: Integer;
  begin
    Result := SynEditGetMatchingTagEx(Editor, Editor.CaretXY, Match);
    if Result = 0 then
      Result := SynEditGetMatchingTokenEx
        (Editor, Editor.CaretXY, Tokens, Match);
  end;

begin
  LStyles := StyleServices;
  Editor := TSynEdit(Sender);
  if TransientType = ttBefore then
  begin
    i := TryMatch;
    if i = 0 then
      Exit;
    if i <> -1 then
      Editor.InvalidateLines(Match.OpenTokenPos.Line, Match.OpenTokenPos.Line);
    if i <> 1 then
      Editor.InvalidateLines(Match.CloseTokenPos.Line,
        Match.CloseTokenPos.Line);
    Exit;
  end;
  if Editor.SelAvail then
    Exit;
  i := TryMatch;
  if i = 0 then
    Exit;
  Canvas.Brush.Style := bsSolid;
  if Abs(i) = 2 then
    Canvas.Brush.Color := clAqua // matched color
  else
    Canvas.Brush.Color := clYellow; // unmatched color
  if i <> -1 then
  begin
    Pix := CharToPixels(Match.OpenTokenPos);
    if LStyles.GetStyleColor(scEdit) <> clWhite then
      Canvas.Font.Color := clBlack
    else
      Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.OpenToken);
  end;
  if i <> 1 then
  begin
    Pix := CharToPixels(Match.CloseTokenPos);
    if LStyles.GetStyleColor(scEdit) <> clWhite then
      Canvas.Font.Color := clBlack
    else
      Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.CloseToken);
  end;
end;

procedure TDocumentFrame.SynEditPASPaintTransient
  (Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);

const
  PasTokens: array [0 .. 14] of TSynTokenMatch =
    ((OpenToken: '('; CloseToken: ')'; TokenKind: Integer
        (SynHighlighterPas.tkSymbol)), (OpenToken: '['; CloseToken: ']';
      TokenKind: Integer(SynHighlighterPas.tkSymbol)), (OpenToken: 'begin';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'class'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'interface';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'record'; CloseToken: 'end'; TokenKind: Integer
        (SynHighlighterPas.tkKey)), (OpenToken: 'case'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'asm';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'try'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'implementation'; CloseToken: 'end';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'package';
      CloseToken: 'end'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'for'; CloseToken: 'do';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'repeat';
      CloseToken: 'until'; TokenKind: Integer(SynHighlighterPas.tkKey)),
    (OpenToken: 'while'; CloseToken: 'do';
      TokenKind: Integer(SynHighlighterPas.tkKey)), (OpenToken: 'if';
      CloseToken: 'then'; TokenKind: Integer(SynHighlighterPas.tkKey)));

var
  Editor: TSynEdit;
  Pix: TPoint;
  Match: TSynTokenMatched;
  i: Integer;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

begin
  Editor := TSynEdit(Sender);
  if TransientType = ttBefore then
  begin
    i := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, PasTokens, Match);
    if i = 0 then
      Exit;
    if i <> -1 then
      Editor.InvalidateLines(Match.OpenTokenPos.Line, Match.OpenTokenPos.Line);
    if i <> 1 then
      Editor.InvalidateLines(Match.CloseTokenPos.Line,
        Match.CloseTokenPos.Line);
    Exit;
  end;
  if Editor.SelAvail then
    Exit;
  i := SynEditGetMatchingTokenEx(Editor, Editor.CaretXY, PasTokens, Match);
  if i = 0 then
    Exit;
  Canvas.Brush.Style := bsSolid;
  if Abs(i) = 2 then
    Canvas.Brush.Color := clAqua // matched color
  else
    Canvas.Brush.Color := clYellow; // unmatched color
  if i <> -1 then
  begin
    Pix := CharToPixels(Match.OpenTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.OpenToken);
  end;
  if i <> 1 then
  begin
    Pix := CharToPixels(Match.CloseTokenPos);
    Canvas.Font.Color := Editor.Font.Color;
    Canvas.Font.Style := Match.TokenAttri.Style;
    Canvas.TextOut(Pix.X, Pix.Y, Match.CloseToken);
  end;
end;

function TDocumentFrame.GetHTMLErrors: TList;
begin
  Result := nil;
  if FHTMLDocumentChanged then
  begin
    FHTMLDocumentChanged := False;
    Result := FHTMLErrorList;
  end;
end;

procedure TDocumentFrame.CheckHTMLErrors;
var
  i: Integer;
  SynWebBase: TSynWebBase;
  DocTabSheetFrame: TDocTabSheetFrame;

  procedure AddError(S: WideString);
  var
    OutputObject: POutputRec;
  begin
    s := Format(S, [SynWebBase.GetToken]);

    System.New(OutputObject);
    if DocTabSheetFrame.SynEdit.DocumentName <> '' then
      OutputObject.FileName := DocTabSheetFrame.SynEdit.DocumentName
    else
      OutputObject.FileName := FormatFileName(PageControl.ActivePageCaption);
    OutputObject.Ln := i + 1;
    OutputObject.Ch := SynWebBase.GetTokenPos + 1;
    OutputObject.Text := s;

    FHTMLErrorList.Add(OutputObject);
  end;

begin
  if not OptionsContainer.HTMLErrorChecking then
    Exit;

  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if not Assigned(DocTabSheetFrame) then
    Exit;

  DestroyHTMLErrorListItems;

  SynWebEngine.Options.HtmlVersion := DocTabSheetFrame.SynEdit.HtmlVersion;

  if DocTabSheetFrame.SynEdit.Highlighter is TSynWebBase then
  begin
    SynWebBase := TSynWebBase(DocTabSheetFrame.SynEdit.Highlighter);
    SynWebBase.ResetRange;
    i := 0;
    while i < DocTabSheetFrame.SynEdit.Lines.Count do
    begin
      SynWebBase.SetLine(DocTabSheetFrame.SynEdit.Lines[i], i + 1);
      while not SynWebBase.GetEol do
      begin
        case SynWebBase.GetTokenID of
          stkMLTagNameUndef:
            AddError(LanguageDataModule.GetConstant('InvalidHTMLTag'));
          stkMLTagKeyUndef:
            AddError(LanguageDataModule.GetConstant('InvalidHTMLAttribute'));
          stkMLError:
            AddError(LanguageDataModule.GetConstant('InvalidHTMLToken'));

          stkCssSelectorUndef:
            AddError(LanguageDataModule.GetConstant('InvalidCSSSelector'));
          stkCssPropUndef:
            AddError(LanguageDataModule.GetConstant('InvalidCSSProperty'));
          stkCssValUndef:
            AddError(LanguageDataModule.GetConstant('InvalidCSSValue'));
          stkCssError:
            AddError(LanguageDataModule.GetConstant('InvalidCSSToken'));

          stkEsError:
            AddError(LanguageDataModule.GetConstant('InvalidJSToken'));

          stkPhpError:
            AddError(LanguageDataModule.GetConstant('InvalidPHPToken'));
        end;
        SynWebBase.Next;
      end;
      Inc(i);
    end;
  end;
end;

procedure TDocumentFrame.SynEditHTMLOnChange(Sender: TObject);
begin
  inherited;
  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;
  FModifiedDocuments := True;
  FHTMLDocumentChanged := True;
  CheckHTMLErrors;
end;

function TDocumentFrame.GetCaretInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  Result := Format('%d: %d', [SynEdit.CaretY, SynEdit.CaretX]);
end;

function TDocumentFrame.GetModifiedInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
    Result := LanguageDataModule.GetConstant('Modified');
end;

function TDocumentFrame.GetActiveDocumentModified: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  Result := Assigned(SynEdit) and SynEdit.Modified;
end;

procedure TDocumentFrame.NextPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex + 1;
    if i >= PageControl.PageCount then
      i := 0;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TDocumentFrame.PreviousPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex - 1;
    if i < 0 then
      i := PageControl.PageCount - 1;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TDocumentFrame.CheckFileDateTimes;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  FileDateTime: TDateTime;
  DialogResult: Integer;
begin
  DialogResult := mrNo;
  if FProcessing then
    Exit;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
      begin
        FileDateTime := GetFileDateTime(SynEdit.DocumentName);
        if (FileDateTime <> 0) and (FileDateTime <> SynEdit.FileDateTime) then
        begin
          if FileExists(SynEdit.DocumentName) then
          begin
            if not (DialogResult in [mrYesToAll, mrNoToAll]) then
              DialogResult := AskYesOrNoAll(Format(LanguageDataModule.GetYesOrNoMessage('DocumentTimeChanged'), [SynEdit.DocumentName]));
            if DialogResult in [mrYes, mrYesToAll] then
              Refresh(i);
          end
          else
          begin
            if OptionsContainer.AutoSave then
              Save
            else
            begin
              SynEdit.Modified := True;
              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, SynEdit.Modified);
              PageControl.Invalidate;
            end;
          end;
        end;
      end;
  end;
end;

procedure TDocumentFrame.Refresh(Page: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetSynEdit(PageControl.Pages[Page]);
  if Assigned(SynEdit) then
  begin
    SynEdit.LoadFromFile(SynEdit.DocumentName);
    SynEdit.FileDateTime := GetFileDateTime(SynEdit.DocumentName);
  end;
end;

procedure TDocumentFrame.XMLTreeRefreshActionExecute(Sender: TObject);
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    DocTabSheetFrame.LoadFromXML(DocTabSheetFrame.SynEdit.Text);
end;

procedure TDocumentFrame.DecreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockUnindent, 'U', nil);
end;

procedure TDocumentFrame.IncreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockIndent, 'I', nil);
end;

procedure TDocumentFrame.SelectAll;

  procedure SelectAll(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.SelectAll;
  end;

begin
  if SearchForEdit.Focused then
    SearchForEdit.SelectAll
  else
  if GotoLineNumberEdit.Focused then
    GotoLineNumberEdit.SelectAll
  else
  begin
    SelectAll(GetActiveSynEdit);
    SelectAll(GetActiveSplitSynEdit);
  end;
end;

procedure TDocumentFrame.ToggleCase;

  function Toggle(const aStr: UnicodeString): UnicodeString;
  var
    i: Integer;
    sLower: UnicodeString;
  begin
    Result := SynWideUpperCase(aStr);
    sLower := SynWideLowerCase(aStr);
    for i := 1 to Length(aStr) do
    begin
      if Result[i] = aStr[i] then
        Result[i] := sLower[i];
    end;
  end;

  procedure ToggleCase(SynEdit: TBCSynEdit);
  var
    SelStart, SelEnd: Integer;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        if SynWideUpperCase(SynEdit.SelText) <> SynWideUpperCase(FSelectedText) then
        begin
          FCaseCycle := 0;
          FSelectedText := SynEdit.SelText;
        end;

        SynEdit.BeginUpdate;
        SelStart := SynEdit.SelStart;
        SelEnd := SynEdit.SelEnd;
        { UPPER/lower/toggle case/Title }
        case FCaseCycle of
          0: SynEdit.SelText := SynWideUpperCase(FSelectedText);
          1: SynEdit.SelText := SynWideLowerCase(FSelectedText);
          2: SynEdit.SelText := Toggle(FSelectedText);
          3: SynEdit.SelText := SynWideUpperCase(FSelectedText[1]) + SynWideLowerCase(System.Copy(FSelectedText, 2, Length(FSelectedText)));
          4: SynEdit.SelText := FSelectedText;
        end;
        SynEdit.SelStart := SelStart;
        SynEdit.SelEnd := SelEnd;

        SynEdit.EndUpdate;
        Inc(FCaseCycle);
        if FCaseCycle > 4 then
          FCaseCycle := 0;
      end;
  end;

begin
  ToggleCase(GetActiveSynEdit);
  ToggleCase(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.RemoveWhiteSpace;

  procedure RemoveWhiteSpace(SynEdit: TBCSynEdit);
  var
    Strings: TWideStringList;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := SynEdit.SelText;
        SynEdit.SelText := BCCommon.StringUtils.RemoveWhiteSpace(Strings.Text);
        Strings.Free;
      end;
  end;

begin
  RemoveWhiteSpace(GetActiveSynEdit);
  RemoveWhiteSpace(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.SortAsc;

  procedure SortAsc(SynEdit: TBCSynedit);
  var
    Strings: TWideStringList;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := SynEdit.SelText;
        Strings.Sort;
        SynEdit.SelText := TrimRight(Strings.Text);
        Strings.Free;
      end;
  end;

begin
  SortAsc(GetActiveSynEdit);
  SortAsc(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.SortDesc;

  procedure SortDesc(SynEdit: TBCSynEdit);
  var
    i: Integer;
    s: WideString;
    Strings: TWideStringList;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := SynEdit.SelText;
        Strings.Sort;
        for i := Strings.Count - 1 downto 0 do
          s := s + Strings.Strings[i] + Chr(13) + Chr(10);
        SynEdit.SelText := TrimRight(s);
        Strings.Free;
      end;
  end;

begin
  SortDesc(GetActiveSynEdit);
  SortDesc(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.ClearBookmarks;

  procedure ClearBookmarks(SynEdit: TBCSynEdit);
  var
    i: Integer;
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      for i := 0 to 9 do
        SynEdit.ClearBookMark(i);
  end;

begin
  ClearBookmarks(GetActiveSynEdit);
  ClearBookmarks(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.InsertLine;

  procedure InsertLine(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecInsertLine, 'N', nil);
  end;

begin
  InsertLine(GetActiveSynEdit);
  InsertLine(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.DeleteWord;

  procedure DeleteWord(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteWord, 'T', nil);
  end;

begin
  DeleteWord(GetActiveSynEdit);
  DeleteWord(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.DeleteLine;

  procedure DeleteLine(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteLine, 'Y', nil);
  end;

begin
  DeleteLine(GetActiveSynEdit);
  DeleteLine(GetActiveSplitSynEdit);
end;

procedure TDocumentFrame.DeleteEOL;

  procedure DeleteEOL(SynEdit: TBCSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
        SynEdit.ExecuteCommand(ecDeleteEOL, 'Y', nil);
  end;

begin
  DeleteEOL(GetActiveSynEdit);
  DeleteEOL(GetActiveSplitSynEdit);
end;

function LengthWithoutWhiteSpaces(Str: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Str) do
    if Trim(Str[i]) <> '' then
      Inc(Result);
end;

procedure TDocumentFrame.ShowWordCount;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    ShowMessage(Format(LanguageDataModule.GetMessage('DocumentStatistics'), [SynEdit.Lines.Count, CHR_ENTER, WordCount(SynEdit.Text), CHR_ENTER, LengthWithoutWhiteSpaces(SynEdit.Text)]));
end;

function TDocumentFrame.GetMacroRecordPauseImageIndex: Integer;
var
  SynEdit: TBCSynEdit;
begin
  Result := Lib.IMAGEINDEX_RECORD;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
       if SynEdit.SynMacroRecorder.State = msRecording then
         Result := Lib.IMAGEINDEX_PAUSE
end;

function TDocumentFrame.IsRecordingMacro: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
      Result := SynEdit.SynMacroRecorder.State = msRecording
end;

function TDocumentFrame.IsMacroStopped: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
      Result := SynEdit.SynMacroRecorder.State = msStopped
end;

procedure TDocumentFrame.RecordMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if not Assigned(SynEdit.SynMacroRecorder) then
    begin
      SynEdit.SynMacroRecorder := TSynMacroRecorder.Create(SynEdit);
      SynEdit.SynMacroRecorder.RecordMacro(SynEdit);
    end
    else
    if SynEdit.SynMacroRecorder.State = msStopped then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('RecordMacro')) then
      begin
        SynEdit.SynMacroRecorder.Clear;
        SynEdit.SynMacroRecorder.RecordMacro(SynEdit);
      end;
    end
    else
    if SynEdit.SynMacroRecorder.State = msRecording then
      SynEdit.SynMacroRecorder.Pause
    else
    if SynEdit.SynMacroRecorder.State = msPaused then
      SynEdit.SynMacroRecorder.Resume
  end;
end;

procedure TDocumentFrame.StopMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if Assigned(SynEdit.SynMacroRecorder) then
      SynEdit.SynMacroRecorder.Stop;
  end;
end;

procedure TDocumentFrame.PlaybackMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if Assigned(SynEdit.SynMacroRecorder) then
      SynEdit.SynMacroRecorder.PlaybackMacro(SynEdit);
  end;
end;

procedure TDocumentFrame.SaveMacro;
var
  SynEdit: TBCSynEdit;
  FilterIndex: Cardinal;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    if Assigned(SynEdit.SynMacroRecorder) then
      if BCCommon.Dialogs.SaveFile(Handle, '', Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro')
        , '|', #0, [rfReplaceAll])) + #0#0,
        LanguageDataModule.GetConstant('SaveAs'), FilterIndex, '', 'mcr') then
      begin
        Application.ProcessMessages; { style fix }
        SynEdit.SynMacroRecorder.SaveToFile(BCCommon.Dialogs.Files[0]);
      end;
end;

procedure TDocumentFrame.LoadMacro;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    if BCCommon.Dialogs.OpenFile(Handle, '', Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro')
      , '|', #0, [rfReplaceAll])) + #0#0,
      LanguageDataModule.GetConstant('Open'), 'mcr') then
    begin
      Application.ProcessMessages; { style fix }
      if not Assigned(SynEdit.SynMacroRecorder) then
        SynEdit.SynMacroRecorder := TSynMacroRecorder.Create(SynEdit);
      SynEdit.SynMacroRecorder.LoadFromFile(BCCommon.Dialogs.Files[0]);
    end;
  end;
end;

procedure TDocumentFrame.FileProperties;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    PropertiesDialog(SynEdit.DocumentName);
end;

procedure TDocumentFrame.SetActiveEncoding(Value: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  with SynEdit do
  begin
    case Value of
      0: Encoding := TEncoding.ASCII;
      1: Encoding := TEncoding.ANSI;
      2: Encoding := TEncoding.BigEndianUnicode;
      3: Encoding := TEncoding.Unicode;
      4: Encoding := TEncoding.UTF7;
      5: Encoding := TEncoding.UTF8;
      6: Encoding := TEncoding.UTF8WithoutBOM;
    end;
  end;
end;

procedure TDocumentFrame.SetActiveHighlighter(Value: Integer);

  procedure SetActiveSynEditProperties;
  var
    SynEdit: TBCSynEdit;
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) then
    with SynEdit do
    begin
      ActiveLineColor := clSkyBlue;
      OnPaintTransient := nil;
      HtmlVersion := shvUndefined;
      SynWebEngine.Options.HtmlVersion := shvUndefined;
      case Value of
        3: begin
             Color := clNavy;
             ActiveLineColor := clBlue;
           end;
        4: ActiveLineColor := $E6FFFA;
        5: begin
             Color := clBlack;
             ActiveLineColor := clGray;
           end;
        6: begin
             Color := clNavy;
             ActiveLineColor := clBlue;
           end;
        7: ActiveLineColor := $E6FFFA;
        8: begin
             Color := clBlack;
             ActiveLineColor := clGray;
           end;
        26: begin
              OnPaintTransient := SynEditHTMLPaintTransient;
              OnChange := SynEditHTMLOnChange;
              FHTMLDocumentChanged := True;
              HtmlVersion := OptionsContainer.HTMLVersion;
              SynWebEngine.Options.HtmlVersion := HtmlVersion;
            end;
        38: begin
              Color := clNavy;
              ActiveLineColor := clBlue;
              OnPaintTransient := SynEditPASPaintTransient;
            end;
        39: ActiveLineColor := $E6FFFA;
        40: begin
              Color := clBlack;
              ActiveLineColor := clGray;
              OnPaintTransient := SynEditPASPaintTransient;
            end;
        47: SynSQLSyn.SQLDialect := OptionsContainer.SQLDialect;
      end;
    end;
  end;

  procedure SetActiveHighlighter;
  var
    DocTabSheetFrame: TDocTabSheetFrame;
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
    with DocTabSheetFrame.SynEdit do
    begin
      case Value of
        0: Highlighter := SynHC11Syn;
        1: Highlighter := SynAWKSyn;
        2: Highlighter := SynBaanSyn;
        3: Highlighter := ClassicCSSyn;
        4: Highlighter := DefaultCSSyn;
        5: Highlighter := TwilightCSSyn;
        6: Highlighter := ClassicCppSyn;
        7: Highlighter := DefaultCppSyn;
        8: Highlighter := TwilightCppSyn;
        9: Highlighter := SynCACSyn;
        10: Highlighter := SynCacheSyn;
        11: Highlighter := SynWebCssSyn;
        12: Highlighter := SynCobolSyn;
        13: Highlighter := SynIdlSyn;
        14: Highlighter := SynCPMSyn;
        15: Highlighter := SynDOTSyn;
        16: Highlighter := SynADSP21xxSyn;
        17: Highlighter := SynDWSSyn;
        18: Highlighter := SynEiffelSyn;
        19: Highlighter := SynFortranSyn;
        20: Highlighter := SynFoxproSyn;
        21: Highlighter := SynGalaxySyn;
        22: Highlighter := SynDmlSyn;
        23: Highlighter := SynGWScriptSyn;
        24: Highlighter := SynHaskellSyn;
        25: Highlighter := SynHP48Syn;
        26: Highlighter := SynWebHtmlSyn;
        27: Highlighter := SynIniSyn;
        28: Highlighter := SynInnoSyn;
        29: Highlighter := SynJavaSyn;
        30: Highlighter := SynJScriptSyn;
        31: Highlighter := SynKixSyn;
        32: Highlighter := SynLDRSyn;
        33: Highlighter := SynLLVMIRSyn;
        34: Highlighter := SynModelicaSyn;
        35: Highlighter := SynM3Syn;
        36: Highlighter := SynMsgSyn;
        37: Highlighter := SynBatSyn;
        38: Highlighter := ClassicPasSyn;
        39: Highlighter := DefaultPasSyn;
        40: Highlighter := TwilightPasSyn;
        41: Highlighter := SynPerlSyn;
        42: Highlighter := SynProgressSyn;
        43: Highlighter := SynPythonSyn;
        44: Highlighter := SynRCSyn;
        45: Highlighter := SynRubySyn;
        46: Highlighter := SynSDDSyn;
        47: Highlighter := SynSQLSyn;
        48: Highlighter := SynSMLSyn;
        49: Highlighter := SynSTSyn;
        50: Highlighter := SynTclTkSyn;
        51: Highlighter := SynTeXSyn;
        52: Highlighter := DocTabSheetFrame.SynURISyn;
        53: Highlighter := SynUNIXShellScriptSyn;
        54: Highlighter := SynVBSyn;
        55: Highlighter := SynVBScriptSyn;
        56: Highlighter := SynVrml97Syn;
        57: Highlighter := SynWebIDLSyn;
        58: Highlighter := SynAsmSyn;
        59: Highlighter := SynWebXmlSyn;
        60: Highlighter := SynYAMLSyn;
      end;
    end;
  end;
begin
  SetActiveSynEditProperties;
  SetActiveHighlighter;
end;

function TDocumentFrame.GetSplitChecked: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.SplitVisible;
end;

function TDocumentFrame.GetMinimapChecked: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.MinimapVisible;
end;

procedure TDocumentFrame.ToggleSplit;
var
  i: Integer;
  FileName: string;
  ASynEdit: TBCSynEdit;
  DocTabSheetFrame: TDocTabSheetFrame;
  SplitVisible: Boolean;
begin
  ASynEdit := GetActiveSynEdit;
  FileName := ASynEdit.DocumentName;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
  begin
    SplitVisible := not DocTabSheetFrame.SplitVisible;

    if SplitVisible then
    begin
      with DocTabSheetFrame.SplitSynEdit do
      begin
        DocumentName := FileName;
        FileDateTime := GetFileDateTime(FileName);
        Font.Color := ASynEdit.Font.Color;
        Gutter.Font.Color := ASynEdit.Gutter.Font.Color;
        Gutter.ShowLineNumbers := ASynEdit.Gutter.ShowLineNumbers;
        OnChange := SynEditSplitOnChange;
        OnSpecialLineColors := SynEditSpecialLineColors;
        OnEnter := SynEditEnter;
        OnReplaceText := SynEditorReplaceText;
        SearchEngine := SynEditSearch;
        PopupMenu := EditorPopupMenu;
        BookMarkOptions.BookmarkImages := BookmarkImagesList;
        Height := DocTabSheetFrame.DocumentPanel.Height div 2;
        Width := 0; // reduce flickering
      end;
      OptionsContainer.AssignTo(DocTabSheetFrame.SplitSynEdit);
      if Filename <> '' then
      begin
        DocTabSheetFrame.SplitSynEdit.Text := ASynEdit.Text;
        for i := 0 to DocTabSheetFrame.SplitSynEdit.ExpandLines.Count - 1 do
          DocTabSheetFrame.SplitSynEdit.ExpandLines.Attributes[i].aLineState := DocTabSheetFrame.SynEdit.ExpandLines.Attributes[i].aLineState;
        SelectHighlighter(DocTabSheetFrame, FileName);
      end;
    end;
    DocTabSheetFrame.SplitVisible := SplitVisible;
  end;
end;

procedure TDocumentFrame.ToggleMiniMap;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    DocTabSheetFrame.MinimapVisible := not DocTabSheetFrame.MinimapVisible;
end;

function TDocumentFrame.IsCompareFilesActivePage: Boolean;
begin
  Result := Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = FCompareImageIndex);
end;

procedure TDocumentFrame.UpdateLanguage(SelectedLanguage: string);
var
  i: Integer;
  CompareFrame: TCompareFrame;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  BCCommon.LanguageUtils.UpdateLanguage(TForm(Self), SelectedLanguage);

  { compare frames }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DocTabSheetFrame) then
    begin
      DocTabSheetFrame.SynEdit.ScrollInfoFmtTop := LanguageDataModule.GetConstant('TopLine');
      DocTabSheetFrame.SplitSynEdit.ScrollInfoFmtTop := LanguageDataModule.GetConstant('TopLine')
    end;
    if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
    begin
      CompareFrame := GetCompareFrame(PageControl.Pages[i]);
      if Assigned(CompareFrame) then
        CompareFrame.UpdateLanguage(SelectedLanguage);
    end;
  end;
end;

procedure TDocumentFrame.FormatXML;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    SynEdit.BeginUndoBlock;
    try
      SynEdit.SelectAll;
      SynEdit.SelText := BCCommon.StringUtils.FormatXML(SynEdit.Text);
    finally
      SynEdit.EndUndoBlock;
      SynEdit.SetFocus;
    end;
  end;
end;

function TDocumentFrame.IsXMLDocument: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.SynEdit.Highlighter = SynWebXmlSyn;
end;

procedure TDocumentFrame.SelectHighlighter(DocTabSheetFrame: TDocTabSheetFrame; FileName: string);

  function IsExtInFileType(Ext: string; FileType: TFileType): Boolean;
  var
    s, FileTypes: string;
  begin
    Ext := '*' + Ext;
    FileTypes := OptionsContainer.FileType(FileType);
    if Pos(';', FileTypes) <> 0 then
      while Pos(';', FileTypes) <> 0 do
      begin
        s := System.Copy(FileTypes, 1,  Pos(';', FileTypes) - 1);
        Result := LowerCase(Ext) = LowerCase(s);
        if Result then
          Exit;
        FileTypes := System.Copy(FileTypes, Pos(';', FileTypes) + 1, Length(FileTypes));
      end;
    Result := LowerCase(Ext) = LowerCase(FileTypes);
  end;

  procedure SetSynEdit(SynEdit: TBCSynEdit);
  var
    FileExt: string;
    LStyles: TCustomStyleServices;
  begin
    FileExt := ExtractFileExt(FileName);
    with SynEdit do
    begin
      OnPaintTransient := nil;
      FHTMLDocumentChanged := False;
      HtmlVersion := shvUndefined;
      SynWebEngine.Options.HtmlVersion := shvUndefined;
      LStyles := StyleServices;
      if LStyles.Enabled then
        Color := LStyles.GetStyleColor(scEdit)
      else
        Color := clWhite;
      if IsExtInFileType(FileExt, ftCS) then
      begin
        if (Highlighter = ClassicCSSyn) or (Highlighter = DefaultCSSyn) or (Highlighter = TwilightCSSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
          begin
            Color := clNavy;
            ActiveLineColor := clBlue;
          end
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            ActiveLineColor := $E6FFFA
          else
          begin
            Color := clBlack;
            ActiveLineColor := clGray;
          end
        end;
      end
      else if IsExtInFileType(FileExt, ftCPP) then
      begin
        if (Highlighter = ClassicCPPSyn) or (Highlighter = DefaultCPPSyn) or (Highlighter = TwilightCPPSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
          begin
            Color := clNavy;
            ActiveLineColor := clBlue;
          end
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            ActiveLineColor := $E6FFFA
          else
          begin
            Color := clBlack;
            ActiveLineColor := clGray;
          end
        end;
      end
      else if IsExtInFileType(FileExt, ftHTML) or IsExtInFileType(FileExt, ftPHP) then
      begin
        OnPaintTransient := SynEditHTMLPaintTransient;
        OnChange := SynEditHTMLOnChange;
        FHTMLDocumentChanged := True;
        HtmlVersion := FindHtmlVersion(Lines);
        SynWebEngine.Options.HtmlVersion := HtmlVersion;
      end
      else if IsExtInFileType(FileExt, ftPas) then
      begin
        if (Highlighter = ClassicPasSyn) or (Highlighter = DefaultPasSyn) or (Highlighter = TwilightPasSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
          begin
            Color := clNavy;
            ActiveLineColor := clBlue;
            OnPaintTransient := SynEditPASPaintTransient;
          end
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            ActiveLineColor := $E6FFFA
          else
          begin
            Color := clBlack;
            ActiveLineColor := clGray;
            OnPaintTransient := SynEditPASPaintTransient;
          end
        end;
      end
      else
      if IsExtInFileType(FileExt, ftSQL) then
        SynSQLSyn.SQLDialect := OptionsContainer.SQLDialect
    end;
  end;

  procedure SetSplitSynEdit(SynEdit, SplitSynEdit: TBCSynEdit);
  begin
    SplitSynEdit.Color := SynEdit.Color;
    SplitSynEdit.ActiveLineColor := SynEdit.ActiveLineColor;
    SplitSynEdit.OnPaintTransient := SynEdit.OnPaintTransient;
    SplitSynEdit.HtmlVersion := SynEdit.HtmlVersion;
    SplitSynEdit.Highlighter := SynEdit.Highlighter;
  end;

  procedure SetHighlighter;
  var
    FileExt: string;
  begin
    FileExt := UpperCase(ExtractFileExt(FileName));
    with DocTabSheetFrame.SynEdit do
    begin
      if IsExtInFileType(FileExt, ftHC11) then
        Highlighter := SynHC11Syn
      else
      if IsExtInFileType(FileExt, ftAWK) then
        Highlighter := SynAWKSyn
      else
      if IsExtInFileType(FileExt, ftBaan) then
        Highlighter := SynBaanSyn
      else
      if IsExtInFileType(FileExt, ftCS) then
      begin
        if (Highlighter <> ClassicCSSyn) and
          (Highlighter <> DefaultCSSyn) and
          (Highlighter <> TwilightCSSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
            Highlighter := ClassicCSSyn
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            Highlighter := DefaultCSSyn
          else
            Highlighter := TwilightCSSyn;
        end;
      end
      else if IsExtInFileType(FileExt, ftCPP) then
      begin
        if (Highlighter <> ClassicCPPSyn) and
          (Highlighter <> DefaultCPPSyn) and
          (Highlighter <> TwilightCPPSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
            Highlighter := ClassicCppSyn
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            Highlighter := DefaultCppSyn
          else
            Highlighter := TwilightCppSyn;
        end;
      end
      else if IsExtInFileType(FileExt, ftCAC) then
        Highlighter := SynCACSyn
      else if IsExtInFileType(FileExt, ftCache) then
        Highlighter := SynCacheSyn
      else if IsExtInFileType(FileExt, ftCss) then
        Highlighter := SynWebCssSyn
      else if IsExtInFileType(FileExt, ftCobol) then
        Highlighter := SynCobolSyn
      else if IsExtInFileType(FileExt, ftIdl) then
        Highlighter := SynIdlSyn
      else if IsExtInFileType(FileExt, ftCPM) then
        Highlighter := SynCPMSyn
      else if IsExtInFileType(FileExt, ftDOT) then
        Highlighter := SynDOTSyn
      else if IsExtInFileType(FileExt, ftADSP21xx) then
        Highlighter := SynADSP21xxSyn
      else if IsExtInFileType(FileExt, ftDWScript) then
        Highlighter := SynDWSSyn
      else if IsExtInFileType(FileExt, ftEiffel) then
        Highlighter := SynEiffelSyn
      else if IsExtInFileType(FileExt, ftFortran) then
        Highlighter := SynFortranSyn
      else if IsExtInFileType(FileExt, ftFoxpro) then
        Highlighter := SynFoxproSyn
      else if IsExtInFileType(FileExt, ftGalaxy) then
        Highlighter := SynGalaxySyn
      else if IsExtInFileType(FileExt, ftDml) then
        Highlighter := SynDmlSyn
      else if IsExtInFileType(FileExt, ftGWScript) then
        Highlighter := SynGWScriptSyn
      else if IsExtInFileType(FileExt, ftHaskell) then
        Highlighter := SynHaskellSyn
      else if IsExtInFileType(FileExt, ftHP48) then
        Highlighter := SynHP48Syn
      else if IsExtInFileType(FileExt, ftHTML) or IsExtInFileType(FileExt, ftPHP) then
        Highlighter := SynWebHtmlSyn
      else if IsExtInFileType(FileExt, ftIni) then
        Highlighter := SynIniSyn
      else if IsExtInFileType(FileExt, ftInno) then
        Highlighter := SynInnoSyn
      else if IsExtInFileType(FileExt, ftJava) then
        Highlighter := SynJavaSyn
      else if IsExtInFileType(FileExt, ftJScript) then
        Highlighter := SynJScriptSyn
      else if IsExtInFileType(FileExt, ftKix) then
        Highlighter := SynKixSyn
      else if IsExtInFileType(FileExt, ftLDR) then
        Highlighter := SynLDRSyn
      else if IsExtInFileType(FileExt, ftLLVM) then
        Highlighter := SynLLVMIRSyn
      else if IsExtInFileType(FileExt, ftModelica) then
        Highlighter := SynModelicaSyn
      else if IsExtInFileType(FileExt, ftM3) then
        Highlighter := SynM3Syn
      else if IsExtInFileType(FileExt, ftMsg) then
        Highlighter := SynMsgSyn
      else if IsExtInFileType(FileExt, ftBat) then
        Highlighter := SynBatSyn
      else if IsExtInFileType(FileExt, ftPas) then
      begin
        if (Highlighter <> ClassicPasSyn) and
          (Highlighter <> DefaultPasSyn) and
          (Highlighter <> TwilightPasSyn) then
        begin
          if OptionsContainer.CPASHighlighter = hClassic then
            Highlighter := ClassicPasSyn
          else
          if OptionsContainer.CPASHighlighter = hDefault then
            Highlighter := DefaultPasSyn
          else
            Highlighter := TwilightPasSyn
        end;
      end
      else if IsExtInFileType(FileExt, ftPerl) then
        Highlighter := SynPerlSyn
      else if IsExtInFileType(FileExt, ftProgress) then
        Highlighter := SynProgressSyn
      else if IsExtInFileType(FileExt, ftPython) then
        Highlighter := SynPythonSyn
      else if IsExtInFileType(FileExt, ftRC) then
        Highlighter := SynRCSyn
      else if IsExtInFileType(FileExt, ftRuby) then
        Highlighter := SynRubySyn
      else if IsExtInFileType(FileExt, ftSDD) then
        Highlighter := SynSDDSyn
      else if IsExtInFileType(FileExt, ftSQL) then
        Highlighter := SynSQLSyn
      else if IsExtInFileType(FileExt, ftSML) then
        Highlighter := SynSMLSyn
      else if IsExtInFileType(FileExt, ftST) then
        Highlighter := SynSTSyn
      else if IsExtInFileType(FileExt, ftTclTk) then
        Highlighter := SynTclTkSyn
      else if IsExtInFileType(FileExt, ftTeX) then
        Highlighter := SynTeXSyn
      else if IsExtInFileType(FileExt, ftUNIXShellScript) then
        Highlighter := SynUNIXShellScriptSyn
      else if IsExtInFileType(FileExt, ftVB) then
        Highlighter := SynVBSyn
      else if IsExtInFileType(FileExt, ftVBScript) then
        Highlighter := SynVBScriptSyn
      else if IsExtInFileType(FileExt, ftVrml97) then
        Highlighter := SynVrml97Syn
      else if IsExtInFileType(FileExt, ftAsm) then
        Highlighter := SynAsmSyn
      else if IsExtInFileType(FileExt, ftXML) then
        Highlighter := SynWebXMLSyn
      else if IsExtInFileType(FileExt, ftYAML) then
        Highlighter := SynYAMLSyn
      else if IsExtInFileType(FileExt, ftWebIDL) then
        Highlighter := SynWebIDLSyn
      else
        Highlighter := DocTabSheetFrame.SynURISyn;
    end;
  end;

begin
  SetSynEdit(DocTabSheetFrame.SynEdit);
  SetHighlighter;
  SetSplitSynEdit(DocTabSheetFrame.SynEdit, DocTabSheetFrame.SplitSynEdit);
end;

function TDocumentFrame.GetActiveBookmarkList: TSynEditMarkList;
var
  SynEdit: TBCSynEdit;
begin
  Result := nil;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.Marks;
end;

end.
