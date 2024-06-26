// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.AutomaticAccounts;

using Microsoft.Finance.GeneralLedger.Account;

pageextension 4855 "AutoAcc G/L Account Card" extends "G/L Account Card"
{
    layout
    {
        addafter("VAT Prod. Posting Group")
        {

            field("Automatic Account Group"; Rec."Automatic Account Group")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies an automatic account group code.';
            }
        }
    }
}