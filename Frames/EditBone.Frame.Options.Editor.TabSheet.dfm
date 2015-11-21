inherited OptionsEditorTabsFrame: TOptionsEditorTabsFrame
  Width = 226
  Height = 182
  Visible = False
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 222
    Height = 182
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object StickyLabelCloseTabByDblClick: TsStickyLabel
      Left = 0
      Top = 4
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Close tab by double-click'
      ParentColor = False
      AttachTo = SliderCloseTabByDblClick
      Gap = 8
    end
    object StickyLabelCloseTabByMiddleClick: TsStickyLabel
      Left = 0
      Top = 27
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Close tab by middle-clicks'
      ParentColor = False
      AttachTo = SliderCloseTabByMiddleClick
      Gap = 8
    end
    object StickyLabelMultiline: TsStickyLabel
      Left = 0
      Top = 50
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Multiline'
      ParentColor = False
      AttachTo = SliderMultiline
      Gap = 8
    end
    object StickyLabelRightClickSelect: TsStickyLabel
      Left = 0
      Top = 73
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Right click select'
      ParentColor = False
      AttachTo = SliderRightClickSelect
      Gap = 8
    end
    object StickyLabelSaveTabs: TsStickyLabel
      Left = 0
      Top = 96
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Save tabs'
      ParentColor = False
      AttachTo = SliderSaveTabs
      Gap = 8
    end
    object StickyLabelShowCloseButton: TsStickyLabel
      Left = 0
      Top = 119
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show close button'
      ParentColor = False
      AttachTo = SliderShowCloseButton
      Gap = 8
    end
    object ShowImageStickyLabelShowImage: TsStickyLabel
      Left = 0
      Top = 165
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show image'
      ParentColor = False
      AttachTo = SliderShowImage
      Gap = 8
    end
    object StickyLabelShowNewDocumentButton: TsStickyLabel
      Left = 0
      Top = 142
      Width = 164
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show new document button'
      ParentColor = False
      AttachTo = SliderShowNewDocumentButton
      Gap = 8
    end
    object SliderCloseTabByDblClick: TsSlider
      Left = 172
      Top = 0
      Width = 50
      AutoSize = True
      TabOrder = 0
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderCloseTabByMiddleClick: TsSlider
      Left = 172
      Top = 23
      Width = 50
      AutoSize = True
      TabOrder = 1
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderMultiline: TsSlider
      Left = 172
      Top = 46
      Width = 50
      AutoSize = True
      TabOrder = 2
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderRightClickSelect: TsSlider
      Left = 172
      Top = 69
      Width = 50
      AutoSize = True
      TabOrder = 3
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderSaveTabs: TsSlider
      Left = 172
      Top = 92
      Width = 50
      AutoSize = True
      TabOrder = 4
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowCloseButton: TsSlider
      Left = 172
      Top = 115
      Width = 50
      AutoSize = True
      TabOrder = 5
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowImage: TsSlider
      Left = 172
      Top = 161
      Width = 50
      AutoSize = True
      TabOrder = 7
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowNewDocumentButton: TsSlider
      Left = 172
      Top = 138
      Width = 50
      AutoSize = True
      TabOrder = 6
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
  end
  inherited FrameAdapter: TsFrameAdapter
    Left = 112
    Top = 30
  end
end
