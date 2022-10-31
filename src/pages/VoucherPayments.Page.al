page 50101 "Voucher Payments"
{
    ApplicationArea = All;
    Caption = 'Voucher Payments';
    PageType = List;
    SourceTable = "Voucher Payment Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Paid By"; Rec."Paid By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paid By field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
