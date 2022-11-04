tableextension 50103 "G/L Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50100; "Voucher Type"; Enum "Document Type")
        {
            Caption = 'Voucher Type';
            DataClassification = CustomerContent;
        }
        field(50101; "Voucher No"; Code[20])
        {
            Caption = 'Voucher No';
            DataClassification = CustomerContent;
        }
    }
}
