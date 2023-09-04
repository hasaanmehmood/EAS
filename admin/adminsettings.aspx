<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminsettings.aspx.vb" Inherits="EAS.adminsettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Settings</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper"><!-- #include file="adminnavfixedsettings.html"-->
        
	<div id="page-wrapper">
           <div class="col-lg-12">
               <br />
			<h3 class="page-header">Update Information</h3>
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" DataKeyNames="admin_id" AllowSorting="True" AllowPaging="True" DataSourceID="SqlDataSource1" PagerSettings-Mode="Numeric">
            <Columns>
               <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" HeaderText="Tools" />
                 <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                 <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                <asp:BoundField DataField="age"  HeaderText="Age" SortExpression="Age" />
                 <asp:BoundField DataField="contact"  HeaderText="Contact" SortExpression="contact" />
                 <asp:BoundField DataField="user_level"  HeaderText="User Type" SortExpression="user_level" />
				<asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password"  />
                </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT* FROM [admin_tbl] ORDER BY admin_id ASC "  UpdateCommandType="Text" UpdateCommand="UPDATE admin_tbl SET firstname = @firstname, lastname = @lastname, age = @age, contact = @contact,  username = @username, password = @password WHERE admin_id = @admin_id">
            <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="username" SessionField="user" Type="String" />
           </SelectParameters>
          </asp:SqlDataSource>
           
    </div>
    </div>
     </div>
    </form>
</body>
</html>


