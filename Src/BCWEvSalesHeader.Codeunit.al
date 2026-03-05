codeunit 50004 "BCW Ev Sales Header"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Alt. Gen. Bus Posting Group", false, false)]
    local procedure OnAfterValidateAltGenBusPostingGroup(var Rec: Record "Sales Header")
    begin
        if Rec."Alt. Gen. Bus Posting Group" then begin

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Alt. VAT Bus Posting Group", false, false)]
    local procedure OnAfterValidateAltVATBusPostingGroup(var Rec: Record "Sales Header")
    begin

    end;
}