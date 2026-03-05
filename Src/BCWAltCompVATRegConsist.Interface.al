interface "BCW Alt. Comp. VAT Reg. Consist."
{
    Access = Public;

    procedure CheckAltCompVATRegConsistent(BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.")
    procedure CheckAltCompVATRegPostSetupConsistent(BCWAltCompVATRegPostSetup: Record "BCW Alt Co VAT Reg Post Setup");
    procedure CheckCompanyConsistency(CompanyInformation: Record "Company Information")
}