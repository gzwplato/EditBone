unit EditBone.Document;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, EditBone.Consts, BCEditor.Editor,
  Vcl.ComCtrls, Vcl.ImgList, Vcl.Menus, BCControl.PageControl, Vcl.Buttons, Vcl.ActnList,
  BCControl.ProgressBar, BCControl.Panel, sLabel, sPageControl, BCEditor.Types, BCControl.StatusBar,
  BCEditor.MacroRecorder, BCEditor.Print, BCEditor.Editor.Bookmarks, Vcl.Dialogs, BCCommon.Frame.Compare,
  BCEditor.Print.Types, EditBone.XMLTree, BCControl.Splitter, BCControl.ComboBox, System.Generics.Collections,
  BCComponent.SkinManager;

type
  TEBSetBookmarks = procedure of object;
  TEBSetTitleBarMenuCaptions = procedure of object;
  TEBCreateFileReopenList = procedure of object;
  TEBGetActionList = function: TObjectList<TAction> of object;

  TsTabSheet = class(sPageControl.TsTabSheet)
  private
    FEditor: TBCEditor;
    FComboBoxSearchText: TBCComboBox;
    FCompareFrame: TCompareFrame;
    FSplitterHorizontal: TBCSplitter;
    FLabelSearchResult: TsLabel;
    FPanelSearch: TBCPanel;
    FSplitEditor: TBCEditor;
    FSplitterVertical: TBCSplitter;
    FXMLTree: TEBXMLTree;
  public
    property Editor: TBCEditor read FEditor write FEditor;
    property ComboBoxSearchText: TBCComboBox read FComboBoxSearchText write FComboBoxSearchText;
    property CompareFrame: TCompareFrame read FCompareFrame write FCompareFrame;
    property SplitterHorizontal: TBCSplitter read FSplitterHorizontal write FSplitterHorizontal;
    property LabelSearchResult: TsLabel read FLabelSearchResult write FLabelSearchResult;
    property PanelSearch: TBCPanel read FPanelSearch write FPanelSearch;
    property SplitEditor: TBCEditor read FSplitEditor write FSplitEditor;
    property SplitterVertical: TBCSplitter read FSplitterVertical write FSplitterVertical;
    property XMLTree: TEBXMLTree read FXMLTree write FXMLTree;
  end;

  TEBDocument = class(TObject)
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint);
    procedure ComboBoxSearchTextChange(Sender: TObject);
    procedure ComboBoxSearchTextKeyPress(Sender: TObject; var Key: Char);
    procedure DropFiles(Sender: TObject; Pos: TPoint; AFiles: TStrings);
    procedure EditorAfterBookmarkPlaced(Sender: TObject);
    procedure EditorAfterClearBookmark(Sender: TObject);
    procedure EditorCaretChanged(Sender: TObject; X, Y: Integer);
    procedure EditorOnChange(Sender: TObject);
    procedure EditorReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer; DeleteLine: Boolean; var Action: TBCEditorReplaceAction);
    procedure XMLTreeClick(Sender: TObject);
  private
    FActionSearchClose: TAction;
    FActionSearchFindNext: TAction;
    FActionSearchFindPrevious: TAction;
    FActionSearchOptions: TAction;
    FActionSearchTextItems: TAction;
    FCaretInfo: string;
    FCompareImageIndex, FNewImageIndex: Integer;
    FCreateFileReopenList: TEBCreateFileReopenList;
    FGetActionList: TEBGetActionList;
    FImages: TImageList;
    FModifiedDocuments: Boolean;
    FNumberOfNewDocument: Integer;
    FOpenDialog: TOpenDialog;
    FPageControl: TBCPageControl;
    FPopupMenuEditor: TPopupMenu;
    FPopupMenuXMLTree: TPopupMenu;
    FProcessing: Boolean;
    FProgressBar: TBCProgressBar;
    FSaveDialog: TSaveDialog;
    FSetBookmarks: TEBSetBookmarks;
    FSetTitleBarMenuCaptions: TEBSetTitleBarMenuCaptions;
    FSkinManager: TBCSkinManager;
    FStatusBar: TBCStatusBar;
    FTabSheetNew: TTabSheet;
    function CreateNewTabSheet(const AFileName: string = ''; AShowMinimap: Boolean = False;
      const AHighlighter: string = ''; const AColor: string = ''; ASetActivePage: Boolean = True): TsTabSheet;
    function FindOpenFile(const FileName: string): TBCEditor;
    function GetActiveDocumentName: string;
    function GetActiveFileName: string;
    function GetActivePageCaption: string;
    function GetCanRedo: Boolean;
    function GetCanUndo: Boolean;
    function GetModifiedDocuments(CheckActive: Boolean = True): Boolean;
    function GetXMLTreeVisible: Boolean;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string; overload;
    function SetDocumentSpecificSearchText(AEditor: TBCEditor): Boolean;
    procedure AddToReopenFiles(const FileName: string);
    procedure CheckModifiedDocuments;
    procedure CreateImageList;
    procedure CreateSearchPanel(ATabSheet: TsTabSheet);
    procedure SelectHighlighter(AEditor: TBCEditor; const FileName: string);
    procedure SetActiveEditorFocus;
    procedure SetActivePageCaptionModified(AModified: Boolean);
    procedure SetEditorBookmarks(Editor: TBCEditor; Bookmarks: TStrings);
    procedure SetSearchMatchesFound;
    procedure SetSkinColors(Editor: TBCEditor);
  public
    constructor Create(AOwner: TBCPageControl);
    destructor Destroy; override;
    function Close(AFreePage: Boolean = True; ATabIndex: Integer = -1): Integer;
    function GetActiveBookmarkList: TBCEditorBookmarkList;
    function GetActiveComboBoxSearchText: TBCComboBox;
    function GetActiveEditor: TBCEditor;
    function GetActiveSplitEditor: TBCEditor;
    function GetMacroRecordPauseImageIndex: Integer;
    function GetModifiedInfo(AEditor: TBCEditor): string;
    function Options(AActionList: TActionList): Boolean;
    function ReadIniOpenFiles: Boolean;
    function SaveAs: string;
    function ToggleLineNumbers: Boolean;
    function ToggleSearch(AShowPanel: Boolean = False): Boolean;
    function ToggleSpecialChars: Boolean;
    function ToggleWordWrap: Boolean;
    function ToggleXMLTree: Boolean;
    procedure CheckFileDateTimes;
    procedure ClearBookmarks;
    procedure CloseAll;
    procedure CloseAllOtherPages;
    procedure CollapseAll;
    procedure CompareFiles(const AFileName: string = ''; AFileDragDrop: Boolean = False);
    procedure Copy;
    procedure Cut;
    procedure DecreaseIndent;
    procedure DeleteEndOfLine;
    procedure DeleteLine;
    procedure DeleteWhiteSpace;
    procedure DeleteWord;
    procedure FileProperties;
    procedure FindNext;
    procedure FindPrevious;
    procedure FormatJSON(AIndentSize: Integer);
    procedure FormatSQL;
    procedure FormatXML;
    procedure GotoBookmarks(ItemIndex: Integer);
    procedure GotoLine;
    procedure HTMLExport;
    procedure IncreaseIndent;
    procedure InitializeEditorPrint(EditorPrint: TBCEditorPrint);
    procedure InsertDateAndTime;
    procedure InsertLine;
    procedure InsertTag;
    procedure LoadMacro;
    procedure New;
    procedure NextPage;
    procedure Open(const FileName: string = ''; Bookmarks: TStrings = nil; ALine: Integer = 0; AChar: Integer = 0;
      StartUp: Boolean = False; ShowMinimap: Boolean = False; const AHighlighter: string = ''; const AColor: string = '';
      ASetActivePage: Boolean = True); overload;
    procedure Open(const Filename: string; ALine: Integer; AChar: Integer); overload;
    procedure Open(const Filename: string; ASetActivePage: Boolean); overload;
    procedure Paste;
    procedure PlaybackMacro;
    procedure PreviousPage;
    procedure PrintPreview;
    procedure RecordMacro;
    procedure Redo;
    procedure Refresh(Page: Integer);
    procedure RefreshXMLTree;
    procedure Replace;
    procedure Save; overload;
    procedure SaveAll;
    procedure SaveMacro;
    procedure SearchClose;
    procedure SearchOptions;
    procedure SelectAll;
    procedure SelectForCompare;
    procedure SetHighlighter(AEditor: TBCEditor; const AHighlighterName: string);
    procedure SetHighlighterColor(AEditor: TBCEditor; const AColorName: string);
    procedure SetOptions;
    procedure ShowInfo;
    procedure Sort(ASortOrder: TBCEditorSortOrder = soToggle);
    procedure StopMacro;
    procedure SyncEdit;
    procedure ToggleBookmark(AItemIndex: Integer);
    procedure ToggleCase(ACase: TBCEditorCase = cNone);
    procedure ToggleMiniMap;
    procedure ToggleSelectionMode;
    procedure ToggleSplit;
    procedure Undo;
    procedure UpdateHighlighterColors;
    procedure WriteIniFile;
    property ActionSearchClose: TAction read FActionSearchClose write FActionSearchClose;
    property ActionSearchFindNext: TAction read FActionSearchFindNext write FActionSearchFindNext;
    property ActionSearchFindPrevious: TAction read FActionSearchFindPrevious write FActionSearchFindPrevious;
    property ActionSearchOptions: TAction read FActionSearchOptions write FActionSearchOptions;
    property ActionSearchTextItems: TAction read FActionSearchTextItems write FActionSearchTextItems;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveFileName: string read GetActiveFileName;
    property CanRedo: Boolean read GetCanRedo;
    property CanUndo: Boolean read GetCanUndo;
    property CaretInfo: string read FCaretInfo;
    property CreateFileReopenList: TEBCreateFileReopenList read FCreateFileReopenList write FCreateFileReopenList;
    property GetActionList: TEBGetActionList read FGetActionList write FGetActionList;
    property ModifiedDocuments: Boolean read FModifiedDocuments write FModifiedDocuments;
    property OpenDialog: TOpenDialog read FOpenDialog write FOpenDialog;
    property PageControl: TBCPageControl read FPageControl;
    property PopupMenuEditor: TPopupMenu read FPopupMenuEditor write FPopupMenuEditor;
    property PopupMenuXMLTree: TPopupMenu read FPopupMenuXMLTree write FPopupMenuXMLTree;
    property Processing: Boolean read FProcessing;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property SaveDialog: TSaveDialog read FSaveDialog write FSaveDialog;
    property SetBookmarks: TEBSetBookmarks read FSetBookmarks write FSetBookmarks;
    property SetTitleBarMenuCaptions: TEBSetTitleBarMenuCaptions read FSetTitleBarMenuCaptions write FSetTitleBarMenuCaptions;
    property SkinManager: TBCSkinManager read FSkinManager write FSkinManager;
    property StatusBar: TBCStatusBar write FStatusBar;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible;
  end;

implementation

{$R EDITBONE.DOCUMENT.RES}

uses
  Vcl.Forms, BCCommon.Form.Print.Preview, BCCommon.Options.Container, BCCommon.Dialog.ConfirmReplace, Vcl.Printers,
  System.Types, BigIni, BCCommon.Language.Strings, VirtualTrees,  BCCommon.Dialog.InputQuery, BCCommon.Dialog.Replace,
  BCCommon.FileUtils, BCCommon.Messages, BCCommon.Utils, BCCommon.StringUtils, Winapi.CommCtrl, EditBone.Form.Options,
  BCCommon.Images, System.IniFiles, BCCommon.SQL.Formatter, BCEditor.Editor.KeyCommands, EditBone.DataModule.Images,
  BCControl.SpeedButton, BCControl.Utils, BCEditor.Editor.Utils, BCCommon.Consts, BCEditor.Encoding, Vcl.Clipbrd,
  BCEditor.Highlighter.Colors, BCCommon.Dialog.Options.Search, Vcl.ValEdit, EditBone.Encoding;

{ TEBDocument }

constructor TEBDocument.Create(AOwner: TBCPageControl);
begin
  inherited Create;
  FPageControl := AOwner;

  FNumberOfNewDocument := 0;
  FProcessing := False;
  FModifiedDocuments := False;

  FTabSheetNew := AOwner.Pages[0];

  CreateImageList;
  SetOptions;
end;

destructor TEBDocument.Destroy;
begin
  if Assigned(FImages) then
    FImages.Free;

  inherited Destroy;
end;

procedure TEBDocument.RefreshXMLTree;
var
  LTabSheet: TsTabSheet;
begin
  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if Assigned(LTabSheet.XMLTree) and Assigned(LTabSheet.Editor) then
    LTabSheet.XMLTree.LoadFromXML(LTabSheet.Editor.Text);
end;

procedure TEBDocument.XMLTreeClick(Sender: TObject);
var
  LTabSheet: TsTabSheet;
  LData: PXMLTreeRec;
  LNode: PVirtualNode;
begin
  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if Assigned(LTabSheet.XMLTree) and Assigned(LTabSheet.Editor) then
  begin
    LNode := LTabSheet.XMLTree.GetFirstSelected;
    if Assigned(LNode) then
    begin
      LData := LTabSheet.XMLTree.GetNodeData(LTabSheet.XMLTree.GetFirstSelected);
      LTabSheet.Editor.TextCaretPosition := GetTextPosition(LData.BlockBegin.Char, LData.BlockBegin.Line);
      LTabSheet.Editor.EnsureCursorPositionVisible(True);
      LTabSheet.Editor.SelectionBeginPosition := LData.BlockBegin;
      LTabSheet.Editor.SelectionEndPosition := LData.BlockEnd;
    end;
  end;
end;

function TEBDocument.ToggleXMLTree: Boolean;
var
  LTabSheet: TsTabSheet;
begin
  Result := False;

  LTabSheet := PageControl.ActivePage as TsTabSheet;

  if Pos('XML', LTabSheet.Editor.Highlighter.FileName) <> 0 then
  begin
    if not Assigned(LTabSheet.XMLTree) then
    begin
      LTabSheet.XMLTree := TEBXMLTree.Create(PageControl.ActivePage);
      LTabSheet.XMLTree.Align := alLeft;
      LTabSheet.XMLTree.AlignWithMargins := True;
      LTabSheet.XMLTree.Margins.Left := 2;
      LTabSheet.XMLTree.Margins.Top := 2;
      LTabSheet.XMLTree.Margins.Right := 0;
      LTabSheet.XMLTree.Margins.Bottom := 2;
      LTabSheet.XMLTree.ProgressBar := FProgressBar;
      LTabSheet.XMLTree.Editor := LTabSheet.Editor;
      LTabSheet.XMLTree.Images := EBDataModuleImages.ImageListXMLTree;
      LTabSheet.XMLTree.PopupMenu := FPopupMenuXMLTree;
      LTabSheet.XMLTree.Parent := PageControl.ActivePage;
      LTabSheet.XMLTree.LoadFromXML(LTabSheet.Editor.Text);
      LTabSheet.XMLTree.TreeOptions.SelectionOptions := [toFullRowSelect];
      LTabSheet.XMLTree.TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale];
      LTabSheet.XMLTree.TreeOptions.MiscOptions := [toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning];
      LTabSheet.XMLTree.TreeOptions.PaintOptions := [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware];
      LTabSheet.XMLTree.OnClick := XMLTreeClick;
      { vertical splitter }
      LTabSheet.SplitterVertical := TBCSplitter.Create(PageControl.ActivePage);
      LTabSheet.SplitterVertical.Parent := PageControl.ActivePage;
      LTabSheet.SplitterVertical.Align := alLeft;
      LTabSheet.SplitterVertical.Left := LTabSheet.XMLTree.Left + 1; { splitter always right }

      LTabSheet.Editor.Margins.Left := 0;
    end
    else
    begin
      LTabSheet.XMLTree.Free;
      LTabSheet.XMLTree := nil;
      LTabSheet.SplitterVertical.Parent := nil;
      LTabSheet.SplitterVertical.Free;

      LTabSheet.Editor.Margins.Left := 2;
    end;
    Result := Assigned(LTabSheet.XMLTree);
  end;
end;

function TEBDocument.GetXMLTreeVisible: Boolean;
var
  LTabSheet: TsTabSheet;
begin
  Result := False;

  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if Assigned(LTabSheet.XMLTree) then
    Result := LTabSheet.XMLTree.Visible;
end;

procedure TEBDocument.EditorAfterBookmarkPlaced(Sender: TObject);
begin
  if Assigned(FSetBookmarks) then
    FSetBookmarks;
end;

procedure TEBDocument.EditorAfterClearBookmark(Sender: TObject);
begin
  if Assigned(FSetBookmarks) then
    FSetBookmarks;
end;

procedure TEBDocument.CreateSearchPanel(ATabSheet: TsTabSheet);
var
  LItems: TStrings;
  LSplitter: TBCSplitter;
  LSpeedButton: TBCSpeedButton;
  LBitmap: TBitmap;
begin
  ATabSheet.PanelSearch := TBCPanel.Create(ATabSheet);
  with ATabSheet.PanelSearch do
  begin
    Align := alBottom;
    AlignWithMargins := True;
    BevelOuter := bvNone;
    Caption := '';
    Margins.Left := 2;
    Margins.Top := 2;
    Margins.Right := 2;
    Margins.Bottom := 2;
    AutoSize := True;
    Height := 21;
    Visible := OptionsContainer.SearchVisible;
    Parent := ATabSheet;
  end;
  ATabSheet.ComboBoxSearchText := TBCComboBox.Create(ATabSheet);
  with ATabSheet.ComboBoxSearchText do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 200;
    VerticalAlignment := taAlignTop;
    UseMouseWheel := False;
    OnChange := ComboBoxSearchTextChange;
    OnKeyPress := ComboBoxSearchTextKeyPress;
    OnKeyDown := ComboBoxKeyDown;
    OnMouseWheel := ComboBoxMouseWheel;
    LItems := TStringList.Create;
  end;
  with TIniFile.Create(GetIniFilename) do
  try
    ReadSectionValues('SearchItems', LItems);
    InsertItemsToComboBox(LItems, ATabSheet.ComboBoxSearchText);
  finally
    LItems.Free;
    Free;
  end;
  LSplitter := TBCSplitter.Create(ATabSheet);
  with LSplitter do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Left := ATabSheet.ComboBoxSearchText.Width + 1;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 21;
    ShowCaption := False;
    Left := LSplitter.Left + 1;
    SkinData.SkinSection := 'TOOLBUTTON';
    OnClick := ActionSearchTextItems.OnExecute;
    ImageIndex := ActionSearchTextItems.ImageIndex;
    Hint := ActionSearchTextItems.Hint;
    Images := ImagesDataModule.ImageListSmall;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 10;
    ButtonStyle := tbsDivider;
    Left := LSplitter.Left + LSplitter.Width + 22;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 21;
    ShowCaption := False;
    Left := LSplitter.Left + LSplitter.Width + 32;
    SkinData.SkinSection := 'TOOLBUTTON';
    OnClick := ActionSearchFindPrevious.OnExecute;
    ImageIndex := ActionSearchFindPrevious.ImageIndex;
    Hint := ActionSearchFindPrevious.Hint;
    Images := ImagesDataModule.ImageListSmall;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 21;
    ShowCaption := False;
    Left := LSplitter.Left + LSplitter.Width + 53;
    SkinData.SkinSection := 'TOOLBUTTON';
    OnClick := ActionSearchFindNext.OnExecute;
    ImageIndex := ActionSearchFindNext.ImageIndex;
    Hint := ActionSearchFindNext.Hint;
    Images := ImagesDataModule.ImageListSmall;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 10;
    ButtonStyle := tbsDivider;
    Left := LSplitter.Left + LSplitter.Width + 74;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Align := alLeft;
    Parent := ATabSheet.PanelSearch;
    Width := 21;
    ShowCaption := False;
    Left := LSplitter.Left + LSplitter.Width + 84;
    SkinData.SkinSection := 'TOOLBUTTON';
    OnClick := ActionSearchOptions.OnExecute;
    ImageIndex := ActionSearchOptions.ImageIndex;
    Hint := ActionSearchOptions.Hint;
    Images := ImagesDataModule.ImageListSmall;
  end;
  ATabSheet.LabelSearchResult := TsLabel.Create(ATabSheet);
  with ATabSheet.LabelSearchResult do
  begin
    Align := alRight;
    AlignWithMargins := True;
    Margins.Top := 1;
    Margins.Right := 6;
    Parent := ATabSheet.PanelSearch;
    AutoSize := True;
    Font.Size := 10;
    SkinManager := FSkinManager;
  end;
  LSpeedButton := TBCSpeedButton.Create(ATabSheet);
  with LSpeedButton do
  begin
    Parent := ATabSheet.PanelSearch;
    Align := alRight;
    Width := 20;
    Left := ATabSheet.LabelSearchResult.Left + ATabSheet.LabelSearchResult.Width + 1;
    ShowCaption := False;
    SkinData.SkinSection := 'TOOLBUTTON';
    OnClick := ActionSearchClose.OnExecute;
    Hint := ActionSearchClose.Hint;
    Images := ImagesDataModule.ImageListSmall;
    LBitmap := TBitmap.Create;
    LBitmap.Width := 32;
    LBitmap.Height := 16;
    LBitmap.LoadFromResourceName(hInstance, 'SEARCHGLYPH');
    Glyph := LBitmap;
    LBitmap.Free;
  end;
end;

function TEBDocument.CreateNewTabSheet(const AFileName: string = ''; AShowMinimap: Boolean = False;
  const AHighlighter: string = ''; const AColor: string = ''; ASetActivePage: Boolean = True): TsTabSheet;
begin
  FProcessing := True;

  { create new tab sheet }
  Result := TsTabSheet.Create(PageControl);
  Result.PageControl := PageControl;

  if AFileName <> '' then
    Result.ImageIndex := GetIconIndex(AFileName)
  else
    Result.ImageIndex := FNewImageIndex;
  Result.TabVisible := False;
  if ASetActivePage then
    PageControl.ActivePage := Result;
  { tab sheet new always last }
  FTabSheetNew.PageIndex := PageControl.PageCount - 1;

  { set the Caption property }
  if AFileName = '' then
    Result.Caption := LanguageDataModule.GetConstant('Document') + IntToStr(FNumberOfNewDocument)
  else
    Result.Caption := ExtractFileName(AFileName);

  { create editor }
  Result.Editor := TBCEditor.Create(Result);
  with Result.Editor do
  begin
    Align := alClient;
    AlignWithMargins := True;
    Margins.Left := 2;
    Margins.Top := 2;
    Margins.Right := 2;
    Margins.Bottom := 2;
    Visible := False;
    Parent := Result;
    DocumentName := AFileName;
    SearchString := '';
    FileDateTime := GetFileDateTime(AFileName);
    OnChange := EditorOnChange;
    OnCaretChanged := EditorCaretChanged;
    OnReplaceText := EditorReplaceText;
    OnAfterBookmarkPlaced := EditorAfterBookmarkPlaced;
    OnAfterClearBookmark := EditorAfterClearBookmark;
    OnDropFiles := DropFiles;
    PopupMenu := FPopupMenuEditor;
    Search.Visible := OptionsContainer.SearchVisible;
    SyncEdit.Enabled := True;
  end;
  OptionsContainer.AssignTo(Result.Editor);
  Result.Editor.Minimap.Visible := Result.Editor.Minimap.Visible or AShowMinimap;

  CreateSearchPanel(Result);

  if AFileName <> '' then
  begin
    if AHighlighter <> '' then
      SetHighlighter(Result.Editor, AHighlighter)
    else
      SelectHighlighter(Result.Editor, AFileName);
    if AColor <> '' then
      SetHighlighterColor(Result.Editor, AColor)
    else
      SetHighlighterColor(Result.Editor, OptionsContainer.DefaultColor);
    Result.Editor.LoadFromFile(AFileName);
  end
  else
  begin
    SetEncoding(Result.Editor, OptionsContainer.DefaultEncoding);
    SetHighlighter(Result.Editor, OptionsContainer.DefaultHighlighter);
    SetHighlighterColor(Result.Editor, OptionsContainer.DefaultColor);
  end;

  if Assigned(FSetTitleBarMenuCaptions) then
    FSetTitleBarMenuCaptions;

  { reduce flickering by setting width and height to zero }
  Result.Editor.Width := 0;
  Result.Editor.Height := 0;
  Result.Editor.Visible := True;

  if Result.Editor.CanFocus then
    Result.Editor.SetFocus;

  Result.TabVisible := True;
  FProcessing := False;
end;

procedure TEBDocument.ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  LEditor: TBCEditor;
  LCommand: TBCEditorCommand;
begin
  if (Key = VK_END) or (Key = VK_HOME) or (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
    begin
      if LEditor.CanFocus then
        LEditor.SetFocus;
      case Key of
        VK_UP: LCommand := ecUp;
        VK_DOWN: LCommand := ecDown;
        VK_END: LCommand := ecLineEnd;
        VK_HOME: LCommand := ecLineBegin;
      else
        LCommand := ecNone;
      end;
      LEditor.ExecuteCommand(LCommand, EDITBONE_NONE_CHAR, nil);
    end;
    Key := 0;
  end;
end;

procedure TEBDocument.ComboBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint);
begin
  SetActiveEditorFocus;
end;

procedure TEBDocument.SetActiveEditorFocus;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    if LEditor.CanFocus then
      LEditor.SetFocus;
end;

procedure TEBDocument.ComboBoxSearchTextKeyPress(Sender: TObject; var Key: Char);
var
  i: Integer;
  LComboBoxSearchText: TBCComboBox;
  LItems: TStrings;
  LTabSheet: TsTabSheet;
begin
  if (Key = EDITBONE_CARRIAGE_RETURN) or (Key = EDITBONE_LINEFEED) then
  begin
    SetActiveEditorFocus;
    LComboBoxSearchText := GetActiveComboBoxSearchText;
    if Assigned(LComboBoxSearchText) then
      if LComboBoxSearchText.Items.IndexOf(LComboBoxSearchText.Text) = -1 then
      begin
        LComboBoxSearchText.Items.Add(LComboBoxSearchText.Text);
        { Update other documents }
        for i := 0 to FPageControl.PageCount - 2 do
        if FPageControl.Pages[i] <> FPageControl.ActivePage then
        begin
          LTabSheet := FPageControl.Pages[i] as TsTabSheet;
          if Assigned(LTabSheet.ComboBoxSearchText) then
            LTabSheet.ComboBoxSearchText.Items.Add(LComboBoxSearchText.Text);
        end;
        { Save to ini }
        LItems := TStringList.Create;
        try
          with TIniFile.Create(GetIniFilename) do
          try
            ReadSectionValues('SearchItems', LItems);
            WriteString('SearchItems', IntToStr(LItems.Count), LComboBoxSearchText.Text);
          finally
            Free;
          end;
        finally
          LItems.Free;
        end;
      end;
    Key := EDITBONE_NONE_CHAR;
  end;
  if Key = EDITBONE_ESCAPE then
  begin
    LTabSheet := FPageControl.ActivePage as TsTabSheet;
    if Assigned(LTabSheet.PanelSearch) then
      LTabSheet.PanelSearch.Visible := False;
    SetActiveEditorFocus;
    Key := EDITBONE_NONE_CHAR;
  end;
end;

procedure TEBDocument.SearchOptions;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    TSearchOptionsDialog.ClassShowModal(LEditor);
end;

procedure TEBDocument.SetSearchMatchesFound;
var
  s: string;
  LTabSheet: TsTabSheet;
begin
  s := '';
  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if Assigned(LTabSheet.Editor) and (LTabSheet.Editor.SearchResultCount > 1) then
    s := LanguageDataModule.GetConstant('MatchFoundPluralExtension');
  if Assigned(LTabSheet.Editor) and (LTabSheet.Editor.SearchResultCount > 0) then
    s := Format(LanguageDataModule.GetConstant('MatchFound'), [LTabSheet.Editor.SearchResultCount, s]);

  if Assigned(LTabSheet.LabelSearchResult) then
  begin
    LTabSheet.LabelSearchResult.Caption := s;
    LTabSheet.LabelSearchResult.Left := 0;
  end;
end;

procedure TEBDocument.ComboBoxSearchTextChange(Sender: TObject);
var
  LEditor: TBCEditor;
  LComboBoxSearchText: TBCComboBox;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if soSearchOnTyping in LEditor.Search.Options then
    begin
      LComboBoxSearchText := GetActiveComboBoxSearchText;
      if Assigned(LComboBoxSearchText) then
        LEditor.Search.SearchText := LComboBoxSearchText.Text;
      SetSearchMatchesFound;
    end;
    OptionsContainer.DocumentSpecificSearchText := '';
    if not OptionsContainer.DocumentSpecificSearch then
      OptionsContainer.DocumentSpecificSearchText := LEditor.Search.SearchText
  end;
end;

procedure TEBDocument.CompareFiles(const AFileName: string; AFileDragDrop: Boolean);
var
  i: Integer;
  LTabSheet: TsTabSheet;
  LTempList: TStringList;
begin
  { create list of open documents }
  LTempList := TStringList.Create;
  try
    for i := 0 to PageControl.PageCount - 2 do
    begin
      LTabSheet := PageControl.Pages[i] as TsTabSheet;
      if Assigned(LTabSheet.Editor) then
        LTempList.Add(LTabSheet.Editor.DocumentName);
    end;
    if AFileName <> '' then
    { find compare tab }
    for i := 0 to PageControl.PageCount - 2 do
    begin
      LTabSheet := PageControl.Pages[i] as TsTabSheet;
      if Assigned(LTabSheet.CompareFrame) then
      begin
        { if there already are two files to compare then continue }
        if LTabSheet.CompareFrame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit }
          PageControl.ActivePageIndex := i;
          LTabSheet.CompareFrame.SetCompareFile(AFileName, AFileDragDrop);
          Exit;
        end;
      end;
    end;
    { create a TabSheet }
    LTabSheet := TsTabSheet.Create(PageControl);
    LTabSheet.PageControl := PageControl;
    LTabSheet.PageIndex := PageControl.PageCount - 2;
    LTabSheet.ImageIndex := FCompareImageIndex;
    LTabSheet.Caption := LanguageDataModule.GetConstant('CompareFiles');
    PageControl.ActivePage := LTabSheet;
    { create a compare frame }
    LTabSheet.CompareFrame := TCompareFrame.Create(LTabSheet);
    with LTabSheet.CompareFrame do
    begin
      Parent := LTabSheet;
      Align := alClient;
      OpenDocumentsList := LTempList;
      SpecialChars := OptionsContainer.EnableSpecialChars;
      LineNumbers := OptionsContainer.EnableLineNumbers;
      SetCompareFile(AFileName);
      //UpdateLanguage(GetSelectedLanguage);
    end;
  finally
    LTempList.Free;
  end;
end;

procedure TEBDocument.SelectForCompare;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    CompareFiles(LEditor.DocumentName, False);
end;

function TEBDocument.FindOpenFile(const FileName: string): TBCEditor;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  Result := nil;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    if Assigned(LTabSheet.Editor) then
      if CompareText(UpperCase(LTabSheet.Editor.DocumentName), UpperCase(FileName)) = 0 then
      begin
        PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;
        Result := LTabSheet.Editor;
        Break;
      end;
  end;
end;

procedure TEBDocument.New;
begin
  Inc(FNumberOfNewDocument);
  CreateNewTabSheet;
end;

procedure TEBDocument.SetEditorBookmarks(Editor: TBCEditor; Bookmarks: TStrings);
var
  i: Integer;
  LTemp: string;
  LBookmarkIndex: Integer;
  LTextPosition: TBCEditorTextPosition;
begin
  if Assigned(Bookmarks) then
  begin
    for i := 0 to Bookmarks.Count - 1 do
    begin
      LTemp := Bookmarks.Strings[i];
      if Pos(Editor.DocumentName, LTemp) <> 0 then
      begin
        LTemp := RemoveTokenFromStart('=', LTemp);
        LBookmarkIndex := StrToInt(GetNextToken(';', LTemp));
        LTemp := RemoveTokenFromStart(';', LTemp);
        LTextPosition.Line := StrToInt(GetNextToken(';', LTemp));
        LTemp := RemoveTokenFromStart(';', LTemp);
        LTextPosition.Char := StrToInt(LTemp);
        Editor.SetBookMark(LBookmarkIndex, LTextPosition);
      end;
    end;
  end;
end;

procedure TEBDocument.AddToReopenFiles(const FileName: string);
var
  i: Integer;
  LFiles: TStrings;
  LIniFile: string;
begin
  LIniFile := GetIniFilename;
  LFiles := TStringList.Create;
  try
    { Read section }
    with TBigIniFile.Create(LIniFile) do
    try
      ReadSectionValues('FileReopenFiles', LFiles);
    finally
      Free;
    end;
    { Insert filename }
    for i := 0 to LFiles.Count - 1 do
      LFiles[i] := System.Copy(LFiles[i], Pos('=', LFiles[i]) + 1, Length(LFiles[i]));
    for i := LFiles.Count - 1 downto 0 do
      if LFiles[i] = FileName then
        LFiles.Delete(i);
    LFiles.Insert(0, FileName);
    while LFiles.Count > 10 do
      LFiles.Delete(LFiles.Count - 1);
    { write section }
    with TBigIniFile.Create(LIniFile) do
    try
      EraseSection('FileReopenFiles');
      for i := 0 to LFiles.Count - 1 do
        WriteString('FileReopenFiles', IntToStr(i), LFiles.Strings[i]);
    finally
      Free;
    end;
    { if ini file is open in editor reload it because time has changed }
    for i := 0 to PageControl.PageCount - 2 do
      if PageControl.Pages[i].Caption = ExtractFileName(LIniFile) then
        Refresh(i);
  finally
    LFiles.Free;
  end;
end;

procedure TEBDocument.Open(const Filename: string; ASetActivePage: Boolean);
begin
  Open(Filename, nil, 0, 0, False, False, '', '', ASetActivePage);
end;

procedure TEBDocument.Open(const Filename: string; ALine: Integer; AChar: Integer);
begin
  Open(Filename, nil, ALine, AChar);
end;

procedure TEBDocument.Open(const FileName: string = ''; Bookmarks: TStrings = nil; ALine: Integer = 0; AChar: Integer = 0;
  StartUp: Boolean = False; ShowMinimap: Boolean = False; const AHighlighter: string = ''; const AColor: string = '';
  ASetActivePage: Boolean = True);
var
  i: Integer;
  LTabSheet: TsTabSheet;
  LEditor: TBCEditor;
begin
  FProcessing := True;
  try
    if FileName = '' then
    begin
      OpenDialog.Filter := OptionsContainer.Filters;
      OpenDialog.Title := LanguageDataModule.GetConstant('Open');
      if OpenDialog.Execute(Application.Handle) then
        for i := 0 to OpenDialog.Files.Count - 1 do
          Open(OpenDialog.Files[i])
    end
    else
    begin
      if FileExists(FileName) then
      begin
        LEditor := FindOpenFile(FileName);
        if not Assigned(LEditor) then
        begin
          LTabSheet := CreateNewTabSheet(FileName, ShowMinimap, AHighlighter, AColor, ASetActivePage);
          LEditor := LTabSheet.Editor;
        end;
        SetEditorBookmarks(LEditor, Bookmarks);

        LEditor.GotoLineAndCenter(ALine);
        LEditor.TextCaretPosition := GetTextPosition(AChar, ALine);
        if LEditor.CanFocus then
          LEditor.SetFocus;
        if not StartUp then
        begin
          AddToReopenFiles(FileName);
          if Assigned(FCreateFileReopenList) then
            FCreateFileReopenList;
        end;
      end
      else
      if ExtractFileName(FileName) <> '' then
        ShowErrorMessage(Format(LanguageDataModule.GetErrorMessage('FileNotFound'), [FileName]))
    end;
  finally
    FProcessing := False;
  end;
end;

function TEBDocument.Close(AFreePage: Boolean = True; ATabIndex: Integer = -1): Integer;
var
  LActivePageIndex: Integer;
  LEditor: TBCEditor;
begin
  Result := mrNone;

  if ATabIndex <> -1 then
    LEditor := (PageControl.Pages[ATabIndex] as TsTabSheet).Editor
  else
    LEditor := GetActiveEditor;

  PageControl.TabClosed := True;
  if Assigned(LEditor) and LEditor.Modified then
  begin
    Result := SaveChanges;
    if Result = mrYes then
      Save;
  end;

  if Result <> mrCancel then
  begin
    if ATabIndex = -1 then
      LActivePageIndex := PageControl.ActivePageIndex
    else
      LActivePageIndex := ATabIndex;
    if AFreePage and (PageControl.PageCount > 0) then
    begin
      PageControl.Pages[LActivePageIndex].Free;
      if LActivePageIndex > 0 then
        PageControl.ActivePageIndex := LActivePageIndex - 1
      else
      if PageControl.PageCount > 0 then
        PageControl.ActivePageIndex := 0;
    end
    else
    begin
      TsTabSheet(PageControl.Pages[LActivePageIndex]).TabVisible := False;
      PageControl.Pages[LActivePageIndex].PageIndex := LActivePageIndex + 1;
    end;
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  if Assigned(FSetTitleBarMenuCaptions) then
    FSetTitleBarMenuCaptions;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
end;

procedure TEBDocument.CloseAll;
var
  i, LResult: Integer;
begin
  Application.ProcessMessages;
  FProcessing := True;
  LResult := mrNone;

  if FModifiedDocuments then
  begin
    LResult := SaveChanges;
    if LResult = mrYes then
      SaveAll;
  end;
  if LResult <> mrCancel then
  begin
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Show(PageControl.PageCount - 2);
      Application.ProcessMessages;
      PageControl.Visible := False;
      for i := PageControl.PageCount - 2 downto 0 do
        if TsTabSheet(PageControl.Pages[i]).TabType = ttTab then
        begin
          ProgressBar.StepIt;
          PageControl.Pages[i].Free;
        end;
      PageControl.Visible := True;
    finally
      Screen.Cursor := crDefault;
      FProgressBar.Hide;
    end;
    FNumberOfNewDocument := 0;
  end;
  Application.ProcessMessages;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
  FProcessing := False;
end;

procedure TEBDocument.CloseAllOtherPages;
var
  i: Integer;
  LResult: Integer;
  LActiveEditor, LEditor: TBCEditor;
begin
  Application.ProcessMessages;
  FProcessing := True;

  LResult := mrNone;

  LActiveEditor := GetActiveEditor;

  if GetModifiedDocuments(False) then
  begin
    LResult := SaveChanges(True);

    if LResult = mrYes then
      for i := 0 to PageControl.PageCount - 2 do
      begin
        LEditor := (PageControl.Pages[i] as TsTabSheet).Editor;
        if Assigned(LEditor) and LEditor.Modified and (LEditor <> LActiveEditor) then
          Save(PageControl.Pages[i]);
      end;
  end;

  if LResult <> mrCancel then
  begin
    PageControl.ActivePage.PageIndex := 0; { move the page first }
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Show(PageControl.PageCount - 3);
      Application.ProcessMessages;
      PageControl.Visible := False;
      for i := PageControl.PageCount - 2 downto 1 do
      begin
        ProgressBar.StepIt;
        PageControl.Pages[i].Free;
      end;
      PageControl.Visible := True;
      FProgressBar.Hide;
    finally
      Screen.Cursor := crDefault;
    end;
    PageControl.ActivePageIndex := 0;
    LEditor := GetActiveEditor;
    if Assigned(LEditor) and (LEditor.DocumentName = '') then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;
  Application.ProcessMessages;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
  FProcessing := False;
end;

procedure TEBDocument.CheckModifiedDocuments;
begin
  FModifiedDocuments := GetModifiedDocuments;
end;

function TEBDocument.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  LFileName, LFilePath: string;
  LFilterIndex: Cardinal;
  LTabSheet: TsTabSheet;
begin
  Result := '';
  LTabSheet := TabSheet as TsTabSheet;
  if Assigned(LTabSheet.Editor) then
  begin
    if (LTabSheet.Editor.DocumentName = '') or ShowDialog then
    begin
      if LTabSheet.Editor.DocumentName = '' then
      begin
        LFileName := Trim(TabSheet.Caption);
        LFileName := FormatFileName(LFileName);
      end
      else
        LFileName := LTabSheet.Editor.FileName;

      LFilePath := LTabSheet.Editor.FilePath;
      LFilterIndex := OptionsContainer.GetFilterIndex(ExtractFileExt(LFileName));
      SaveDialog.InitialDir := LFilePath;
      SaveDialog.Filter := OptionsContainer.Filters;
      SaveDialog.Title := LanguageDataModule.GetConstant('SaveAs');
      SaveDialog.FilterIndex := LFilterIndex;
      SaveDialog.FileName := LFileName;
      if SaveDialog.Execute(Application.Handle) then
      begin
        Result := SaveDialog.Files[0];
        if ExtractFileExt(Result) = '' then
          if (LFilterIndex > 1) and (LFilterIndex < OptionsContainer.FilterCount) then
            Result := Format('%s%s', [Result, OptionsContainer.GetFilterExt(LFilterIndex)]);
        TabSheet.Caption := ExtractFileName(Result);
        LTabSheet.Editor.DocumentName := Result;
      end
      else
      begin
        if LTabSheet.Editor.CanFocus then
          LTabSheet.Editor.SetFocus;
        Exit;
      end;
    end;
    with LTabSheet.Editor do
    begin
      SaveToFile(DocumentName);
      if not OptionsContainer.UndoAfterSave then
        UndoList.Clear;
      FileDateTime := GetFileDateTime(DocumentName);
      Modified := False;
      TabSheet.ImageIndex := GetIconIndex(DocumentName);
      TabSheet.Caption := FormatFileName(TabSheet.Caption);
    end;
    CheckModifiedDocuments;
  end;
end;

procedure TEBDocument.Save;
begin
  if Assigned(PageControl.ActivePage) then
    Save(PageControl.ActivePage);
end;

function TEBDocument.SaveAs: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := Save(PageControl.ActivePage, True);
end;

procedure TEBDocument.SaveAll;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  FProcessing := True;
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  try
    FProgressBar.Show(PageControl.PageCount - 2);
    for i := 0 to PageControl.PageCount - 2 do
    begin
      ProgressBar.StepIt;
      Application.ProcessMessages;
      LTabSheet := PageControl.Pages[i] as TsTabSheet;
      if Assigned(LTabSheet.Editor) and LTabSheet.Editor.Modified then
        Save(PageControl.Pages[i]);
    end;
    FProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
  FProcessing := False;
end;

function TEBDocument.GetActivePageCaption: string;
begin
  Result := FormatFileName(PageControl.ActivePage.Caption);
end;

procedure TEBDocument.Undo;

  procedure Undo(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
      begin
        AEditor.DoUndo;
        if AEditor.UndoList.ItemCount = 0 then
          PageControl.ActivePage.Caption := GetActivePageCaption;
      end;
  end;

begin
  Undo(GetActiveEditor);
  Undo(GetActiveSplitEditor);
  CheckModifiedDocuments;
end;

procedure TEBDocument.Redo;

  procedure Redo(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.DoRedo;
  end;

begin
  Redo(GetActiveEditor);
  Redo(GetActiveSplitEditor);
  CheckModifiedDocuments;
end;

procedure TEBDocument.Cut;

  procedure Cut(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CutToClipboard;
  end;

begin
  Cut(GetActiveEditor);
  Cut(GetActiveSplitEditor);
end;

procedure TEBDocument.Copy;

  procedure Copy(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CopyToClipboard;
  end;

begin
  Copy(GetActiveEditor);
  Copy(GetActiveSplitEditor);
end;

procedure TEBDocument.Paste;
var
  LEditor, LSplitEditor: TBCEditor;
  LComboBoxSearchText: TBCComboBox;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) and LEditor.Focused then
    LEditor.PasteFromClipboard
  else
  begin
    LSplitEditor := GetActiveSplitEditor;
    if Assigned(LSplitEditor) and LSplitEditor.Focused then
      LSplitEditor.PasteFromClipboard
    else
    begin
      if Assigned(LEditor) and LEditor.Search.Enabled then
      begin
        LEditor.Search.SearchText := Clipboard.AsText;
        if Assigned(LSplitEditor) and LSplitEditor.Search.Enabled then
          LSplitEditor.Search.SearchText := Clipboard.AsText;

        if not OptionsContainer.DocumentSpecificSearch then
          OptionsContainer.DocumentSpecificSearchText := Clipboard.AsText;

        LComboBoxSearchText := GetActiveComboBoxSearchText;
        if Assigned(LComboBoxSearchText) then
          LComboBoxSearchText.Text := LEditor.Search.SearchText;
      end;
    end;
  end;
end;

procedure TEBDocument.InitializeEditorPrint(EditorPrint: TBCEditorPrint);
var
  LEditor: TBCEditor;
  LAlignment: TAlignment;

  procedure SetHeaderFooter(Option: Integer; Value: string);
  begin
    case Option of
      0, 1:
        with EditorPrint.Footer do
        begin
          case Option of
            0:
              LAlignment := taLeftJustify;
            1:
              LAlignment := taRightJustify;
          end;
          Add(Value, nil, LAlignment, 1);
        end;
      2, 3:
        with EditorPrint.Header do
        begin
          case Option of
            2:
              LAlignment := taLeftJustify;
            3:
              LAlignment := taRightJustify;
          end;
          Add(Value, nil, LAlignment, 1);
        end;
    end;
  end;

begin
  LEditor := GetActiveEditor;
  if not Assigned(LEditor) then
    Exit;

  EditorPrint.Editor := LEditor;
  EditorPrint.Title := LEditor.DocumentName;

  EditorPrint.Header.Clear;
  EditorPrint.Footer.Clear;

  SetHeaderFooter(0, Format(LanguageDataModule.GetConstant('PrintedBy'), [Application.Title]));
  SetHeaderFooter(1, LanguageDataModule.GetConstant('PreviewDocumentPage'));
  SetHeaderFooter(2, LEditor.DocumentName);
  SetHeaderFooter(3, '$DATE$ $TIME$');

  EditorPrint.Header.FrameTypes := [ftLine];
  EditorPrint.Footer.FrameTypes := [ftLine];
  EditorPrint.LineNumbersInMargin := True;
  EditorPrint.LineNumbers := True;
  EditorPrint.Wrap := False;
  EditorPrint.Colors := True;
end;

procedure TEBDocument.PrintPreview;
begin
  if Printer.Printers.Count = 0 then
  begin
    ShowErrorMessage(LanguageDataModule.GetMessage('NoDefaultPrinter'));
    Exit;
  end;
  with PrintPreviewDialog do
  begin
    InitializeEditorPrint(PrintPreview.EditorPrint);
    ShowModal;
  end;
end;

{ TODO: Split? }
function TEBDocument.ToggleSearch(AShowPanel: Boolean = False): Boolean;
var
  LTabSheet: TsTabSheet;

  procedure ReadSearchOptions(AEditor: TBCEditor);

    procedure SetOption(Enabled: Boolean; Option: TBCEditorSearchOption);
    begin
      if Enabled then
        AEditor.Search.Options := AEditor.Search.Options + [Option]
      else
        AEditor.Search.Options := AEditor.Search.Options - [Option];
    end;

  begin
    with TBigIniFile.Create(GetIniFilename) do
    try
      SetOption(ReadBool('Options', 'SearchBeepIfSearchStringNotFound', True), soBeepIfStringNotFound);
      SetOption(ReadBool('Options', 'SearchCaseSensitive', False), soCaseSensitive);
      SetOption(ReadBool('Options', 'SearchEntireScope', False), soEntireScope);
      SetOption(ReadBool('Options', 'SearchHighlightResult', True), soHighlightResults);
      if ReadBool('Options', 'SearchRegularExpression', False) then
        AEditor.Search.Engine := seRegularExpression
      else
      if ReadBool('Options', 'SearchWildCard', False) then
        AEditor.Search.Engine := seWildCard
      else
        AEditor.Search.Engine := seNormal;
      SetOption(ReadBool('Options', 'SearchOnTyping', True), soSearchOnTyping);
      SetOption(ReadBool('Options', 'SearchSelectedOnly', False), soSelectedOnly);
      SetOption(ReadBool('Options', 'SearchShowSearchMatchNotFound', True), soShowSearchMatchNotFound);
      SetOption(ReadBool('Options', 'SearchShowSearchStringNotFound', False), soShowStringNotFound);
      SetOption(ReadBool('Options', 'SearchWholeWordsOnly', False), soWholeWordsOnly);
    finally
      Free;
    end;
  end;

begin
  Result := False;

  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if Assigned(LTabSheet.PanelSearch) then
  begin
    if AShowPanel then
      LTabSheet.PanelSearch.Visible := True
    else
      LTabSheet.PanelSearch.Visible := not LTabSheet.PanelSearch.Visible;

    LTabSheet.Editor.Search.Visible := LTabSheet.PanelSearch.Visible;

    if LTabSheet.PanelSearch.Visible then
      ReadSearchOptions(LTabSheet.Editor);

    Result := LTabSheet.PanelSearch.Visible;

    if Result then
    begin
      if Assigned(LTabSheet.ComboBoxSearchText) then
        if LTabSheet.ComboBoxSearchText.CanFocus then
          LTabSheet.ComboBoxSearchText.SetFocus;
    end;
  end;
end;

function TEBDocument.SetDocumentSpecificSearchText(AEditor: TBCEditor): Boolean;
begin
  Result := False;
  if not OptionsContainer.DocumentSpecificSearch then
    if AEditor.Search.SearchText <> OptionsContainer.DocumentSpecificSearchText then
    begin
      AEditor.Search.SearchText := OptionsContainer.DocumentSpecificSearchText;
      Result := True;
    end;
end;

procedure TEBDocument.FindNext;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if not Assigned(LEditor) then
    Exit;
  if not SetDocumentSpecificSearchText(LEditor) then
    LEditor.FindNext;
end;

procedure TEBDocument.FindPrevious;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if not Assigned(LEditor) then
    Exit;
  if not SetDocumentSpecificSearchText(LEditor) then
    LEditor.FindPrevious;
end;

procedure TEBDocument.Replace;
var
  i: Integer;
  LEditor: TBCEditor;
  LResult: Integer;
begin
  FProcessing := True;

  with ReplaceDialog do
  begin
    LEditor := GetActiveEditor;
    if not Assigned(LEditor) then
      Exit;
    if LEditor.SelectionAvailable then
      SearchFor := LEditor.SelectedText;
    LResult := ShowModal;

    if (LResult = mrOK) or (LResult = mrYes) then
    begin
      if ReplaceInWholeFile then
      begin
        GetOptions(LEditor);
        LEditor.CaretZero;
        Screen.Cursor := crHourGlass;
        try
          LEditor.ReplaceText(SearchFor, ReplaceWith);
          SetActivePageCaptionModified(LEditor.Modified);
        finally
          Screen.Cursor := crDefault;
        end;
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        try
          FProgressBar.Show(PageControl.PageCount - 2);
          for i := 0 to PageControl.PageCount - 2 do
          begin
            ProgressBar.StepIt;
            Application.ProcessMessages;
            LEditor := (PageControl.Pages[i] as TsTabSheet).Editor;
            GetOptions(LEditor);
            LEditor.CaretZero;
            LEditor.ReplaceText(SearchFor, ReplaceWith);
            PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, LEditor.Modified);
          end;
        finally
          Screen.Cursor := crDefault;
          FProgressBar.Hide;
        end;
      end;
    end;
  end;
  CheckModifiedDocuments;
  FProcessing := False;
end;

procedure TEBDocument.ToggleBookmark(AItemIndex: Integer);
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.ToggleBookmark(AItemIndex);
end;

function TEBDocument.ToggleWordWrap: Boolean;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  OptionsContainer.EnableWordWrap := not OptionsContainer.EnableWordWrap;
  Result := OptionsContainer.EnableWordWrap;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    LTabSheet.Editor.WordWrap.Enabled := Result;
    if Assigned(LTabSheet.SplitEditor) then
      LTabSheet.SplitEditor.WordWrap.Enabled := Result;
  end;
end;

function TEBDocument.ToggleSpecialChars: Boolean;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  OptionsContainer.EnableSpecialChars := not OptionsContainer.EnableSpecialChars;
  Result := OptionsContainer.EnableSpecialChars;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    LTabSheet.Editor.SpecialChars.Visible := Result;
    LTabSheet.Editor.SpecialChars.EndOfLine.Visible := Result;
    if Assigned(LTabSheet.SplitEditor) then
    begin
      LTabSheet.SplitEditor.SpecialChars.Visible := Result;
      LTabSheet.SplitEditor.SpecialChars.EndOfLine.Visible := Result;
    end;
    //if PageControl.Pages[i].Components[0] is TCompareFrame then
    //  Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleSpecialChars
  end;
end;

procedure TEBDocument.ToggleSelectionMode;
var
  i: Integer;
  LTabSheet: TsTabSheet;

  procedure ToggleSelectionMode(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
    begin
      if OptionsContainer.EnableSelectionMode then
      begin
        Editor.Selection.Options := Editor.Selection.Options - [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
      end
      else
      begin
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smNormal
      end;
    end;
  end;

begin
  OptionsContainer.EnableSelectionMode := not OptionsContainer.EnableSelectionMode;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    ToggleSelectionMode(LTabSheet.Editor);
    ToggleSelectionMode(LTabSheet.SplitEditor);
  end;
end;

function TEBDocument.ToggleLineNumbers: Boolean;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  OptionsContainer.EnableLineNumbers := not OptionsContainer.EnableLineNumbers;
  Result := OptionsContainer.EnableLineNumbers;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    LTabSheet.Editor.LeftMargin.LineNumbers.Visible := Result;
    if Assigned(LTabSheet.SplitEditor) then
      LTabSheet.SplitEditor.LeftMargin.LineNumbers.Visible := Result;
    //if PageControl.Pages[i].Components[0] is TCompareFrame then
    //  Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleLineNumbers
  end;
end;

function TEBDocument.ReadIniOpenFiles: Boolean;
var
  i: Integer;
  s, LFileName, LHighlighter, LColor: string;
  LFileNamesList, LBookmarksList: TStrings;
  LCaretXList, LCaretYList, LMinimapsList: TValueListEditor;
  LCaretX, LCaretY: Integer;
  LMinimap: Boolean;

  function GetIntegerListItem(AList: TValueListEditor; AIndex: Integer): Integer;
  begin
    if AIndex >= AList.Strings.Count then
      Result := 0
    else
      Result := StrToInt(AList.Values[IntToStr(AIndex)])
  end;

  function GetBooleanListItem(AList: TValueListEditor; AIndex: Integer): Boolean;
  begin
    if AIndex >= AList.Strings.Count then
      Result := False
    else
      Result := AList.Values[IntToStr(AIndex)] = 'True'
  end;

begin
  LFileNamesList := TStringList.Create;
  LBookmarksList := TStringList.Create;
  LCaretXList := TValueListEditor.Create(nil);
  LCaretYList := TValueListEditor.Create(nil);
  LMinimapsList := TValueListEditor.Create(nil);
  with TBigIniFile.Create(GetIniFilename) do
  try
    PageControl.Visible := False;
    { Open Files }
    ReadSectionValues('OpenFiles', LFileNamesList);
    ReadSectionValues('Bookmarks', LBookmarksList);
    ReadSectionValues('CaretX', LCaretXList.Strings);
    ReadSectionValues('CaretY', LCaretYList.Strings);
    ReadSectionValues('Minimaps', LMinimapsList.Strings);

    for i := 0 to LFileNamesList.Count - 1 do
    begin
      s := RemoveTokenFromStart('=', LFileNamesList.Strings[i]);
      LFileName := GetNextToken(';', s);
      if FileExists(LFileName) then
      begin
        s := RemoveTokenFromStart(';', s);
        LHighlighter := GetNextToken(';', s);
        s := RemoveTokenFromStart(';', s);
        LColor := GetNextToken(';', s);
        LCaretX := GetIntegerListItem(LCaretXList, i);
        LCaretY := GetIntegerListItem(LCaretYList, i);
        LMinimap := GetBooleanListItem(LMinimapsList, i);
        Open(LFileName, LBookmarksList, LCaretY, LCaretX, True, LMinimap, LHighlighter, LColor);
      end;
    end;

    i := ReadInteger('Options', 'ActivePageIndex', 0);
    if i < PageControl.PageCount then
    begin
      PageControl.ActivePageIndex := i;
      if Assigned(FSetTitleBarMenuCaptions) then
        FSetTitleBarMenuCaptions;
    end;

    Result := LFileNamesList.Count > 0;
  finally
    LFileNamesList.Free;
    LBookmarksList.Free;
    LCaretXList.Free;
    LCaretYList.Free;
    LMinimapsList.Free;
    Free;
    PageControl.Visible := True;
  end;
end;

procedure TEBDocument.WriteIniFile;
var
  i, j: Integer;
  LFileType: string;
  LTabSheet: TsTabSheet;
  LTextCaretPosition: TBCEditorTextPosition;
  LLanguageItem: string;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    EraseSection('OpenFiles');
    EraseSection('Bookmarks');
    EraseSection('Minimaps');
    EraseSection('CaretX');
    EraseSection('CaretY');
    { Open documents and bookmarks }
    if OptionsContainer.DocSaveTabs then
      for i := 0 to PageControl.PageCount - 2 do
      begin
        LTabSheet := PageControl.Pages[i] as TsTabSheet;
        if Assigned(LTabSheet.Editor) then
        begin
          if Trim(LTabSheet.Editor.DocumentName) <> '' then
            WriteString('OpenFiles', IntToStr(i), Format('%s;%s;%s;', [LTabSheet.Editor.DocumentName,
              LTabSheet.Editor.Highlighter.Name, LTabSheet.Editor.Highlighter.Colors.Name]));
          for j := 0 to LTabSheet.Editor.Marks.Count - 1 do
            WriteString('Bookmarks', Format('%s:%s', [LTabSheet.Editor.DocumentName, IntToStr(j)]),
              Format('%s;%s;%s', [IntToStr(LTabSheet.Editor.Marks.Items[j].Index),
              IntToStr(LTabSheet.Editor.Marks.Items[j].Line), IntToStr(LTabSheet.Editor.Marks.Items[j].Char)]));
          WriteBool('Minimaps', IntToStr(i), LTabSheet.Editor.Minimap.Visible);
          LTextCaretPosition := LTabSheet.Editor.TextCaretPosition;
        end;
        WriteInteger('CaretY', IntToStr(i), LTextCaretPosition.Line);
        WriteInteger('CaretX', IntToStr(i), LTextCaretPosition.Char);
      end;
    { Active document }
    WriteInteger('Options', 'ActivePageIndex', PageControl.ActivePageIndex);
    EraseSection('FileTypes');
    { FileTypes }
    for i := 0 to OptionsContainer.FileTypes.Count - 1 do
    begin
      LLanguageItem := LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text;
      LFileType := Trim(System.Copy(LLanguageItem, 0, Pos('(', LLanguageItem) - 1));
      LFileType := Format('%s (%s)', [LFileType, StringBetween(OptionsContainer.FileTypes.Strings[i], '(', ')')]);
      WriteString('FileTypes', LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Name, LFileType);
    end;
  finally
    Free;
  end;
end;

procedure TEBDocument.InsertTag;
var
  LEditor: TBCEditor;
  LTagName: string;
begin
  if TInputQueryDialog.ClassShowModal(Application.MainForm, LanguageDataModule.GetConstant('InsertTags'), LTagName) = mrOK then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
    begin
      LEditor.CommandProcessor(ecImeStr, EDITBONE_NONE_CHAR, PWideChar(Format('<%s></%s>', [LTagName, LTagName])));
      LEditor.DisplayCaretX := LEditor.DisplayCaretX - Length(LTagName) - 3; { -3 from </> }
    end;
  end;
end;

procedure TEBDocument.InsertDateAndTime;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.CommandProcessor(ecImeStr, EDITBONE_NONE_CHAR, PWideChar(DateTimeToStr(Now)));
end;

function TEBDocument.Options(AActionList: TActionList): Boolean;
var
  ActionList: TObjectList<TAction>;
begin
  FProcessing := True;
  ActionList := GetActionList;
  try
    Result := OptionsForm.Execute(ActionList);
    if Result then
    begin
      SetOptions;
      UpdateHighlighterColors;
      WriteIniFile;
    end;
  finally
    if Assigned(ActionList) then
      ActionList.Free;
    FProcessing := False;
  end;
end;

procedure TEBDocument.CreateImageList;
var
  LSysImageList: THandle;
  LIcon: TIcon;
begin
  if not Assigned(FImages) then
    FImages := TImageList.Create(nil);
  LSysImageList := GetSysImageList;
  if LSysImageList <> 0 then
  begin
    FImages.Handle := LSysImageList;
    FImages.BkColor := clNone;
    FImages.ShareImages := True;
  end;
  { compare and new image index }
  LIcon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case FImages.Height of
      16:
        begin
          { smaller }
          EBDataModuleImages.ImageListDocument16.GetIcon(0, LIcon);
          FCompareImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          EBDataModuleImages.ImageListDocument16.GetIcon(1, LIcon);
          FNewImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          if Assigned(FTabSheetNew) then
          begin
            EBDataModuleImages.ImageListDocument16.GetIcon(2, LIcon);
            FTabSheetNew.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          end;
        end;
      20:
        begin
          { medium }
          EBDataModuleImages.ImageListDocument20.GetIcon(0, LIcon);
          FCompareImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          EBDataModuleImages.ImageListDocument20.GetIcon(1, LIcon);
          FNewImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          if Assigned(FTabSheetNew) then
          begin
            EBDataModuleImages.ImageListDocument20.GetIcon(2, LIcon);
            FTabSheetNew.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          end;
        end;
      24:
        begin
          { larger }
          EBDataModuleImages.ImageListDocument24.GetIcon(0, LIcon);
          FCompareImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          EBDataModuleImages.ImageListDocument24.GetIcon(1, LIcon);
          FNewImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          if Assigned(FTabSheetNew) then
          begin
            EBDataModuleImages.ImageListDocument24.GetIcon(2, LIcon);
            FTabSheetNew.ImageIndex := ImageList_AddIcon(FImages.Handle, LIcon.Handle);
          end;
        end;
    end;
  finally
    LIcon.Free;
  end;
end;

procedure TEBDocument.SetOptions;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  PageControl.MultiLine := OptionsContainer.DocMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.DocShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DocRightClickSelect;
  if OptionsContainer.DocShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  if Assigned(FTabSheetNew) then
    FTabSheetNew.TabVisible := OptionsContainer.DocShowNewDocumentButton;
  { assign to every Editor }
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    OptionsContainer.AssignTo(LTabSheet.Editor);
    if Assigned(LTabSheet.SplitEditor) then
      OptionsContainer.AssignTo(LTabSheet.SplitEditor);
  end;
end;

procedure TEBDocument.SearchClose;
var
  LTabSheet: TsTabSheet;
begin
  LTabSheet := PageControl.ActivePage as TsTabSheet;

  if Assigned(LTabSheet.PanelSearch) then
    LTabSheet.PanelSearch.Visible := False;

  LTabSheet.Editor.Search.Visible := False;
end;

function TEBDocument.GetActiveComboBoxSearchText: TBCComboBox;
begin
  if Assigned(PageControl.ActivePage) then
  begin
    Result := (PageControl.ActivePage as TsTabSheet).FComboBoxSearchText
  end
  else
    Result := nil;
end;

procedure TEBDocument.GotoBookmarks(ItemIndex: Integer);
var
  LEditor: TBCEditor;
  LEditorCommand: TBCEditorCommand;
begin
  LEditorCommand := ecNone;
  case ItemIndex of
    1:
      LEditorCommand := ecGotoBookmark1;
    2:
      LEditorCommand := ecGotoBookmark2;
    3:
      LEditorCommand := ecGotoBookmark3;
    4:
      LEditorCommand := ecGotoBookmark4;
    5:
      LEditorCommand := ecGotoBookmark5;
    6:
      LEditorCommand := ecGotoBookmark6;
    7:
      LEditorCommand := ecGotoBookmark7;
    8:
      LEditorCommand := ecGotoBookmark8;
    9:
      LEditorCommand := ecGotoBookmark9;
  end;
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.CommandProcessor(LEditorCommand, Char(ItemIndex), nil);
end;

procedure TEBDocument.GotoLine;
var
  LEditor: TBCEditor;
  LLine: Integer;
begin
  if TInputQueryDialog.ClassShowModal(Application.MainForm, LanguageDataModule.GetConstant('GoToLine'), LLine) = mrOK then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
      LEditor.GotoLineAndCenter(LLine);
  end;
end;

procedure TEBDocument.HTMLExport;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    SaveDialog.InitialDir := '';
    SaveDialog.Filter := LanguageDataModule.GetFileTypes('HTML with Scripts') + '|*.html;*.htm';
    SaveDialog.Title := LanguageDataModule.GetConstant('SaveAs');
    SaveDialog.FileName := '';
    SaveDialog.DefaultExt := 'html';
    if SaveDialog.Execute(Application.Handle) then
      LEditor.ExportToHTML(SaveDialog.FileName);
  end;
end;

function TEBDocument.GetActiveSplitEditor: TBCEditor;
begin
  if Assigned(PageControl.ActivePage) then
    Result := (PageControl.ActivePage as TsTabSheet).SplitEditor
  else
    Result := nil;
end;

function TEBDocument.GetActiveEditor: TBCEditor;
begin
  if Assigned(PageControl.ActivePage) then
    Result := (PageControl.ActivePage as TsTabSheet).Editor
  else
    Result := nil;
end;

procedure TEBDocument.SetActivePageCaptionModified(AModified: Boolean);
begin
  PageControl.ActivePage.Caption := FormatFileName(PageControl.ActivePage.Caption, AModified);
end;

procedure TEBDocument.EditorOnChange(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  inherited;
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if not FModifiedDocuments then
      FModifiedDocuments := LEditor.Modified;

    if OptionsContainer.AutoSave then
      Save
    else
    if not FProcessing then
      SetActivePageCaptionModified(LEditor.Modified);
  end;
end;

function TEBDocument.GetActiveDocumentName: string;
var
  LEditor: TBCEditor;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
      if LEditor.DocumentName <> '' then
        Result := FormatFileName(LEditor.DocumentName, LEditor.Modified);
  end;
end;

function TEBDocument.GetActiveFileName: string;
var
  LEditor: TBCEditor;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
      Result := LEditor.FileName
  end;
end;

function TEBDocument.GetModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  Result := True;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    if (LTabSheet.TabType = ttTab) and LTabSheet.TabVisible then
      if CheckActive or ((PageControl.ActivePageIndex <> i) and not CheckActive) then
        if Assigned(LTabSheet.Editor) then
          if LTabSheet.Editor.Modified then
            Exit;
  end;
  Result := False;
end;

function TEBDocument.GetCanUndo: Boolean;
var
  LEditor: TBCEditor;
begin
  Result := False;
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    Result := LEditor.UndoList.ItemCount > 0;

  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
    Result := Result or (LEditor.UndoList.ItemCount > 0);
end;

function TEBDocument.GetCanRedo: Boolean;
var
  LEditor: TBCEditor;
begin
  Result := False;
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    Result := LEditor.RedoList.ItemCount > 0;

  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
    Result := Result or (LEditor.RedoList.ItemCount > 0);
end;

procedure TEBDocument.EditorReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer;
  DeleteLine: Boolean; var Action: TBCEditorReplaceAction);
var
  LConfirmText: string;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    if DeleteLine then
      LConfirmText := LanguageDataModule.GetYesOrNoMessage('DeleteLine')
    else
      LConfirmText := Format(LanguageDataModule.GetYesOrNoMessage('ReplaceOccurence'), [ASearch, AReplace]);

    case TConfirmReplaceDialog.ClassShowModal(Application.MainForm, LConfirmText) of
      mrYes:
        Action := raReplace;
      mrYesToAll:
        Action := raReplaceAll;
      mrNo:
        Action := raSkip;
    else
      Action := raCancel;
    end;
  end;
end;

procedure TEBDocument.EditorCaretChanged(Sender: TObject; X, Y: Integer);
begin
  inherited;
  FCaretInfo := Format('%d: %d', [Y, X]);
  if Assigned(FStatusBar) then
    FStatusBar.Repaint;
end;

function TEBDocument.GetModifiedInfo(AEditor: TBCEditor): string;
begin
  Result := '';
  if OptionsContainer.AutoSave then
    Result := LanguageDataModule.GetConstant('AutoSave')
  else
  if Assigned(AEditor) then
    if AEditor.Modified then
      Result := LanguageDataModule.GetConstant('Modified');
end;

procedure TEBDocument.NextPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex + 1;
    if i >= PageControl.PageCount - 1 then
      i := 0;
    PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;
  end;
end;

procedure TEBDocument.PreviousPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex - 1;
    if i < 0 then
      i := PageControl.PageCount - 2;
    PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;;
  end;
end;

procedure TEBDocument.CheckFileDateTimes;
var
  i: Integer;
  LTabSheet: TsTabSheet;
  LFileDateTime: TDateTime;
  LDialogResult: Integer;
begin
  LDialogResult := mrNo;
  if FProcessing then
    Exit;
  FProcessing := True;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    if Assigned(LTabSheet.Editor) then
      if LTabSheet.Editor.DocumentName <> '' then
      begin
        LFileDateTime := GetFileDateTime(LTabSheet.Editor.DocumentName);
        if (LFileDateTime <> 0) and (LFileDateTime <> LTabSheet.Editor.FileDateTime) then
        begin
          if FileExists(LTabSheet.Editor.DocumentName) then
          begin
            PageControl.TabClosed := True; { just to avoid begin drag }
            if not(LDialogResult in [mrYesToAll, mrNoToAll]) then
              LDialogResult := AskYesOrNoAll(Format(LanguageDataModule.GetYesOrNoMessage('DocumentTimeChanged'),
                [LTabSheet.Editor.DocumentName]));
            if LDialogResult in [mrYes, mrYesToAll] then
              Refresh(i);
          end
          else
          begin
            if OptionsContainer.AutoSave then
              Save
            else
            begin
              LTabSheet.Editor.Modified := True;
              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, LTabSheet.Editor.Modified);
              PageControl.Invalidate;
            end;
          end;
        end;
      end;
  end;
  FProcessing := False;
end;

procedure TEBDocument.Refresh(Page: Integer);
var
  LTabSheet: TsTabSheet;
begin
  if (Page < 0) or (Page > PageControl.PageCount - 2) then
    Exit;
  LTabSheet := PageControl.Pages[Page] as TsTabSheet;
  if Assigned(LTabSheet.Editor) then
  begin
    LTabSheet.Editor.LoadFromFile(LTabSheet.Editor.DocumentName);
    LTabSheet.Editor.FileDateTime := GetFileDateTime(LTabSheet.Editor.DocumentName);
  end;
end;

procedure TEBDocument.DecreaseIndent;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.CommandProcessor(ecBlockUnindent, 'U', nil);
end;

procedure TEBDocument.IncreaseIndent;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.CommandProcessor(ecBlockIndent, 'I', nil);
end;

procedure TEBDocument.SelectAll;
var
  LComboBoxSearchText: TBCComboBox;

  procedure SelectAll(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.SelectAll;
  end;

begin
  LComboBoxSearchText := GetActiveComboBoxSearchText;
  if Assigned(LComboBoxSearchText) and LComboBoxSearchText.Focused then
    LComboBoxSearchText.SelectAll
  else
  begin
    SelectAll(GetActiveEditor);
    SelectAll(GetActiveSplitEditor);
  end;
end;

procedure TEBDocument.ToggleCase(ACase: TBCEditorCase = cNone);
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.ToggleSelectedCase(ACase);
  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
    LEditor.ToggleSelectedCase(ACase);
end;

procedure TEBDocument.DeleteWhiteSpace;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.DeleteWhiteSpace;
  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
    LEditor.DeleteWhiteSpace;
end;

procedure TEBDocument.Sort(ASortOrder: TBCEditorSortOrder = soToggle);
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.Sort(ASortOrder);
  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
    LEditor.Sort(ASortOrder);
end;

procedure TEBDocument.ClearBookmarks;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    LEditor.ClearBookmarks;
    LEditor.Invalidate;
  end;
  LEditor := GetActiveSplitEditor;
  if Assigned(LEditor) then
  begin
    LEditor.ClearBookmarks;
    LEditor.Invalidate;
  end;
end;

procedure TEBDocument.InsertLine;

  procedure InsertLine(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CommandProcessor(ecInsertLine, 'N', nil);
  end;

begin
  InsertLine(GetActiveEditor);
  InsertLine(GetActiveSplitEditor);
end;

procedure TEBDocument.DeleteWord;

  procedure DeleteWord(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CommandProcessor(ecDeleteWord, 'T', nil);
  end;

begin
  DeleteWord(GetActiveEditor);
  DeleteWord(GetActiveSplitEditor);
end;

procedure TEBDocument.DeleteLine;

  procedure DeleteLine(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CommandProcessor(ecDeleteLine, 'Y', nil);
  end;

begin
  DeleteLine(GetActiveEditor);
  DeleteLine(GetActiveSplitEditor);
end;

procedure TEBDocument.DeleteEndOfLine;

  procedure DeleteEndOfLine(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
        AEditor.CommandProcessor(ecDeleteEndOfLine, 'Y', nil);
  end;

begin
  DeleteEndOfLine(GetActiveEditor);
  DeleteEndOfLine(GetActiveSplitEditor);
end;

procedure TEBDocument.ShowInfo;
var
  Editor: TBCEditor;

  function LengthWithoutWhiteSpaces(Str: string): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 1 to Length(Str) do
      if Trim(Str[i]) <> '' then
        Inc(Result);
  end;

begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    ShowMessage(Format(LanguageDataModule.GetMessage('DocumentStatistics'), [Editor.Lines.Count, CHR_ENTER,
      WordCount(Editor.Text), CHR_ENTER, LengthWithoutWhiteSpaces(Editor.Text)]));
end;

function TEBDocument.GetMacroRecordPauseImageIndex: Integer;
var
  Editor: TBCEditor;
begin
  Result := IMAGE_INDEX_RECORD;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Assigned(Editor.MacroRecorder) then
      if Editor.MacroRecorder.State = msRecording then
        Result := IMAGE_INDEX_PAUSE
end;

procedure TEBDocument.SetHighlighter(AEditor: TBCEditor; const AHighlighterName: string);
begin
  if Assigned(AEditor) then
  with AEditor do
  begin
    Highlighter.LoadFromFile(Format('%s.json', [AHighlighterName]));
    CodeFolding.Visible := OptionsContainer.ShowCodeFolding and (Highlighter.CodeFoldingRangeCount > 0);

    Tag := 0;
    if Pos('JSON', AHighlighterName) <> 0 then
      Tag := EXTENSION_JSON
    else
    if Pos('XML', AHighlighterName) <> 0 then
      Tag := EXTENSION_XML
    else
    if Pos('SQL', AHighlighterName) <> 0 then
      Tag := EXTENSION_SQL;

    if CanFocus then
      Invalidate;
  end;
end;

procedure TEBDocument.UpdateHighlighterColors;
var
  i: Integer;
  LTabSheet: TsTabSheet;
begin
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LTabSheet := PageControl.Pages[i] as TsTabSheet;
    if Assigned(LTabSheet.Editor) then
    begin
      LTabSheet.Editor.Highlighter.Colors.LoadFromFile(LTabSheet.Editor.Highlighter.Colors.FileName);
      SetSkinColors(LTabSheet.Editor);
    end;
  end;
end;

procedure TEBDocument.SetSkinColors(Editor: TBCEditor);
var
  i: Integer;
  LColor: TColor;
begin
  LColor := SkinManager.GetActiveEditColor;
  if OptionsContainer.SkinActiveLineBackground then
    Editor.ActiveLine.Color := SkinManager.GetHighLightColor(False);
  if OptionsContainer.SkinBackground then
    Editor.BackgroundColor := LColor;
  if OptionsContainer.SkinCodeFoldingBackground then
    Editor.CodeFolding.Colors.Background := LColor;
  if OptionsContainer.SkinCodeFoldingHintBackground then
    Editor.CodeFolding.Hint.Colors.Background := LColor;
  if OptionsContainer.SkinCompletionProposalBackground then
    Editor.CompletionProposal.Colors.Background := LColor;
  if OptionsContainer.SkinCompletionProposalSelectionBackground then
    Editor.CompletionProposal.Colors.SelectedBackground := LColor;
  if OptionsContainer.SkinLeftMarginBackground then
    Editor.LeftMargin.Colors.Background := LColor;
  if OptionsContainer.SkinBookmarkPanelBackground then
    Editor.LeftMargin.Colors.BookmarkPanelBackground := LColor;
  if OptionsContainer.SkinSelectionForeground then
    Editor.Selection.Colors.Foreground := SkinManager.GetHighLightFontColor;
  if OptionsContainer.SkinSelectionBackground then
    Editor.Selection.Colors.Background := SkinManager.GetHighLightColor;
  for i := 0 to Editor.Highlighter.Colors.Styles.Count - 1 do
    if PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.Name = 'Editor' then
    begin
      if OptionsContainer.SkinForeground then
        PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.Foreground :=
          SkinManager.GetActiveEditFontColor;
      if OptionsContainer.SkinBackground then
        PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.Background := LColor;
      Break;
    end;
  Editor.Highlighter.UpdateColors;
end;

procedure TEBDocument.SetHighlighterColor(AEditor: TBCEditor; const AColorName: string);
begin
  if Assigned(AEditor) then
  with AEditor do
  begin
    Highlighter.Colors.LoadFromFile(Format('%s.json', [AColorName]));
    SetSkinColors(AEditor);
    Invalidate;
  end;
end;

procedure TEBDocument.RecordMacro;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if not Assigned(LEditor.MacroRecorder) then
    begin
      LEditor.MacroRecorder := TBCEditorMacroRecorder.Create(LEditor);
      LEditor.MacroRecorder.RecordMacro(LEditor);
    end
    else
    if LEditor.MacroRecorder.State = msStopped then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('RecordMacro')) then
      begin
        LEditor.MacroRecorder.Clear;
        LEditor.MacroRecorder.RecordMacro(LEditor);
      end;
    end
    else
    if LEditor.MacroRecorder.State = msRecording then
      LEditor.MacroRecorder.Pause
    else
    if LEditor.MacroRecorder.State = msPaused then
      LEditor.MacroRecorder.Resume
  end;
end;

procedure TEBDocument.StopMacro;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if Assigned(LEditor.MacroRecorder) then
      LEditor.MacroRecorder.Stop;
  end;
end;

procedure TEBDocument.SyncEdit;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.SyncEdit.Active := not LEditor.SyncEdit.Active;
end;


procedure TEBDocument.PlaybackMacro;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if Assigned(LEditor.MacroRecorder) then
      LEditor.MacroRecorder.PlaybackMacro(LEditor);
  end;
end;

procedure TEBDocument.SaveMacro;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    if Assigned(LEditor.MacroRecorder) then
    begin
      SaveDialog.InitialDir := '';
      SaveDialog.Filter := Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro'), '|', EDITBONE_NONE_CHAR, [rfReplaceAll]
        )) + EDITBONE_NONE_CHAR + EDITBONE_NONE_CHAR;
      SaveDialog.Title := LanguageDataModule.GetConstant('SaveAs');
      SaveDialog.FileName := '';
      SaveDialog.DefaultExt := 'mcr';
      if SaveDialog.Execute(Application.Handle) then
        LEditor.MacroRecorder.SaveToFile(SaveDialog.Files[0]);
    end;
end;

procedure TEBDocument.LoadMacro;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    OpenDialog.Filter := Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro'), '|', EDITBONE_NONE_CHAR, [rfReplaceAll])) + EDITBONE_NONE_CHAR + EDITBONE_NONE_CHAR;
    OpenDialog.Title := LanguageDataModule.GetConstant('Open');
    OpenDialog.DefaultExt := 'mcr';
    if OpenDialog.Execute(Application.Handle) then
    begin
      if not Assigned(LEditor.MacroRecorder) then
        LEditor.MacroRecorder := TBCEditorMacroRecorder.Create(LEditor);
      LEditor.MacroRecorder.LoadFromFile(OpenDialog.Files[0]);
    end;
  end;
end;

procedure TEBDocument.FileProperties;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    FilePropertiesDialog(LEditor.DocumentName);
end;

procedure TEBDocument.ToggleSplit;
var
  LTabSheet: TsTabSheet;
begin
  LTabSheet := PageControl.ActivePage as TsTabSheet;
  if not Assigned(LTabSheet.SplitEditor) then
  begin
    LTabSheet.Editor.Margins.Bottom := 0;
    LTabSheet.SplitEditor := TBCEditor.Create(PageControl.ActivePage);
    LTabSheet.SplitEditor.Align := alBottom;
    LTabSheet.SplitEditor.AlignWithMargins := True;
    LTabSheet.SplitEditor.Margins.SetBounds(2, 0, 2, 2);
    LTabSheet.SplitEditor.Width := 0; { avoid flickering }
    LTabSheet.SplitEditor.Height := LTabSheet.Editor.Height div 2;
    LTabSheet.SplitEditor.Parent := PageControl.ActivePage;
    OptionsContainer.AssignTo(LTabSheet.SplitEditor);
    LTabSheet.SplitEditor.ChainEditor(LTabSheet.Editor);
    LTabSheet.SplitEditor.SetFocus;
    LTabSheet.SplitEditor.Minimap.Visible := LTabSheet.Editor.Minimap.Visible;
    LTabSheet.SplitEditor.CodeFolding.Visible := LTabSheet.Editor.CodeFolding.Visible;
    { horizontal splitter }
    LTabSheet.SplitterHorizontal := TBCSplitter.Create(PageControl.ActivePage);
    LTabSheet.SplitterHorizontal.Align := alBottom;
    LTabSheet.SplitterHorizontal.Parent := PageControl.ActivePage;
    LTabSheet.SplitterHorizontal.Top := LTabSheet.SplitEditor.Top - 1; { splitter always above }
  end
  else
  begin
    LTabSheet.Editor.Margins.Bottom := 2;
    LTabSheet.SplitEditor.RemoveChainedEditor;
    LTabSheet.SplitEditor.Visible := False;
    LTabSheet.SplitEditor.Parent := nil;
    LTabSheet.SplitEditor.Free;
    LTabSheet.SplitEditor := nil;
    { horizontal splitter }
    LTabSheet.SplitterHorizontal.Parent := nil;
    LTabSheet.SplitterHorizontal.Free;
  end;
end;

procedure TEBDocument.ToggleMiniMap;

  procedure ToggleMinimap(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      AEditor.Minimap.Visible := not AEditor.Minimap.Visible;
  end;

begin
  ToggleMinimap(GetActiveEditor);
  ToggleMinimap(GetActiveSplitEditor);
end;

procedure TEBDocument.FormatXML;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
  begin
    LEditor.BeginUndoBlock;
    try
      LEditor.SelectAll;
      LEditor.SelectedText := BCCommon.StringUtils.FormatXML(LEditor.Text);
    finally
      LEditor.EndUndoBlock;
      LEditor.SetFocus;
    end;
  end;
end;

procedure TEBDocument.FormatSQL;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    if Trim(LEditor.Text) <> '' then
      LEditor.Text := BCCommon.SQL.Formatter.FormatSQL(LEditor.Text, TSQLDatabase(SQLFormatterOptionsContainer.SQLDatabase));
end;

procedure TEBDocument.FormatJSON(AIndentSize: Integer);
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    if Trim(LEditor.Text) <> '' then
    begin
      LEditor.Text := BCCommon.StringUtils.FormatJSON(LEditor.Text, AIndentSize);
      LEditor.CaretZero;
    end;
end;

procedure TEBDocument.SelectHighlighter(AEditor: TBCEditor; const FileName: string);
var
  LExt, LItemString, LToken: string;
  i: Integer;
begin
  LExt := '*' + LowerCase(ExtractFileExt(FileName));

  for i := 0 to OptionsContainer.FileTypes.Count - 1 do
  begin
    LItemString := StringBetween(OptionsContainer.FileTypes.ValueFromIndex[i], '(', ')');
    while LItemString <> '' do
    begin
      LToken := GetNextToken(';', LItemString);
      LItemString := RemoveTokenFromStart(';', LItemString);
      if LExt = LToken then
      begin
        if Pos('SQL', OptionsContainer.FileTypes.Names[i]) <> 0 then
          SetHighlighter(AEditor, OptionsContainer.DefaultSQLHighlighter)
        else
          SetHighlighter(AEditor, OptionsContainer.FileTypes.Names[i]);
        Exit;
      end;
    end;
  end;
  SetHighlighter(AEditor, OptionsContainer.DefaultHighlighter);
end;

function TEBDocument.GetActiveBookmarkList: TBCEditorBookmarkList;
var
  LEditor: TBCEditor;
begin
  Result := nil;
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    Result := LEditor.Marks;
end;

procedure TEBDocument.CollapseAll;
var
  LEditor: TBCEditor;
begin
  LEditor := GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.CodeFoldingCollapseAll;
end;

procedure TEBDocument.DropFiles(Sender: TObject; Pos: TPoint; AFiles: TStrings);
var
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := AFiles.Count;
    ProgressBar.Show(j);
   { if IsCompareFilesActivePage then
    begin
      if j > 1 then
        for i := 0 to j - 1 do
        begin
          ProgressBar.StepIt;
          CompareFiles(Value.Strings[i]);
        end
      else
        CompareFiles(Value.Strings[0], True)
    end
    else }
    for i := 0 to j - 1 do
    begin
      ProgressBar.StepIt;
      Open(AFiles.Strings[i], i = 0);
    end;
  finally
    ProgressBar.Hide;
    Screen.Cursor := crDefault;
  end;
end;

end.
