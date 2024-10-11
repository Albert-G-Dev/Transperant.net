<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LeaveApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registeration Form</title>
    <style>
        
        .form-container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #00ffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .form-container label {
            display: block;
            margin-bottom: 5px;
        }

        
        .form-container input[type="text"], 
        .form-container input[type="email"], 
        .form-container input[type="password"], 
        .form-container input[type="tel"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        
        .form-container .gender-group {
            margin-bottom: 15px;
        }

        
        .form-container .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .form-container .button:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
               
        <div class="logout-container">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        </div>
            <h2>Registration Form</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>

            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>

            <label for="txtEmail">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>

            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

            <label for="txtConfirmPassword">Confirm Password:</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

            <div class="gender-group">
                <label>Gender:</label>
                <asp:RadioButton ID="rbtnMale" runat="server" GroupName="Gender" Text="Male" />
                <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="Gender" Text="Female" />
            </div>

            <label for="txtPhone">Phone Number:</label>
            <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
