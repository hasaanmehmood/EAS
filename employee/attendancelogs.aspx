<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="attendancelogs.aspx.vb" Inherits="EAS.attendancelogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <!-- #include file="navfixedattend.html"-->
        <br />
        <br />
       <div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Attendance Summary</h3>
		    
    
        <asp:Label>Enter Date Range From: </asp:Label> 
        <asp:TextBox ID="tbDateFrom" runat="server"></asp:TextBox>
        <asp:Label>To: </asp:Label> 
        <asp:TextBox ID="tbDateTo" runat="server"></asp:TextBox>
         <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-sm btn-default" Text="Filter"/>
            <asp:Label><i>Example: From: 1/11/2019 To: 31/11/2019</i></asp:Label> 
        <br />
         <br />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" PageSize = "10" DataKeyNames="empid" AllowSorting="True" AllowPaging="True" DataSourceID="SqlDataSource1" AllowCustomPaging="False" PagerSettings-Mode="Numeric">
            <Columns>
                <asp:BoundField DataField="empid" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="empid" />
               <%-- <asp:BoundField DataField="user_id" HeaderText="Session Id" SortExpression="user_id" />--%>
                 <asp:BoundField DataField="firstname" HeaderText="Firstname" SortExpression="firstname" />
                 <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"  />
                <asp:BoundField DataField="timeinout" HeaderText="Date TimeIn/Out" SortExpression="timeinout"  />
                <asp:BoundField DataField="inout" HeaderText="Hour TimeIn/Out" SortExpression="inout" />
                <%--<asp:BoundField DataField="endate" HeaderText="endate" SortExpression="endate" />--%>
                </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT user_tbl.username, user_tbl.lastname, user_tbl.firstname, attendancelogs.empid, attendancelogs.status, attendancelogs.timeinout, attendancelogs.inout FROM [user_tbl] INNER JOIN [attendancelogs] ON user_tbl.username=attendancelogs.user_id WHERE username=@user_id ORDER BY timeinout ASC " FilterExpression="timeinout >='{0}' AND timeinout <='{1}'">
            <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="user_id" SessionField="user" Type="String" />
           </SelectParameters>
            <FilterParameters>
            <asp:ControlParameter Name="timeinout" ControlID="tbDateFrom"/>
             <asp:ControlParameter Name="timeinout" ControlID="tbDateTo"/>
           </FilterParameters>
          </asp:SqlDataSource>
           
    </div>
     </div>
    </div>
    </form>
</body>
</html>
