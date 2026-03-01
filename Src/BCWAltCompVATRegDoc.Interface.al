
interface "BCW Alt. Comp. VAT Reg. Doc."
{
    Access = Public;

    procedure Init(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    procedure CopyFromCompany(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    procedure UpdateSetupOnShipToCountryChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    procedure UpdateSetupOnVATCountryChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    procedure UpdateSetupOnBillToCustomerChangeInSalesHeader(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; BillToCustomer: Record Customer)
}