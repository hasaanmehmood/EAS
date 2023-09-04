<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminattendance.aspx.vb" Inherits="EAS.adminattendance" EnableEventValidation="False" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Attendance</title>
    <style>
        #DropDownList1, #username, #password, #retypepassword, #logusername, #logpassword, #DateHired, #fname, #lname, #age, #contact, #position, #DateHired {
            padding: 4px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
    <div id="wrapper">
        <!-- #include file="adminnavfixedattend.html"-->
        <br />
       <div id="page-wrapper">
           <div class="col-lg-12">
			<h3 class="page-header">Attendance Summary</h3>
		    <asp:Label ForeColor="#003366">Example: From: 1/11/2019 To: 31/11/2019</asp:Label>
        <br />
        <asp:Label>Enter Date Range From: </asp:Label> 
        <asp:TextBox ID="tbDateFrom" runat="server"></asp:TextBox>
        <asp:Label>To: </asp:Label> 
        <asp:TextBox ID="tbDateTo" runat="server"></asp:TextBox>
        <asp:Label>User id/Emp id:</asp:Label>
        <asp:TextBox ID="lname" runat="server"></asp:TextBox>
         <asp:Button ID="btnSearch" runat="server" CssClass="btn-sm btn btn-success" Text="Filter"/>
            &nbsp; <asp:Button ID="excel" runat="server" CssClass="btn-sm btn btn-danger" Text="Export to Excel" OnClick="btnexport"/>
         <br />
         <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" Width="100%" Font-Names="Arial" Font-Size="Small" DataKeyNames="empid" AllowSorting="True" AllowPaging="True" DataSourceID="SqlDataSource1" PagerSettings-Mode="Numeric" EmptyDataText="No records has been added." PageSize="10">
            <Columns>
                 <asp:BoundField DataField="empid" HeaderText="#" InsertVisible="False" ReadOnly="False" SortExpression="empid" Visible="False" /> 
               <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="False" HeaderText="Tools" />
                <asp:BoundField DataField="user_id" HeaderText="Name" InsertVisible="True" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="status"  HeaderText="Status" SortExpression="status" />
                <asp:BoundField DataField="timeinout" HeaderText="Date TimeIn/Out" SortExpression="timeinout"  />
                <asp:BoundField DataField="inout" HeaderText="Hour TimeIn/Out" SortExpression="inout" />
              </Columns>
             <PagerStyle Width="15px" />
        </asp:GridView>
             <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT user_tbl.user_id, user_tbl.username, user_tbl.lastname, user_tbl.firstname, attendancelogs.empid, attendancelogs.user_id, attendancelogs.status, attendancelogs.timeinout, attendancelogs.inout FROM [user_tbl] INNER JOIN [attendancelogs] ON user_tbl.username=attendancelogs.user_id ORDER BY timeinout ASC " FilterExpression="timeinout >='{0}' AND timeinout <='{1}' AND lastname='{2}'" UpdateCommandType="Text" UpdateCommand="UPDATE attendancelogs SET timeinout = @timeinout, inout = @inout WHERE empid = @empid">
            <SelectParameters>--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT* FROM [attendancelogs]" FilterExpression="timeinout >='{0}' AND timeinout <='{1}' AND user_id='{2}'" UpdateCommand="UPDATE attendancelogs SET timeinout = @timeinout, inout = @inout WHERE empid = @empid" InsertCommand="INSERT INTO attendancelogs (user_id, status, timeinout,inout) VALUES (@user_id, @status , @timeinout, @inout)" DeleteCommand="DELETE FROM attendancelogs WHERE empid = @empid">
            <InsertParameters>
                <%--<asp:ControlParameter Name="empid" ControlID="txtuser_id" Type="String" />--%>
            <asp:ControlParameter Name="user_id" ControlID="txtuser_id" Type="String" />
            <asp:ControlParameter Name="status" ControlID="DropDownList1" Type="String" />
                <asp:ControlParameter Name="timeinout" ControlID="txttimeinout" Type="String" />
                <asp:ControlParameter Name="inout" ControlID="txtinout" Type="String" />
                </InsertParameters>
                <SelectParameters>
             <asp:SessionParameter DefaultValue="" Name="user_id" SessionField="user" Type="String" />
           </SelectParameters>
            <FilterParameters>
            <asp:ControlParameter Name="timeinout" ControlID="tbDateFrom"/>
             <asp:ControlParameter Name="timeinout" ControlID="tbDateTo"/>
             <asp:ControlParameter Name="user_id" ControlID="lname"/>
           </FilterParameters>
          </asp:SqlDataSource>
           <table class="table table-striped table-bordered table-hover">
               <asp:Label ID="Label1" runat="server" Text="Label">Add Time In/Out with date format must be: DD/MM/YYYY</asp:Label>
        <tr>
            <td>
                User Id:<asp:TextBox ID="txtuser_id" runat="server" />
            </td>
            <td>
                Status:<asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>TimeIn</asp:ListItem>
                    <asp:ListItem>TimeOut</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                Date:<asp:TextBox ID="txttimeinout" runat="server"/>
            </td>
            <td>
                Time:<asp:TextBox ID="txtinout" runat="server"  TextMode="Time" />
            </td>
            <td rowspan="2">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" CssClass="btn btn-sm btn-primary" ValidationGroup="btnAddTimeInOut"/>
            </td>
        </tr>
        <tr>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" foreColor="red" ErrorMessage="*User Id" ValidationGroup="btnAddTimeInOut" ControlToValidate="txtuser_id"></asp:RequiredFieldValidator></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" foreColor="red" ErrorMessage="*Status" ValidationGroup="btnAddTimeInOut" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" foreColor="red" ErrorMessage="*Date TimeInOut" ValidationGroup="btnAddTimeInOut" ControlToValidate="txttimeinout"></asp:RequiredFieldValidator></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" foreColor="red" ErrorMessage="*Hours TimeInOut" ValidationGroup="btnAddTimeInOut" ControlToValidate="txtinout"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    </div>
     </div>
    </div>
        
    </form>
</body>
</html>