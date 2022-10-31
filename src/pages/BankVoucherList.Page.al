page 50143 "Bank Voucher List"
{
    ApplicationArea = All;
    Caption = 'Bank Voucher List';
    PageType = List;
    SourceTable = "Voucher Header";
    UsageCategory = Lists;
    CardPageId = "Bank Voucher Card";
    SourceTableView = WHERE("Document Type" = FILTER(Bank));

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
                field("Advance Settlement Of"; Rec."Advance Settlement Of")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Settlement Of field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
