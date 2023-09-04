<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminemployee.aspx.vb" Inherits="EAS.adminemployee" EnableEventValidation="False" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Employee</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <!-- #include file="adminnavfixedemployee.html"-->
        <br />
       <div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Employee List</h3>
        <%--<asp:Label>Enter Date Hired From: </asp:Label> 
        <asp:TextBox ID="tbDateFrom" runat="server"></asp:TextBox>
        <asp:Label>To: </asp:Label> 
        <asp:TextBox ID="tbDateTo" runat="server"></asp:TextBox>--%>
        <asp:Label>Search employee Last name:</asp:Label>
        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
         <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-sm btn-success" Text="Find"/>
                &nbsp; <asp:Button ID="excel" runat="server" CssClass="btn-sm btn btn-danger" Text="Export to Excel" OnClick="btnexport"/>
         <br />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" DataKeyNames="user_id" AllowSorting="True" AllowPaging="True" DataSourceID="SqlDataSource1" PagerSettings-Mode="Numeric">
            <Columns>
               <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" HeaderText="Tools" />
                <asp:BoundField DataField="user_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="user_id" Visible="False"/> 
                 <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                 <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                <asp:BoundField DataField="age"  HeaderText="Age" SortExpression="Age" />
				<asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position"  />
				<asp:BoundField DataField="datehired" HeaderText="Date Hired" SortExpression="datehired" />
                </Columns>
        </asp:GridView>
               <%--FilterExpression="datehired >='{0}' AND datehired <='{1}' AND lastname='{2}'"--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT* FROM [user_tbl] ORDER BY firstname ASC " FilterExpression="lastname='{0}'" UpdateCommandType="Text" UpdateCommand="UPDATE user_tbl SET position = @position, datehired = @datehired WHERE user_id = @user_id">
            <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="user_id" SessionField="user" Type="String" />
           </SelectParameters>
            <FilterParameters>
            <%--<asp:ControlParameter Name="datehired" ControlID="tbDateFrom"/>
             <asp:ControlParameter Name="datehired" ControlID="tbDateTo"/>--%>
             <asp:ControlParameter Name="lastname" ControlID="lname"/>
           </FilterParameters>
          </asp:SqlDataSource>
           
    </div>
     </div>
    </div>
    </form>
</body>
</html>