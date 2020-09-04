page 83000 "Active Session List"
{

    ApplicationArea = All;
    Caption = 'Active Session List';
    PageType = List;
    SourceTable = "Active Session";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User SID"; "User SID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance ID"; "Server Instance ID")
                {
                    ApplicationArea = All;
                }
                field("Session ID"; "Session ID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance Name"; "Server Instance Name")
                {
                    ApplicationArea = All;
                }
                field("Server Computer Name"; "Server Computer Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                }
                field("Client Type"; "Client Type")
                {
                    ApplicationArea = All;
                }
                field("Client Computer Name"; "Client Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Login Datetime"; "Login Datetime")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; "Database Name")
                {
                    ApplicationArea = All;
                }
                field("Session Unique ID"; "Session Unique ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CancelSession)
            {
                Caption = 'Cancel Session';
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                var
                    UserPermissions: Codeunit "User Permissions";
                    CanceledLbl: Label 'Selected session has been canceled';
                    NoPermission: Label 'You do not have super permission.';
                begin
                    if UserPermissions.CanManageUsersOnTenant(UserSecurityId()) then begin
                        if StopSession("Session ID") then begin
                            Message(CanceledLbl)
                        end;
                    end else begin
                        Message(NoPermission);
                    end;
                end;
            }
        }
    }
}
