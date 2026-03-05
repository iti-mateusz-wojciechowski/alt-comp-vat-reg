tableextension 50000 "BCW VAT Setup" extends "VAT Setup"
{
    fields
    {
        field(50000; "BCW Alt. Comp. VAT Reg. Cns."; Enum "BCW Alt. Comp. VAT Reg. Cns.")
        {
            AllowInCustomizations = AsReadWrite;
            Caption = 'Alt. Comp. VAT Reg. Consist.';
        }
        field(50001; "BCW Alt. Comp. VAT Reg. Doc."; Enum "BCW Alt. Comp. VAT Reg. Doc.")
        {
            AllowInCustomizations = AsReadWrite;
            Caption = 'Alt. Comp. VAT Reg. Doc.';
        }
    }
}