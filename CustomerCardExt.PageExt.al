pageextension 50101 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Customer Priority"; Rec."Customer Priority")
            {
                ApplicationArea = All;
                Caption = 'Customer Priority';

                trigger OnValidate()
                begin
                    if Rec."Customer Priority" = Rec."Customer Priority"::High then
                        Message('This is a High priority customer!');
                end;
            }
        }
    }
}