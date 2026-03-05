table 50000 "BCW Alt. Comp. VAT Reg."
{
    Caption = 'Alternative Company VAT Registration';
    DataClassification = CustomerContent;
    DrillDownPageId = "BCW Alt. Comp. VAT Reg.";
    LookupPageId = "BCW Alt. Comp. VAT Reg.";
    Permissions = tabledata "Company Information" = r;

    fields
    {
        field(1; Id; Integer)
        {
            AllowInCustomizations = Never;
            AutoIncrement = true;
            Caption = 'Id';
            DataClassification = SystemMetadata;
        }
        field(2; "VAT Country/Region Code"; Code[10])
        {
            Caption = 'VAT Country/Region Code';
            NotBlank = true;
            TableRelation = "Country/Region".Code;
            ToolTip = 'Specifies the country or region code for the VAT.';

            trigger OnValidate()
            begin
                if "VAT Country/Region Code" <> xRec."VAT Country/Region Code" then
                    VATRegistrationValidation();
            end;

            trigger OnLookup()
            var
                CompanyInformation: Record "Company Information";
                CountryRegion: Record "Country/Region";
                CountriesRegionsPage: Page "Countries/Regions";
            begin
                CompanyInformation.Get();
                if CompanyInformation."Country/Region Code" <> '' then
                    CountryRegion.SetFilter(Code, '<>%1', CompanyInformation."Country/Region Code");

                CountriesRegionsPage.SetTableView(CountryRegion);
                CountriesRegionsPage.LookupMode(true);
                if CountriesRegionsPage.RunModal() = Action::LookupOK then begin
                    CountriesRegionsPage.GetRecord(CountryRegion);
                    Validate("VAT Country/Region Code", CountryRegion.Code);
                end;
            end;
        }
        field(3; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the VAT registration number.';

            trigger OnValidate()
            begin
                if "VAT Registration No." <> xRec."VAT Registration No." then
                    VATRegistrationValidation();
            end;
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
        BCWAltCompVATRegFacade.CheckAltCompVATRegConsistent(Rec);
    end;

    trigger OnModify()
    begin
        BCWAltCompVATRegFacade.CheckAltCompVATRegConsistent(Rec);
    end;

    var
        BCWAltCompVATRegFacade: Codeunit "BCW Alt. Comp. VAT Reg. Facade";

    procedure VATRegistrationValidation()
    var
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        VATRegistrationLog: Record "VAT Registration Log";
        VATRegNoFormat: Record "VAT Registration No. Format";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
        ResultRecordRef: RecordRef;
    begin
        "VAT Registration No." := UpperCase("VAT Registration No.");
        if not VATRegNoFormat.Test("VAT Registration No.", "VAT Country/Region Code", '', Database::"Company Information") then
            exit;

        if "VAT Country/Region Code" = '' then
            exit;

        if VATRegNoSrvConfig.VATRegNoSrvIsEnabled() then begin
            VATRegistrationLogMgt.ValidateVATRegNoWithVIES(ResultRecordRef, Rec, '', VATRegistrationLog."Account Type"::"Company Information".AsInteger(), "VAT Country/Region Code");
            ResultRecordRef.SetTable(Rec);
        end;
    end;
}