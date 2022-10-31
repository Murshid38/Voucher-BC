pageextension 50100 SalesSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Bank Nos"; Rec."Bank Nos")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Value of Bank No Series';
            }

            field("Petty Cash Nos"; Rec."Petty Cash Nos")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Value of Bank No Series';
            }
        }
    }
}