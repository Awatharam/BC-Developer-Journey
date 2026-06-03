tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50100; "Customer Priority"; Enum "Customer Priority")
        {
            Caption = 'Customer Priority';
            DataClassification = CustomerContent;
        }
    }
}