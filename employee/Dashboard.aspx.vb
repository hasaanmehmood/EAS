Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebControl
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO

Public Class Dashboard
    Inherits System.Web.UI.Page

    Public con As String = ConfigurationManager.ConnectionStrings("connect_db").ConnectionString
    Public conn = New SqlConnection(con)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getAllData()
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
    Sub getAllData()
        Dim usernames As String = Session("user")
        Dim getData As String = "SELECT * FROM user_tbl WHERE username = @username"
        Dim cmd = New SqlCommand(getData, conn)

        cmd.Parameters.AddWithValue("@username", usernames)

    End Sub
    Protected Sub btnTimeinIN_Click(sender As Object, e As EventArgs) Handles btnTimeinIN.Click
        Dim usernum As String = (Session("user"))
        Dim statuss As String = fortimein.Text
        Dim timein As String = DateTime.Now.ToString("dd/MM/yyyy")
        Dim forinout As String = TimeOfDay.ToString("HH:mm:ss tt")
        Dim forendate As String = DateTime.Now.ToString("dd/MM/yyyy")

        Dim validate As String = "SELECT timeinout FROM attendancelogs WHERE timeinout ='" & timein & "' AND status ='" & statuss & "' AND user_id ='" & usernum & "' AND endate ='" & forendate & "'"
        Dim cmd = New SqlCommand(validate, conn)

        Dim myTable As New DataTable
        Dim adapter As New SqlDataAdapter(cmd)
        adapter.Fill(myTable)

        If myTable.Rows.Count > 0 Then
            Response.Write("<script> alert(""You have TimeIn for today"")</script>")
        Else
            Dim addquery As String = "INSERT INTO attendancelogs VALUES (@user_id, @status, @timeinout, @inout, @endate)"
            Dim com = New SqlCommand(addquery, conn)

            com.Parameters.AddWithValue("@user_id", usernum)
            com.Parameters.AddWithValue("@status", statuss)
            com.Parameters.AddWithValue("@timeinout", timein)
            com.Parameters.AddWithValue("@inout", forinout)
            com.Parameters.AddWithValue("@endate", forendate)

            Dim x As Integer = 0
            Try
                conn.open()
                x = com.ExecuteNonQuery()
            Catch ex As Exception
                Response.Write("<script> alert(" & ex.Message & ")</script>")
            Finally
                conn.close()
                cmd.Parameters.Clear()
            End Try
            Select Case x
                Case 1
                    Response.Write("<script> alert(""TimeIn successfully"")</script>")
                Case 0
                    Response.Write("<script> alert(""pooooss"")</script>")
            End Select
        End If
    End Sub
    Protected Sub btnTimeOut_Click(sender As Object, e As EventArgs) Handles btnTimeOut.Click
        Dim usernum As String = (Session("user"))
        Dim statuss As String = fortimeout.Text
        Dim timein As String = DateTime.Now.ToString("dd/MM/yyyy")
        Dim forinout As String = TimeOfDay.ToString("HH:mm:ss tt")
        Dim forendate As String = DateTime.Now.ToString("dd/MM/yyyy")

        Dim validate As String = "SELECT timeinout FROM attendancelogs WHERE timeinout ='" & timein & "' AND status ='" & statuss & "' AND user_id ='" & usernum & "' AND endate ='" & forendate & "'"
        Dim cmd = New SqlCommand(validate, conn)

        Dim myTable As New DataTable
        Dim adapter As New SqlDataAdapter(cmd)
        adapter.Fill(myTable)

        If myTable.Rows.Count > 0 Then
            Response.Write("<script> alert(""You have TimeOut for today"")</script>")
        Else
            Dim addquery As String = "INSERT INTO attendancelogs VALUES (@user_id, @status, @timeinout, @inout, @endate)"
            Dim com = New SqlCommand(addquery, conn)

            com.Parameters.AddWithValue("@user_id", usernum)
            com.Parameters.AddWithValue("@status", statuss)
            com.Parameters.AddWithValue("@timeinout", timein)
            com.Parameters.AddWithValue("@inout", forinout)
            com.Parameters.AddWithValue("@endate", forendate)

            Dim x As Integer = 0
            Try
                conn.open()
                x = com.ExecuteNonQuery()
            Catch ex As Exception
                Response.Write("<script> alert(" & ex.Message & ")</script>")
            Finally
                conn.close()
                cmd.Parameters.Clear()
            End Try
            Select Case x
                Case 1
                    Response.Write("<script> alert(""TimeOut successfully"")</script>")
                Case 0
                    Response.Write("<script> alert(""pooooss"")</script>")
            End Select
        End If
    End Sub
End Class

