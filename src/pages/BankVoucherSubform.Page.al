page 50144 "Bank Voucher Subform"
{
    Caption = 'Bank Voucher Subform';
    PageType = ListPart;
    SourceTable = "Voucher Line";
    SourceTableView = where("Document Type" = filter(Bank));
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field("Document Type"; Rec."Document Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Document Type field.';
                // }
                // field("Document No."; Rec."Document No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Document No. field.';
                // }
                // field("Line No"; Rec."Line No")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Line No field.';
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
}
