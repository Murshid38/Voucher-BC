permissionset 50100 VoucherPermissionSet
{
    Assignable = true;
    Permissions = tabledata "Voucher Header" = RIMD,
        tabledata "Voucher Line" = RIMD,
        tabledata "Voucher Payment Entry" = RIMD;
}