pageextension 50000 "BCW Sales Order" extends "Sales Order"
{
    layout
    {
        addbefore("VAT Country/Region Code")
        {
            field("BCW Alt. Comp. VAT Reg. Code"; Rec."BCW Alt. Comp. VAT Reg. Code")
            {
                ApplicationArea = All;
            }
        }
    }
}