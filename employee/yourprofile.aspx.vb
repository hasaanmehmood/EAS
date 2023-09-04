Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebControl
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO

Public Class yourprofile
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

        conn.open()
        GridView1.DataSource = cmd.ExecuteReader()
        GridView1.DataBind()
        conn.close()
    End Sub
    Sub dataShow(x As Object, e As EventArgs)
        Dim id As Integer = Convert.ToInt32(CType(x, LinkButton).CommandArgument())

        Dim getquery As String = "SELECT * FROM user_tbl WHERE user_id =@id"
        Dim cmd = New SqlCommand(getquery, conn)

        cmd.Parameters.AddWithValue("@id", id)


        Dim myTable As New DataTable
        Dim adapter As New SqlDataAdapter(cmd)

        Try
            conn.open()
            adapter.Fill(myTable)
            user_id.Value = id.ToString()
            firstname.Text = myTable.Rows(0)("firstname").ToString()
            lastname.Text = myTable.Rows(0)("lastname").ToString()
            age.Text = myTable.Rows(0)("age").ToString()
            contact.Text = myTable.Rows(0)("contact").ToString()

        Catch ex As Exception
            Response.Write("<script> alert(" & ex.Message & ")</script>")
        Finally
            conn.close()
            cmd.Parameters.Clear()
        End Try
    End Sub

    Protected Sub btnAddVehicle_Click(sender As Object, e As EventArgs) Handles btnAddVehicle.Click
        Dim firstnames As String = firstname.Text
        Dim lastnames As String = lastname.Text
        Dim ages As String = age.Text
        Dim contacts As String = contact.Text
        Dim id As Integer = Val(user_id.Value)

        Dim ad As String = "UPDATE user_tbl SET firstname = @firstname, lastname = @lastname, age = @age, contact = @contact WHERE user_id = @id"

        Dim cmd = New SqlCommand(ad, conn)
        cmd.Parameters.AddWithValue("@firstname", firstnames)
        cmd.Parameters.AddWithValue("@lastname", lastnames)
        cmd.Parameters.AddWithValue("@age", ages)
        cmd.Parameters.AddWithValue("@contact", contacts)
        cmd.Parameters.AddWithValue("@id", id)
        Dim x As Integer = 0

        Try
            conn.open()
            x = cmd.ExecuteNonQuery()
        Catch ex As Exception
            Response.Write("<script> alert(" & ex.Message & ")</script>")
        Finally
            conn.close()
            cmd.Parameters.Clear()
        End Try

        Select Case x
            Case 1
                getAllData()
                Response.Write("<script> alert(""Information has been updated successfully"")</script>")
                firstname.Text = ""
                lastname.Text = ""
                age.Text = ""
                contact.Text = ""
            Case 0
                Response.Write("<script> alert(""Opps!! hinay hinay lang!!"")</script>")
        End Select
    End Sub
End Class