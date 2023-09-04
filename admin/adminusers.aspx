<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminusers.aspx.vb" Inherits="EAS.adminusers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin users</title>
</head>
<body>
<form id="form1" runat="server">
    <div id="wrapper"><!-- #include file="adminnavfixedusers.html"-->
        <br />
	<div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Users List</h3>
		    <%--<asp:Label ForeColor="#003366">Example: From: 2019-11-16 To: 2019-1-16 lastname: Jario</asp:Label>--%>
<%--     <asp:Label>Enter Date Hired From: </asp:Label> 
        <asp:TextBox ID="tbDateFrom" runat="server"></asp:TextBox>
        <asp:Label>To: </asp:Label> 
        <asp:TextBox ID="tbDateTo" runat="server"></asp:TextBox>--%>
        <asp:Label>Enter First Name or Last name:</asp:Label>
        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
         <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-sm btn-default" Text="Find"/>
         <br />
        <br />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" DataKeyNames="user_id" AllowSorting="True" AllowPaging="True" DataSourceID="SqlDataSource1" PagerSettings-Mode="Numeric">
            <Columns>
               <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" HeaderText="Tools" />
                 <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                 <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                <asp:BoundField DataField="age"  HeaderText="Age" SortExpression="Age" />
				<asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password"  />
                </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT* FROM [user_tbl] ORDER BY firstname ASC " FilterExpression="lastname='{0}' OR firstname ='{1}'" UpdateCommandType="Text" UpdateCommand="UPDATE user_tbl SET username = @username, password = @password WHERE user_id = @user_id">
            <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="user_id" SessionField="user" Type="String" />
           </SelectParameters>
            <FilterParameters>
<%--            <asp:ControlParameter Name="datehired" ControlID="tbDateFrom"/>
             <asp:ControlParameter Name="datehired" ControlID="tbDateTo"/>--%>
             <asp:ControlParameter Name="lastname" ControlID="lname"/>
              <asp:ControlParameter Name="firstname" ControlID="lname"/>
           </FilterParameters>
          </asp:SqlDataSource>
           
    </div>
    </div>
    </div>
    </form>
</body>
</html>
