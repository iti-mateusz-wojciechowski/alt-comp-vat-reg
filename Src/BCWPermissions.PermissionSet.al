permissionset 50000 "BCW Permissions"
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;

    Permissions =
        table "BCW Alt. Comp. VAT Reg." = X,
        tabledata "BCW Alt. Comp. VAT Reg." = RMID,
        table "BCW Alt Co VAT Reg Post Setup" = X,
        tabledata "BCW Alt Co VAT Reg Post Setup" = RMID,
        codeunit "BCW Alt. Co. VAT Reg. Cons.Im." = X,
        codeunit "BCW Alt. Co. VAT Reg. Doc. Im." = X,
        codeunit "BCW Alt. Comp. VAT Reg. Facade" = X,
        page "BCW Alt. Comp. VAT Reg." = X;
}