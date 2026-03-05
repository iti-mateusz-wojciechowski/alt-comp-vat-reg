tableextension 50001 "BCW Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "BCW Comp. VAT Registration"; Code[10])
        {
            Caption = 'Company VAT Registration';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the VAT registration of the company.';
        }
    }
}