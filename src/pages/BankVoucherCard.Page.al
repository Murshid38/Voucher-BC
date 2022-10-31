page 50142 "Bank Voucher Card"
{
    Caption = 'Bank Voucher Card';
    PageType = Card;
    SourceTable = "Voucher Header";
    SourceTableView = where("Document Type" = filter(Bank));
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                // field("Document Type"; Rec."Document Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Document Type field.';
                // }
                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the No. field.';
                // }
                field("Advance Settlement Of"; Rec."Advance Settlement Of")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Settlement Of field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Customer Name"; Rec."Cust Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name';
                }
                field("Customer Address"; Rec."Cust Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address';
                }
                field("Customer Address 2"; Rec."Cust Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Address 2';
                }
                field("Fully Paid"; Rec."Fully Paid")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fully Paid';
                }
            }
            part(BankVoucherSubform; "Bank Voucher Subform")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = all;
                UpdatePropagation = Both;//update subform and card in realtime
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(OpensVoucherPayments)
            {
                ApplicationArea = All;
                Image = Open;
                ToolTip = 'Opens the Voucher Payment Entries';
                RunObject = page "Voucher Payments";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }

            action(Pay)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Pay';
                PromotedCategory = Process;
                Image = Payment;
                ToolTip = 'Specifies the Pay';

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    VoucherPayment: report "Voucher Pay";
                begin
                    UserSetup.Get(UserId);
                    if not UserSetup."User Paid" then Error('You are not authorized to pay');
                    VoucherPayment.SetVoucherHeader(Rec);
                    VoucherPayment.Run();
                end;
            }
        }
    }
}
