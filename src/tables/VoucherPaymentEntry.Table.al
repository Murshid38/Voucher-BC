table 50101 "Voucher Payment Entry"
{
    Caption = 'Voucher Payment Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Document Type"; enum "Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(4; "Paid By"; Text[100])
        {
            Caption = 'Paid By';
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
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    // trigger OnDelete()
    // begin
    //     CheckDelete();
    // end;

    // local procedure CheckDelete()
    // var
    //     UserSetup: Record "User Setup";
    // begin
    //     UserSetup.Get(UserId);
    //     if not UserSetup."SQ Admin" then begin
    //         Error('Unable to delete');
    //     end;
    // end;

    procedure InsertVoucherPayments(VoucherHeader: Record "Voucher Header"; PaidBy: Text[100]; Amt: Decimal)
    begin
        Init();
        "Document Type" := VoucherHeader."Document Type";
        "No." := VoucherHeader."No.";
        "Paid By" := PaidBy;
        Amount := Amt;
        Insert(true);
    end;
}
