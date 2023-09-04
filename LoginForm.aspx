<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginForm.aspx.vb" Inherits="EAS.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/LoginFormStyle.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript">
        function switchMe(login, register) {
            document.getElementById(login).style.display = "block";
            document.getElementById(register).style.display = "none";
        }
    </script>

    <style type="text/css">
        body {
            margin:0 auto;
            background-image: url('images/bg.jpg');
            background-repeat:no-repeat, repeat;
            background-size:cover;
            animation:animatedbackground 10s linear infiniten alternate
        }
        @keyframes animatedbackground {
            from {
                background-position: 0 0;
            }
            to {
                background-position: 100%;
            }
        }
        #register {
	        border:1px solid #ccc;
	        border-radius:4px;
            padding:20px;
            background:#fff;
            width:450px;
        }
        #login {
            margin:auto;
            width: 450px;
	        border:1px solid #ccc;
	        border-radius:4px;
            /*background: rgba(0, 0, 0, 0.8);*/
            /*color:#fff;*/
            padding:20px;
            background: #fff;

        }
        #container {
            width:450px;
            margin:auto;
        }
        #gender, #username, #password, #retypepassword, #logusername, #logpassword, #DateHired, #fname, #lname, #age, #contact, #position, #DateHired {
            padding: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #tablelogin td{
            padding:5px;
        }
         #tableregister td{
            padding:5px;
        }
        #user_level {
            cursor:none;
        }
        #h2 {
           color:#000;
           text-align:center;
           padding:5px;
           border:1px solid #ccc;
	        border-radius:4px;
            background:#fff;
        }
    </style>
   
</head>
<body id="animated">
     <div id="wrapper">
    <div id="page-wrapper">
         <div style="margin:auto;width:450px">
                <h3 id="h2">EMPLOYEE MANAGEMENT SYSTEM</h3>
          </div>
    <form id="form1" runat="server" autocomplete="off">
    <div id="register">
        <h3 style="border-bottom:1px solid #ccc">Create Account</h3>
        <table id="tableregister">
        <tr>
		<td><asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label></td>
        <td ><asp:TextBox ID="username" runat="server"> </asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" foreColor="red" ErrorMessage="*username" ValidationGroup="valAdd" ControlToValidate="username"></asp:RequiredFieldValidator></td>
        </tr>
		<tr>
        <td><asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></td>
        <td><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" foreColor="red" ErrorMessage="RequiredField" ValidationGroup="valAdd" ControlToValidate="password"></asp:RequiredFieldValidator></td>
        </tr>
		<tr>
        <td><asp:Label ID="Label3" runat="server" Text="Re-Type Password:"></asp:Label></td>
        <td><asp:TextBox ID="retypepassword" runat="server" TextMode="Password"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" foreColor="red" ErrorMessage="RequiredField" ValidationGroup="valAdd" ControlToValidate="retypepassword"></asp:RequiredFieldValidator><br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch" ControlToCompare="password" ControlToValidate="retypepassword" ForeColor="Red" ValidationGroup="valAdd"></asp:CompareValidator>
		</td>
	  </tr> 
        <tr>
            <td colspan="3">
                <h3 style="border-bottom:1px solid #ccc">Information</h3>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Label6" runat="server" Text="First Name:"></asp:Label></td>
             <td ><asp:TextBox ID="fname" runat="server"> </asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" foreColor="red" ErrorMessage="*Firstname" ValidationGroup="valAdd" ControlToValidate="fname"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label7" runat="server" Text="Last Name:"></asp:Label></td>
             <td ><asp:TextBox ID="lname" runat="server"> </asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" foreColor="red" ErrorMessage="*Lastname" ValidationGroup="valAdd" ControlToValidate="lname"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Age:"></asp:Label></td>
             <td ><asp:TextBox ID="age" runat="server" TextMode="Number"> </asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" foreColor="red" ErrorMessage="*Age" ValidationGroup="valAdd" ControlToValidate="age"></asp:RequiredFieldValidator></td>
        </tr>
            <tr>
            <td><asp:Label ID="Label12" runat="server" Text="Gender:"></asp:Label></td>
             <td >
                 <asp:DropDownList ID="gender" runat="server">
                     <asp:ListItem>select gender</asp:ListItem>
                     <asp:ListItem>---</asp:ListItem>
                     <asp:ListItem>Male</asp:ListItem>
                     <asp:ListItem>Female</asp:ListItem>
                 </asp:DropDownList>
             </td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" foreColor="red" ErrorMessage="*Gender" ValidationGroup="valAdd" ControlToValidate="age"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label9" runat="server" Text="Contact:"></asp:Label></td>
             <td ><asp:TextBox ID="contact" runat="server" TextMode="Number"> </asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" foreColor="red" ErrorMessage="*Contact" ValidationGroup="valAdd" ControlToValidate="contact"></asp:RequiredFieldValidator></td>
        </tr>
          <tr>
            <td><asp:Label ID="Label10" runat="server" Text="Position:"></asp:Label></td>
              <td ><asp:TextBox ID="position" runat="server"> </asp:TextBox></td>
              <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" foreColor="red" ErrorMessage="*Position" ValidationGroup="valAdd" ControlToValidate="position"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td><asp:Label ID="Label11" runat="server" Text="Date Hired:"></asp:Label></td>
             <td ><asp:TextBox ID="DateHired" runat="server" TextMode="Date"> </asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" foreColor="red" ErrorMessage="*DateHired" ValidationGroup="valAdd" ControlToValidate="DateHired"></asp:RequiredFieldValidator></td>
        </tr>

	  <tr>
	  <td></td>
        <td><asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Create Account" ValidationGroup="valAdd"/>
		<p style="float:right;text-decoration-line:none" class="btn btn-danger" onclick="switchMe('login','register')">Login</p>
        </td>
		</tr>
		</table>
    </div>
        <div id="login">
          <h3 style="border-bottom:1px solid #ccc">LOG-IN</h3>
        <table id="tablelogin">
		<tr>
		<td><asp:Label ID="Label4" runat="server" Text="Username:"></asp:Label></td>
        <td><asp:TextBox ID="logusername" runat="server"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" foreColor="red" ErrorMessage="Required"  ValidationGroup="valLog" ControlToValidate="logusername"></asp:RequiredFieldValidator></td>
       </tr>
	   <tr>
        <td><asp:Label ID="Label5" runat="server" Text="Password:"></asp:Label></td>
        <td><asp:TextBox ID="logpassword" runat="server" TextMode="Password"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  foreColor="red" ErrorMessage="Required" ValidationGroup="valLog" ControlToValidate="logpassword"></asp:RequiredFieldValidator></td>
        </tr>
		<tr>
		<td></td>
        <td><asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Login" ValidationGroup="valLog"/>
         <p style="float:right;text-decoration-line:none" class="btn btn-success" onclick="switchMe('register','login')">Create Account</p>
        </td>
            <td></td>
		 </tr>
		 </table>
        </div>
    </form>
    </div>
     </div>
</body>
</html>
