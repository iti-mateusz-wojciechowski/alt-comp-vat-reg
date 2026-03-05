pageextension 50000 "BCW Sales Order" extends "Sales Order"
{
    layout
    {
        addbefore("VAT Country/Region Code")
        {
            field("BCW Comp. VAT Registration"; Rec."BCW Comp. VAT Registration")
            {
                ApplicationArea = All;
            }
        }
    }
}