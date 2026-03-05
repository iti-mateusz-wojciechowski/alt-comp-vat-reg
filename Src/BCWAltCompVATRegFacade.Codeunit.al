codeunit 50001 "BCW Alt. Comp. VAT Reg. Facade"
{
    Access = Public;

    var
        BCWAltCompVATRegOrch: Codeunit "BCW Alt. Comp. VAT Reg. Orch.";

    procedure CheckAltCompVATRegConsistent(BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegConsistencyImpl().CheckAltCompVATRegConsistent(BCWAltCompVATReg);
    end;

    procedure CheckAltCompVATRegPostSetupConsistent(BCWAltCompVATRegPostSetup: Record "BCW Alt Co VAT Reg Post Setup")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegConsistencyImpl().CheckAltCompVATRegPostSetupConsistent(BCWAltCompVATRegPostSetup);
    end;

    procedure CheckCompanyConsistency(CompanyInformation: Record "Company Information")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegConsistencyImpl().CheckCompanyConsistency(CompanyInformation);
    end;

    procedure Init(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().Init(SalesHeader, xSalesHeader);
    end;

    procedure UpdateSetupOnBillToCustomerChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; BillToCustomer: Record Customer)
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnBillToCustomerChangeInSalesHeader(SalesHeader, xSalesHeader, BillToCustomer);
    end;

    procedure UpdateSetupOnCompVATRegistrationChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnCompVATRegistrationChangeInSalesHeader(SalesHeader, xSalesHeader);
    end;

    procedure UpdateSetupOnVATCountryChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnVATCountryChangeInSalesHeader(SalesHeader, xSalesHeader);
    end;
}