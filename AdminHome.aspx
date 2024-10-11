<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="LeaveApp.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AdminHome</title>
    <style>
           .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
            }
            .center-content {
            text-align: center;
            margin: 0 auto;
             }

          .logout-container {
            position: absolute;
            top: 20px;
            left: 20px;
           }

        .btn-logout {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .table tr th, .table tr td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            padding: 6px 12px;
            margin: 0 5px;
            border: none;
            cursor: pointer;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
         
        <div class="logout-container">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        </div>
        <div class="center-content">
            <h1>Welcome to Admin Page</h1>
            
          
            <h3>Pending Requests</h3>
            <asp:GridView ID="GridViewLeaveApplications" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="GridViewLeaveApplications_RowCommand">
                <Columns>
                    <asp:BoundField DataField="LeaveID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CommandArgument='<%# Container.DataItemIndex%>' CssClass="btn btn-success" />
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
