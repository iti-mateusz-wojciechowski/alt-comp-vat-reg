enum 50002 "BCW Source Type"
{
    Extensible = true;

    value(0; "") { }
    value(1; Customer)
    {
        Caption = 'Customer';
    }
    value(2; Vendor)
    {
        Caption = 'Vendor';
    }
}