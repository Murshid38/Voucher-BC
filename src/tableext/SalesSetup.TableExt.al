tableextension 50100 SalesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Bank Nos"; Code[20])//in extension tables the fields should be in ID range
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            //tablerelation brings drop down list to choose from 
        }
        field(50101; "Petty Cash Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            //tablerelation brings drop down list to choose from 
        }
    }
}