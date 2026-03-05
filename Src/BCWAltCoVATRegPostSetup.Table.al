table 50001 "BCW Alt Co VAT Reg Post Setup"
{
    Caption = 'Alternative Company VAT Registration Posting Setup';
    DataClassification = CustomerContent;
    DrillDownPageId = "BCW Alt Co VAT Reg Post Setup";
    LookupPageId = "BCW Alt Co VAT Reg Post Setup";

    fields
    {
        field(1; Id; Integer)
        {
            AllowInCustomizations = Never;
            AutoIncrement = true;
            Caption = 'Id';
            DataClassification = SystemMetadata;
        }
        field(2; "Alt. Comp. VAT Reg. Code"; Code[20])
        {
            Caption = 'Alt. Comp. VAT Registration';
            NotBlank = true;
            TableRelation = "BCW Alt. Comp. VAT Reg.".Code;
            ToolTip = 'Specifies the code of the alternative company VAT registration.';
            ValidateTableRelation = false;
        }
        field(3; "Source Type"; Enum "BCW Source Type")
        {
            Caption = 'Source Type';
            ToolTip = 'Specifies the type of business entity.';
        }
        field(4; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = if ("Source Type" = const("BCW Source Type"::Customer)) Customer."No." else
            Vendor."No.";
            ToolTip = 'Specifies the entity number.';
        }
        field(5; "Src. Alt. VAT Ctry./Reg. Code"; Code[10])
        {
            Caption = 'Source Alt. VAT Country/Region Code';
            TableRelation = if ("Source Type" = const("BCW Source Type"::Customer)) "Alt. Cust. VAT Reg."."VAT Country/Region Code";
            ToolTip = 'Specifies the entity alternative VAT country or region code.';
            ValidateTableRelation = false;
        }
        field(6; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group".Code;
            ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';

            trigger OnValidate()
            var
                GenBusPostingGrp: Record "Gen. Business Posting Group";
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(7; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group".Code;
            ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        BCWAltCompVATRegFacade.CheckAltCompVATRegPostSetupConsistent(Rec);
    end;

    trigger OnModify()
    begin
        BCWAltCompVATRegFacade.CheckAltCompVATRegPostSetupConsistent(Rec);
    end;

    var
        BCWAltCompVATRegFacade: Codeunit "BCW Alt. Comp. VAT Reg. Facade";
}