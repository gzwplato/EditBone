object ToolBarFrame: TToolBarFrame
  Left = 0
  Top = 0
  Width = 343
  Height = 298
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 298
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 320
    ExplicitHeight = 240
    object StandardCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Standard'
      TabOrder = 0
      ReadOnly = False
    end
    object PrintCheckBox: TBCCheckBox
      Left = 9
      Top = 28
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Print'
      TabOrder = 1
      ReadOnly = False
    end
    object DirectoryCheckBox: TBCCheckBox
      Left = 9
      Top = 50
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Directory'
      TabOrder = 2
      ReadOnly = False
    end
    object IndentCheckBox: TBCCheckBox
      Left = 9
      Top = 72
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Indent'
      TabOrder = 3
      ReadOnly = False
    end
    object SortCheckBox: TBCCheckBox
      Left = 9
      Top = 94
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Sort'
      TabOrder = 4
      ReadOnly = False
    end
    object CaseCheckBox: TBCCheckBox
      Left = 9
      Top = 116
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Case'
      TabOrder = 5
      ReadOnly = False
    end
    object DocumentCheckBox: TBCCheckBox
      Left = 9
      Top = 248
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Document'
      TabOrder = 11
      ReadOnly = False
    end
    object MacroCheckBox: TBCCheckBox
      Left = 9
      Top = 226
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Macro'
      TabOrder = 10
      ReadOnly = False
    end
    object ToolsCheckBox: TBCCheckBox
      Left = 9
      Top = 204
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Tools'
      TabOrder = 9
      ReadOnly = False
    end
    object ModeCheckBox: TBCCheckBox
      Left = 9
      Top = 182
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Mode'
      TabOrder = 8
      ReadOnly = False
    end
    object SearchCheckBox: TBCCheckBox
      Left = 9
      Top = 160
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Search'
      TabOrder = 7
      ReadOnly = False
    end
    object CommandCheckBox: TBCCheckBox
      Left = 9
      Top = 138
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Command'
      TabOrder = 6
      ReadOnly = False
    end
  end
end