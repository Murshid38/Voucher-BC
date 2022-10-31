report 50100 "Voucher Pay"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    //maybe 'Tasks' can be a better fit
    ApplicationArea = all;

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field("Bank Code"; BankCode) //Bank to Bank Code
                    {
                        ApplicationArea = all;
                        TableRelation = "Bank Account";
                        Caption = 'Bank Code';
                        ToolTip = 'Specifies the Bank Code of the Bank';
                    }
                    field("Paid Date"; PaidDate) //PaidDate to Date
                    {
                        ApplicationArea = all;
                        Caption = 'Date';
                        ToolTip = 'Specifies the Paid Date';
                    }
                    field("Received By"; ReceivedBy) //ReceivedBy to Received By
                    {
                        ApplicationArea = all;
                        Caption = 'Received By';
                        ToolTip = 'Specifies the Received By';
                    }
                    field("Payment Amount"; Amount) //Amount to Payment Amount
                    {
                        ApplicationArea = all;
                        Caption = 'Payment Amount';
                        MinValue = 0;
                        ToolTip = 'Specifies the Amount';

                    }
                }
            }
        }
    }

    var
        VoucherHeader: Record "Voucher Header";
        PaidDate: Date;
        BankCode: Code[20];
        ReceivedBy: Text[100];
        Amount: Decimal;

    trigger OnPreReport()
    var
        VoucherPaymentsEntry: Record "Voucher Payment Entry";
    begin
        VoucherPaymentsEntry.SetRange("Document Type", VoucherHeader."Document Type");
        VoucherPaymentsEntry.SetRange("No.", VoucherHeader."No.");
        VoucherPaymentsEntry.CalcSums(Amount);
        // calculates the sum of a field in a table

        if (VoucherPaymentsEntry.Amount + Amount) > VoucherHeader.Amount then
            if not Confirm('Do you want to pay?', true) then
                CurrReport.Break();

        if (VoucherPaymentsEntry.Amount + Amount) = VoucherHeader.Amount then
            VoucherHeader."Fully Paid" := true;
        VoucherHeader.Modify();

        // Error('Error message');
        Clear(VoucherPaymentsEntry);
        VoucherPaymentsEntry.InsertVoucherPayments(VoucherHeader, GetBank() + ' : ' + GetWrittenDate(), Amount);

    end;

    procedure SetVoucherHeader(var NewVoucherHeader: Record "Voucher Header")
    begin
        // Message('%1', NewVoucherHeader."No.");
        VoucherHeader := NewVoucherHeader;
    end;

    procedure GetBank(): Text[100]
    var
        BankRec: Record "Bank Account";
    begin
        if BankRec.get(BankCode) then
            exit(BankRec.Name);
        exit('');
    end;

    procedure GetWrittenDate(): Text
    begin
        exit(SetDayWritten(Date2DMY(PaidDate, 1)) + ' ' + Format(PaidDate, 0, '<Month Text>') + ' ' + Format((Date2DMY(PaidDate, 3))));
    end;

    local procedure SetDayWritten(CurrDay: Integer): Text
    var
        LastInt: Integer;
        DayString: Text;
        TxtDay: Text;
    begin
        DayString := Format(CurrDay);
        Evaluate(LastInt, CopyStr(DayString, StrLen(DayString), 1));
        case LastInt of
            1:
                TxtDay := 'st';
            2:
                TxtDay := 'nd';
            3:
                TxtDay := 'rd';
            else
                TxtDay := 'th';
        end;
        exit(Format(CurrDay) + TxtDay);
    end;
}