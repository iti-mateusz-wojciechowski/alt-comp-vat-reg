page 50000 "BCW Alt. Comp. VAT Reg."
{
    ApplicationArea = All;
    Caption = 'Alternative Company VAT Registration';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "BCW Alt. Comp. VAT Reg.";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("VAT Country/Region Code"; Rec."VAT Country/Region Code") { }
                field("VAT Registration No."; Rec."VAT Registration No.") { }
            }
        }
    }
}