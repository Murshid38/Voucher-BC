pageextension 50101 UserSetupPageExt extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("User Paid"; Rec."User Paid")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Value of Bank No Series';
            }
        }
    }
}
