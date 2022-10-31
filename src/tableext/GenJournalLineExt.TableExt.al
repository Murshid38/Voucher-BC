tableextension 50102 "Gen. Journal Line Ext" extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "Voucher Type"; enum "Document Type")
        {
            Caption = 'Voucher Type';
            DataClassification = CustomerContent;
        }
        field(50101; "Voucher No"; Code[20])
        {
            Caption = 'Voucher No';
            DataClassification = CustomerContent;
            TableRelation = "Voucher Header"."No." where("Document Type" = field("Voucher Type"));
        }
    }
}
