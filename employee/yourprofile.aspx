<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="yourprofile.aspx.vb" Inherits="EAS.yourprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        <!-- #include file="navfixedprof.html"-->
        <br />
        <br />
       <div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Profile Information</h3>
		</div>
    <div class="col-lg-12">
        <table width="100%" id="table">
             <tr>
                <td width="5%">Firstname:</td>
                <td><asp:TextBox ID="firstname" Cssclass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" validationGroup="valAdd" ControlToValidate="firstname" ErrorMessage="Firstname is Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
                <td width="5%">Lastname:</td>
                <td><asp:TextBox ID="lastname" Cssclass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" validationGroup="valAdd" ControlToValidate="lastname" ErrorMessage="Lastname is Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
               <td width="5%">Age:</td>
                <td><asp:TextBox ID="age" Cssclass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" validationGroup="valAdd" ControlToValidate="age" ErrorMessage="Age is Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
                <td width="5%">Contact:</td>
                <td><asp:TextBox ID="contact" Cssclass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" validationGroup="valAdd" ControlToValidate="contact" ErrorMessage="Contact is Required" ForeColor="Red"></asp:RequiredFieldValidator></td>
		     </tr>
            <tr>
                <td width="5%"></td>
                <td><asp:Button ID="btnAddVehicle" Cssclass="btn btn-default" runat="server" Text="Submit Changes" ValidationGroup="valAdd"/></td>
                <td></td>
            </tr>
         </table>

         <asp:HiddenField ID="user_id" runat="server" />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" PageSize = "10" >
            <Columns>
                <asp:BoundField DataField="firstname" HeaderText="First Name"/>
                <asp:BoundField DataField="lastname" HeaderText="Last Name"  />
                <asp:BoundField DataField="age" HeaderText="Age" />
                <asp:BoundField DataField="contact" HeaderText="Phone Number"/>
                <asp:BoundField DataField="position" HeaderText="Designation" />
                <asp:BoundField DataField="datehired" HeaderText="Date Hired" />
                <asp:templateField>
                <ItemTemplate>
                   <asp:LinkButton runat ="server"  class="btn btn-default" OnClick="dataShow" CommandArgument='<%# Eval("user_id")%>'>UPDATE</asp:LinkButton>
                </ItemTemplate>
            </asp:templateField>
                </Columns>
        </asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
