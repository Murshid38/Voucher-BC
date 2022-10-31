table 50123 "Voucher Header"
{
    Caption = 'Voucher Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; enum "Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(3; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Advance Settlement Of"; Text[100])
        {
            Caption = 'Advance Settlement Of';
            DataClassification = CustomerContent;
        }
        field(5; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Voucher Line".Amount where("Document No." = field("No."), "Document Type" = field("Document Type")));
            Caption = 'Amount';
            Editable = false;
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

        field(7; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            // Editable = true;
            TableRelation = Customer;

            trigger OnValidate()
            var
                CustomerInfo: Record Customer;
            begin
                if CustomerInfo.Get("Customer No.") then begin
                    "Cust Name" := CustomerInfo.Name;
                    "Cust Address" := CustomerInfo.Address;
                    "Cust Address 2" := CustomerInfo."Address 2";
                end
                else begin
                    "Cust Name" := '';
                    "Cust Address" := '';
                    "Cust Address 2" := '';
                end;
            end;
        }
        field(8; "Cust Name"; Text[100])
        {
            Caption = 'Customer Name';
            Editable = false;
        }
        field(9; "Cust Address"; Text[100])
        {
            Caption = 'Customer Address';
            Editable = false;
        }
        field(10; "Cust Address 2"; Text[100])
        {
            Caption = 'Customer Address 2';
            Editable = false;
        }
        field(11; "Fully Paid"; Boolean)
        {
            Caption = 'Full Paid';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Document Type", "No.")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        InitInsert();
        "Created Date" := Today;
    end;

    procedure InitInsert()
    begin
        if "No." = '' then begin
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", Today, "No.", "No. Series");
        end;
    end;

    procedure TestNoSeries()
    begin
        GetSalesSetup();
        case "Document Type" of
            "Document Type"::"Petty Cash":
                SalesSetup.TestField("Petty Cash Nos");
            "Document Type"::Bank:
                SalesSetup.TestField("Bank Nos");
        end;
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
    begin
        GetSalesSetup();
        case "Document Type" of
            "Document Type"::"Petty Cash":
                NoSeriesCode := SalesSetup."Petty Cash Nos";
            "Document Type"::Bank:
                NoSeriesCode := SalesSetup."Bank Nos";
        end;
        exit(NoSeriesCode);
    end;

    local procedure GetSalesSetup()
    begin
        SalesSetup.Get();
    end;
}
