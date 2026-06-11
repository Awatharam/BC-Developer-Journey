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
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
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
            LayoutFile = 'Rep50110.GoldCustomerReport.docx';
            Caption = 'Gold Customer Report (Word)';
        }
    }

}