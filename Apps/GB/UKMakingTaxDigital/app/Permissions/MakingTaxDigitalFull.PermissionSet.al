permissionset 10500 "Making Tax Digital - Full"
{
    Access = Internal;
    Assignable = false;

    IncludedPermissionSets = "Making Tax Digital - RM";

    Permissions = tabledata "MTD Liability" = ID,
                  tabledata "MTD Payment" = ID,
                  tabledata "MTD Return Details" = ID,
                  tabledata "MTD Missing Fraud Prev. Hdr" = ID,
                  tabledata "MTD Session Fraud Prev. Hdr" = ID,
                  tabledata "MTD Default Fraud Prev. Hdr" = ID;
}