Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebControl
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO

Public Class attendancelogs
    Inherits System.Web.UI.Page

    Public con As String = ConfigurationManager.ConnectionStrings("connect_db").ConnectionString
    Public conn = New SqlConnection(con)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = vbNullString Then
            Response.Redirect("~/LoginForm.aspx")
        End If
    End Sub
    Protected Sub logout_click(sender As Object, e As EventArgs)
        Session.Remove("user")
        Session.RemoveAll()
        Session.Abandon()
        Response.Redirect("~/LoginForm.aspx")
    End Sub
    'Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
    '    Dim usernum As String = Session("user")
    '    Dim fromdate As String = tbDateFrom.Text
    '    Dim enddates As String = tbDateTo.Text
    '    'Dim searchquery As String = "SELECT * FROM attendancelogs WHERE timeinout LIKE '%" & fromdate & "%' AND timeinout LIKE '%" & enddate & "%' AND user_id LIKE '%" & usernum & "%'"
    '    'Dim searchquery As String = "SELECT user_id, status, timeinout, inout FROM attendancelogs WHERE timeinout = '" & fromdate & "' AND timeinout ='" & enddates & "' AND user_id = '" & usernum & "'"
    '    Dim searchquery As String = "SELECT * FROM attendancelogs WHERE timeinout >= '" & fromdate & "' AND timeinout <'" & enddates & "' AND user_id ='" & usernum & "'"

    '    Dim cmd = New SqlCommand(searchquery, conn)

    '    'conn.open()
    '    'Dim ds As New DataSet
    '    'Dim adapter As New SqlDataAdapter(cmd)
    '    'adapter.Fill(ds)
    '    'GridView1.DataSource = ds
    '    'GridView1.DataBind()
    '    'conn.close()

    '    'conn.open()
    '    'GridView1.DataSource = cmd.ExecuteReader()
    '    'GridView1.DataBind()
    '    'conn.close()
    'End Sub
End Class