Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebControl
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Public Class admindashboard
    Inherits System.Web.UI.Page
    Public con As String = ConfigurationManager.ConnectionStrings("connect_db").ConnectionString
    Public conn = New SqlConnection(con)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = vbNullString Then
            Response.Redirect("~/LoginForm.aspx")
        End If
        'If Not Page.IsPostBack Then
        '    getAllData("")
        'End If
    End Sub
    Protected Sub logout_click(sender As Object, e As EventArgs)
        Session.Remove("user")
        Session.RemoveAll()
        Session.Abandon()
        Response.Redirect("~/LoginForm.aspx")
    End Sub
    Protected Sub SqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        Label1.Text = String.Format("Total Records: {0}", e.AffectedRows)
    End Sub
    Protected Sub SqlDataSource2_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Selected
        Label2.Text = String.Format("Total Records: {0}", e.AffectedRows)
    End Sub
    'Sub getAllData(ByVal username As String)
    '    Dim dt As New DataTable()
    '    Dim sqlCmd As New SqlCommand("SELECT count(*) FROM user_tbl WHERE username = @username", conn)
    '    Dim sqlDa As New SqlDataAdapter(sqlCmd)

    '    sqlCmd.Parameters.AddWithValue("@username", username)

    '    conn.open()
    '    sqlDa.Fill(dt)
    '    If dt.Rows.Count > 0 Then
    '        Label3.Text = "number of:" & dt.Rows.Count.ToString()
    '    End If
    '    conn.close()
    '    'conn.open()
    '    'GridView1.DataSource = cmd.ExecuteReader()
    '    'GridView1.DataBinds()
    '    'conn.close()
    'End Sub
End Class