<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leaveApp.aspx.cs" Inherits="LeaveApp.leaveApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Application</title>

     <style>
    .container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 400px;
            background-color: #f0f8ff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container input[type="text"], .form-container input[type="email"], .form-container input[type="date"], .form-container textarea, .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-button input {
            background-color: #ffa500;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

 </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="back-button">
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" />
        </div>

        
        <div class="container">
            <div class="form-container">
                <h2>Leave Application Form</h2>
                
                
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>

           
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>

             
                <label for="ddlLeaveType">Leave Type</label>
                <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Leave Type" Value="" />
                    <asp:ListItem Text="Sick Leave" Value="Sick Leave" />
                    <asp:ListItem Text="Casual Leave" Value="Casual Leave" />
                    <asp:ListItem Text="Annual Leave" Value="Annual Leave" />
                </asp:DropDownList>

               
                <label for="txtStartDate">Start Date</label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

           
                <label for="txtEndDate">End Date</label>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

            
                <label for="txtReason">Reason</label>
                <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Reason for leave"></asp:TextBox>

           
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_click" />
            </div>
        </div>
    </form>
</body>
</html>
