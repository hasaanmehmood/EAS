<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="setting.aspx.vb" Inherits="EAS.setting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Profile</title>
     <style type="text/css">
        body {
            /*background:#eee;*/
            font-family:Arial;
            margin:0 auto;
        }
        #container {

            margin: 0 auto;
            width:800px;
            height: 0 auto;
            padding:10px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border:1px solid #eee;
            background:#fff;
        }
        #divadd{
            border-bottom: 1px solid #eee;
        }
        #table td{
            padding:5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div id="wrapper">
        <!-- #include file="navfixedset.html"-->
        <br />
        <br />
       <div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Change Password</h3>
		</div>
    <div class="col-lg-12">
        <table width="100%" id="table">
             <tr>
                <td width="15%">Username:</td>
                <td><asp:TextBox ID="username" Cssclass="form-control" runat="server" ReadOnly="True"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" validationGroup="valAdd" ControlToValidate="username" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
                <td width="15%">Type New Passowrd:</td>
                <td><asp:TextBox ID="password" Cssclass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" validationGroup="valAdd" ControlToValidate="password" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
                <td width="15%"></td>
                <td><asp:Button ID="btnAddVehicle" Cssclass="btn btn-default" runat="server" Text="Saved" ValidationGroup="valAdd"/></td>
                <td></td>
            </tr>
         </table>

         <asp:HiddenField ID="user_id" runat="server" />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" PageSize = "10" >
            <Columns>
                <asp:BoundField DataField="username" HeaderText="Username"/>
                <asp:BoundField DataField="firstname" HeaderText="First Name"/>
                <asp:BoundField DataField="lastname" HeaderText="Last Name"  />
                <asp:BoundField DataField="age" HeaderText="Age" />
                <asp:templateField>
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButton1" runat ="server"  class="btn btn-default" OnClick="dataShow" CommandArgument='<%# Eval("user_id")%>'>Change Password</asp:LinkButton>
                </ItemTemplate>
            </asp:templateField>
                </Columns>
        </asp:GridView>
    </div>
</div>
    </form>
</body>
</html>