codeunit 50000 "BCW Alt. Comp. VAT Reg. Orch."
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure GetAltCompVATRegConsistencyImpl(): Interface "BCW Alt. Comp. VAT Reg. Consist."
    var
        VATSetup: Record "VAT Setup";
    begin
        exit(VATSetup.Get() ? VATSetup."BCW Alt. Comp. VAT Reg. Cns." : "BCW Alt. Comp. VAT Reg. Cns."::Default);
    end;

    procedure GetAltCompVATRegDocImpl(): Interface "BCW Alt. Comp. VAT Reg. Doc."
    var
        VATSetup: Record "VAT Setup";
    begin
        exit(VATSetup.Get() ? VATSetup."BCW Alt. Comp. VAT Reg. Doc." : "BCW Alt. Comp. VAT Reg. Doc."::Default);
    end;

}