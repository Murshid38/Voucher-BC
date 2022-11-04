pageextension 50103 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Voucher Type"; Rec."Voucher Type")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Value of Bank No Series';
            }

            field("Voucher No"; Rec."Voucher No")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Value of Bank No Series';
            }
        }
    }
}
