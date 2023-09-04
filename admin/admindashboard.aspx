<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admindashboard.aspx.vb" Inherits="EAS.admindashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <!-- #include file="adminnavfixeddashboard.html"-->
        <br />
       <div id="page-wrapper">
       <div class="col-lg-12">
			<h3 class="page-header">Dashboard</h3>
        </div>
        <div class="col-lg-5">
           <div class="panel panel-info">
              <div class="panel-heading"> 
                <h3 class="panel-title">MALE</h3>
             </div>
               <div class="panel-body">
                       <asp:Label ID="Label1" runat="server"></asp:Label>
                 </div>
          </div>
         </div>  
          
           <div class="col-lg-5">
               <div class="panel panel-warning">
              <div class="panel-heading"> 
                <h3 class="panel-title">FEMALE</h3>
             </div>
                   <div class="panel-body">
                       <asp:Label ID="Label2" runat="server"></asp:Label>
                   </div>
          </div>
            </div>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT * FROM [user_tbl] WHERE gender ='Male' "  UpdateCommandType="Text">
          </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"></asp:Repeater>

          
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT * FROM [user_tbl] WHERE gender ='Female' "  UpdateCommandType="Text">
          </asp:SqlDataSource>
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2"></asp:Repeater>

          <%-- <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EASConnectionString %>" SelectCommand="SELECT sum(user_id) FROM [user_tbl]" UpdateCommandType="Text">
          </asp:SqlDataSource>
        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3"></asp:Repeater>--%>
        
    </div>
    </div>   
  </form>
</body>
</html>
