permissionset 50000 "BCW Permissions"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
        table "BCW Alt. Comp. VAT Reg." = X,
        tabledata "BCW Alt. Comp. VAT Reg." = RMID,
        codeunit "BCW Alt. Co. VAT Reg. Cons.Im." = X,
        codeunit "BCW Alt. Co. VAT Reg. Doc. Im." = X,
        codeunit "BCW Alt. Comp. VAT Reg. Facade" = X,
        page "BCW Alt. Comp. VAT Reg." = X;
}