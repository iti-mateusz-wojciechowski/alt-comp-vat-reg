interface "BCW Alt. Comp. VAT Reg. Consist."
{
    Access = Public;

    procedure CheckAltCompVATRegConsistent(BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.")
    procedure CheckAltCompVATRegPostSetupConsistent();
    procedure CheckCompanyConsistency(CompanyInformation: Record "Company Information")
}