codeunit 50003 "BCW Alt. Co. VAT Reg. Cons.Im." implements "BCW Alt. Comp. VAT Reg. Consist."
{
    Permissions = tabledata "Company Information" = r, tabledata "BCW Alt. Comp. VAT Reg." = rd, tabledata "BCW Alt Co VAT Reg Post Setup" = r;

    var
        ChangeCtryOfCompanyQst: Label 'There is an alternative company VAT registration with the same country/region code that is not allowed. Do you want to change the country/region code in the company card and remove the alternative company VAT registration?';
        CountryCodeMatchesCompErr: Label 'You cannot have the same VAT Country/Region Code as the Company Country/Region Code';
        InconsistentPostSetupErr: Label 'Not possible to have Alternative Company VAT Registration Posting Setup with the same Company VAT Registration and Source';
        InconsistentSetupErr: Label 'Not possible to have Alternative Company VAT Registration with the same VAT Country/Region Code';

    procedure CheckAltCompVATRegConsistent(BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.")
    var
        BCWAltCompVATReg2: Record "BCW Alt. Comp. VAT Reg.";
        CompanyInformation: Record "Company Information";
    begin
        BCWAltCompVATReg.TestField("VAT Country/Region Code");

        CompanyInformation.SetLoadFields("Country/Region Code");
        CompanyInformation.Get();
        if BCWAltCompVATReg."VAT Country/Region Code" = CompanyInformation."Country/Region Code" then
            Error(CountryCodeMatchesCompErr);

        BCWAltCompVATReg2.SetFilter(Id, '<>%1', BCWAltCompVATReg.Id);
        BCWAltCompVATReg2.SetRange("VAT Country/Region Code", BCWAltCompVATReg."VAT Country/Region Code");
        if not BCWAltCompVATReg2.IsEmpty() then
            Error(InconsistentSetupErr);
    end;

    procedure CheckAltCompVATRegPostSetupConsistent(BCWAltCompVATRegPostSetup: Record "BCW Alt Co VAT Reg Post Setup")
    var
        BCWAltCompVATRegPostSetup2: Record "BCW Alt Co VAT Reg Post Setup";
    begin
        BCWAltCompVATRegPostSetup.TestField("Alt. Comp. VAT Registration");
        BCWAltCompVATRegPostSetup.TestField("Source Type");
        BCWAltCompVATRegPostSetup.TestField("Source No.");

        BCWAltCompVATRegPostSetup2.SetFilter(Id, '<>%1', BCWAltCompVATRegPostSetup.Id);
        BCWAltCompVATRegPostSetup2.SetRange("Alt. Comp. VAT Registration", BCWAltCompVATRegPostSetup."Alt. Comp. VAT Registration");
        BCWAltCompVATRegPostSetup2.SetRange("Source Type", BCWAltCompVATRegPostSetup."Source Type");
        BCWAltCompVATRegPostSetup2.SetRange("Source No.", BCWAltCompVATRegPostSetup."Source No.");
        BCWAltCompVATRegPostSetup2.SetRange("Src. Alt. VAT Ctry./Reg. Code", BCWAltCompVATRegPostSetup."Src. Alt. VAT Ctry./Reg. Code");
        if not BCWAltCompVATRegPostSetup2.IsEmpty() then
            Error(InconsistentPostSetupErr);
    end;

    procedure CheckCompanyConsistency(CompanyInformation: Record "Company Information")
    var
        BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        BCWAltCompVATReg.SetRange("VAT Country/Region Code", CompanyInformation."Country/Region Code");
        if BCWAltCompVATReg.IsEmpty() then
            exit;

        if not ConfirmManagement.GetResponse(ChangeCtryOfCompanyQst, false) then
            Error('');

        BCWAltCompVATReg.DeleteAll(true);
    end;
}