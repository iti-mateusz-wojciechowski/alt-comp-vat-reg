tableextension 50001 "BCW Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "BCW Alt. Comp. VAT Reg. Code"; Code[20])
        {
            Caption = 'Alternative Company VAT Registration';
            DataClassification = CustomerContent;
            TableRelation = "BCW Alt. Comp. VAT Reg.".Code;
            ToolTip = 'Specifies the VAT registration of the alternative company.';
        }
    }
}