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
            action(PostTest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Test';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                trigger OnAction()
                begin
                    Rec.SendToPosting(Codeunit::"Gen. Jnl.-Post");
                    // CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
                    // if IsSimplePage then
                    //     if GeneralLedgerSetup."Post with Job Queue" then
                    //         NewDocumentNo()
                    //     else
                    //         SetDataForSimpleModeOnPost;
                    // SetJobQueueVisibility();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
