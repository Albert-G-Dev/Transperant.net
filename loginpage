<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LeaveApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
            
              body {
                   font-family: Arial, sans-serif;
                    background-color: #f9f9f9;
                    background-image:url("Properties/vecteezy_fingerprint-identity-sensor-data-protection-system-podium_7164537.jpg");
                    background-size: cover;
                    background-position: center center;
                    background-repeat: no-repeat;
                    height: 100%;
                    margin: 0;
                }

              h1 {
                     color: #4CAF50;
                     margin-bottom: 20px;
                }

              form {
                      width: 300px;
                      margin: 40px auto;
                      padding: 30px;
                      border: 1px solid #ccc;
                      border-radius: 20px;
                      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
               }
 
              label {
                    display: block;
                    margin-bottom: 10px;
                }

              input[type="text"], input[type="password"] {
                      width: 100%;
                      height: 30px;
                      padding: 10px;
                      margin-bottom: 20px;
                      border: 1px solid #ccc;
                      background-color: rgba(255, 255, 255, 0.1);
                      border-radius: 5px;
               }

              input[type="submit"] {
                       border-style: none;
                      border-color: inherit;
                      border-width: medium;
                       width: 100%;
                       height: 30px;
                       padding: 10px;
                      background-color: #4CAF50;
                      color: #fff;
                      border-radius: 5px;
                      cursor: pointer;
               margin-left: 0px;
               }

              input[type="submit"]:hover {
                       background-color: #3e8e41;
               }

              .error {
                       color: #ff0000;
                       font-size: 12px;
                       margin-bottom: 10px;
                }

              .success {
                       color: #3e8e41;
                       font-size: 12px;
                       margin-bottom: 10px;
               }
              
               
              .login-container {
                   width: 300px;
                   margin: 0 auto;
                   padding: 20px;
                   background-color: rgba(255, 255, 255, 0.1); 
                   border-radius: 10px;
              }

              .login-container h2, .login-container label {
                   color: #E0E0E0; 
              }

              .login-container a {
                     color: #00BFFF; 
              }

             .login-container .login-button {
                   background-color: #4CAF50; 
                   color: white;
             }
              </style>
   </head>
 <body>
    <form id="form1" runat="server">
        <div>
              <h1>Login Page</h1>
            <asp:Label ID="lblUsername" runat="server" Text="Username:" AssociatedControlID="txtUsername"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
             ErrorMessage="Username is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
             ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            <br /> 
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
           <br />
            <p>Don't have an account</p>
            <a href="Register.aspx"> Register here</a>
            <br />
        </div>
    </form>
</body>
</html>
