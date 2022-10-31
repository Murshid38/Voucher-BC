page 50146 "Petty Cash Card"
{
    Caption = 'Petty Cash Card';
    PageType = Card;
    SourceTable = "Voucher Header";
    SourceTableView = where("Document Type" = filter("Petty Cash"));

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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
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
            }
            part(PettyCashSubform; "Petty Cash Subform")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = all;
                UpdatePropagation = Both;
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
                    VoucherPayment: report "Voucher Pay";
                begin
                    VoucherPayment.SetVoucherHeader(Rec);
                    VoucherPayment.Run();
                end;
            }
        }
    }
}
