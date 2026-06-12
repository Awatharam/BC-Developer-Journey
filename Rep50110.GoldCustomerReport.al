report 50110 "Gold Customer Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Gold Customer Report';
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Customer Posting Group";

            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    Caption = 'Filters';
                    field(MinBalance; MinBalanceFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Minimum Balance (LCY)';
                        ToolTip = 'Filter customers with balance above this amount.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'GoldCustomerReport.docx';
            Caption = 'Gold Customer Report (Word)';
        }
    }

    var
        MinBalanceFilter: Decimal;
}