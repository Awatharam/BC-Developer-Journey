codeunit 50101 "Gold Customer Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc_CreateLog(var SalesHeader: Record "Sales Header")
    var
        GoldCustomerLog: Record "Gold Customer Log";
        Customer: Record Customer;
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        if not Customer.Get(SalesHeader."Sell-to Customer No.") then
            exit;

        if Customer."Customer Priority" <> Customer."Customer Priority"::High then
            exit;

        GoldCustomerLog.Init();
        GoldCustomerLog."Customer No." := SalesHeader."Sell-to Customer No.";
        GoldCustomerLog."Customer Name" := SalesHeader."Sell-to Customer Name";
        GoldCustomerLog."Posting Date" := SalesHeader."Posting Date";
        GoldCustomerLog."Sales Order No." := SalesHeader."No.";
        GoldCustomerLog.Insert(true);
    end;
}