<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gridtable.aspx.cs" Inherits="LeaveApp.Gridtable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>

       <style>
        .button-container {
            position: absolute; 
            top: 20px; 
            width: calc(100% - 40px); 
        }

        .button-left {
            float: left; 
        }

        .button-right {
            float: right; 
        }

        
        .button {
            background-color: #4CAF50; 
            color: white; 
            padding: 10px 20px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 16px; 
            margin: 0 5px; 
        }
        .button:hover {
            background-color: #45a049; 
        }

          .center-container {
            display: flex;
            flex-direction:column;
            padding-top:5px;
            justify-content: center;
            align-items: center;
            height: 100vh; 
            background-color: #f4f4f4;
          }
          .heading {
               font-size: 36px; 
               color: #4CAF50; 
               margin-bottom: 20px; 
               font-weight: bold; 
               text-align: center; 
          }
            
        .grid-header {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        .grid-table {
            border: 1px solid #ddd;
            border-collapse:collapse;
            width: 100%;
            border-collapse: collapse;
        }
        .grid-table th, .grid-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
          <div class="button-container">
       
            <asp:Button ID="btnLeaveApplication" runat="server" Text="Leave Application" CssClass="button button-left" OnClick="btnLeaveApplication_Click" />
           
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="button button-right" OnClick="btnLogout_Click" />
        </div>
                <div class="center-container">
               <h1 class="heading">Welcome to UserHome Page</h1>
              <asp:GridView ID="GridViewUserLeaveStatus" runat="server" AutoGenerateColumns="False" CssClass="grid-table">
                <Columns>
                    <asp:BoundField DataField="LeaveID" HeaderText="Application ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
                <HeaderStyle CssClass="grid-header" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
