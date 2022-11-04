codeunit 50110 Subscriber
{
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', false, false)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Voucher Type" := GenJournalLine."Voucher Type";
        GLEntry."Voucher No" := GenJournalLine."Voucher No";
    end;
}