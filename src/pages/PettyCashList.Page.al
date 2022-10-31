page 50147 "Petty Cash List"
{
    ApplicationArea = All;
    Caption = 'Petty Cash List';
    PageType = List;
    SourceTable = "Voucher Header";
    UsageCategory = Lists;
    SourceTableView = where("Document Type" = filter("Petty Cash"));
    CardPageId = "Petty Cash Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Advance Settlement Of"; Rec."Advance Settlement Of")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Settlement Of field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                    DrillDownPageId = "Petty Cash Subform";
                }
            }
        }
    }
}
