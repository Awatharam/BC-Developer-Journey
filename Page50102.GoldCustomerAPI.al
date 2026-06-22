page 50102 "Gold Customer API"
{
    PageType = API;
    APIPublisher = 'mk';
    APIGroup = 'goldCustomer';
    APIVersion = 'v1.0';
    EntityName = 'goldCustomer';
    EntitySetName = 'goldCustomers';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(number; Rec."No.") { Caption = 'No.'; }
                field(name; Rec.Name) { Caption = 'Name'; }
                field(balanceLCY; Rec."Balance (LCY)") { Caption = 'Balance (LCY)'; }
                field(customerPostingGroup; Rec."Customer Posting Group") { Caption = 'Customer Posting Group'; }
                field(creditLimitLCY; Rec."Credit Limit (LCY)") { Caption = 'Credit Limit (LCY)'; }
            }
        }
    }
}