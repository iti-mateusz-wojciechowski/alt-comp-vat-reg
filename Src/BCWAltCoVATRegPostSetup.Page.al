page 50001 "BCW Alt Co VAT Reg Post Setup"
{
    ApplicationArea = All;
    Caption = 'Alternative Company VAT Registration Posting Setup';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "BCW Alt Co VAT Reg Post Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Alt. Comp. VAT Registration"; Rec."Alt. Comp. VAT Reg. Code") { }
                field("Source Type"; Rec."Source Type") { }
                field("Source No."; Rec."Source No.") { }
                field("Src. Alt. VAT Ctry./Reg. Code"; Rec."Src. Alt. VAT Ctry./Reg. Code") { }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group") { }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group") { }
            }
        }
    }
}