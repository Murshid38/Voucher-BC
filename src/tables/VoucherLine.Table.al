table 50122 "Voucher Line"
{
    Caption = 'Voucher Line	';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(3; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No")
        {
            Clustered = true;
        }
    }
}
