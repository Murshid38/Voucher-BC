pageextension 50102 "General Journal Ext" extends "General Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field("Voucher Type"; Rec."Voucher Type")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Voucher Type';
            }
            field("Voucher No"; Rec."Voucher No")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Voucher No';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(Post)
        {
            action(PostTask)
            {
                ApplicationArea = All;
                Caption = 'Post Task';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;
                ToolTip = 'Posting with Voucher No and Type';

                trigger OnAction()
                var
                begin
                    //
                end;
            }
        }
    }
}

