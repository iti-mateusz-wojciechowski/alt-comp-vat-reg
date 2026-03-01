codeunit 50001 "BCW Alt. Comp. VAT Reg. Facade"
{
    Access = Public;

    var
        BCWAltCompVATRegOrch: Codeunit "BCW Alt. Comp. VAT Reg. Orch.";

    procedure UpdateSetupOnShipToCountryChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnShipToCountryChangeInSalesHeader(SalesHeader, xSalesHeader);
    end;

    procedure UpdateSetupOnVATCountryChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnVATCountryChangeInSalesHeader(SalesHeader, xSalesHeader);
    end;

    procedure UpdateSetupOnBillToCustomerChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; BillToCustomer: Record Customer)
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().UpdateSetupOnBillToCustomerChangeInSalesHeader(SalesHeader, xSalesHeader, BillToCustomer);
    end;

    procedure CopyFromCompany(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().CopyFromCompany(SalesHeader, xSalesHeader);
    end;

    procedure Init(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegDocImpl().Init(SalesHeader, xSalesHeader);
    end;

    // procedure GetAlternativeCustVATReg(var AltCustVATReg: Record "Alt. Cust. VAT Reg."; CustNo: Code[20]; CountryCode: Code[10]): Boolean
    // begin
    //     AltCustVATReg.SetRange("Customer No.", CustNo);
    //     AltCustVATReg.SetRange("VAT Country/Region Code", CountryCode);
    //     exit(AltCustVATReg.FindFirst());
    // end;

    // procedure VATDataIsChangedOnShipToCodeValidation(SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header") Changed: Boolean
    // var
    //     IsHandled: Boolean;
    // begin
    //     OnBeforeVATDataIsChangedOnShipToCodeValidation(SalesHeader, xSalesHeader, Changed, IsHandled);
    //     if IsHandled then
    //         exit(Changed);
    //     if SalesHeader."Alt. Gen. Bus Posting Group" or SalesHeader."Alt. VAT Bus Posting Group" or
    //        xSalesHeader."Alt. Gen. Bus Posting Group" or xSalesHeader."Alt. VAT Bus Posting Group"
    //     then
    //         exit(false);
    //     exit(xSalesHeader."VAT Country/Region Code" <> SalesHeader."VAT Country/Region Code");
    // end;

    procedure CheckAltCompVATRegConsistent(BCWAltCompVATReg: Record "BCW Alt. Comp. VAT Reg.")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegConsistencyImpl().CheckAltCompVATRegConsistent(BCWAltCompVATReg);
    end;

    procedure CheckCompanyConsistency(CompanyInformation: Record "Company Information")
    begin
        BCWAltCompVATRegOrch.GetAltCompVATRegConsistencyImpl().CheckCompanyConsistency(CompanyInformation);
    end;
}