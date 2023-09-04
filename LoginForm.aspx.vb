Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebControl
Imports System.Data.SqlClient
Imports System.Configuration

Public Class LoginForm
    Inherits System.Web.UI.Page

    Public con As String = ConfigurationManager.ConnectionStrings("connect_db").ConnectionString
    Public conn = New SqlConnection(con)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim username As String = logusername.Text
        Dim password As String = logpassword.Text

        Dim userquery As String = "SELECT username, password, user_level FROM user_tbl WHERE username=@username AND password=@password UNION SELECT username, password, user_level FROM admin_tbl WHERE username=@username AND password=@password"
        Dim cmd = New SqlCommand(userquery, conn)

        cmd.Parameters.AddWithValue("@username", username)
        cmd.Parameters.AddWithValue("@password", password)

        Dim adapter As New SqlDataAdapter(cmd)
        Dim myTable As New DataTable

        conn.open()
        adapter.Fill(myTable)
        Session("user") = username
        If myTable.Rows.Count > 0 Then
            If myTable.Rows(0)("user_level") = "admin" Then
                Response.Redirect("~/admin/admindashboard.aspx")
            ElseIf myTable.Rows(0)("user_level") = "Employee" Then
                Response.Redirect("~/employee/Dashboard.aspx")
            End If
        Else
            Response.Write("<script> alert(""incorrect username or password!"")</script>")
        End If

    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Dim user As String = username.Text
        Dim pass As String = password.Text
        Dim user_levels As String = "Employee"
        Dim firstnames As String = fname.Text
        Dim lastnames As String = lname.Text
        Dim ages As String = age.Text
        Dim contacts As String = contact.Text
        Dim posistions As String = position.Text
        Dim datehireds As String = DateHired.Text
        Dim genders As String = gender.Text

        Dim validate As String = "SELECT username FROM user_tbl WHERE username ='" & user & "'"
        Dim cmd = New SqlCommand(Validate, conn)

        Dim myTable As New DataTable
        Dim adapter As New SqlDataAdapter(cmd)
        adapter.Fill(myTable)

        If myTable.Rows.Count > 0 Then
            Response.Write("<script> alert(""Username is already existed"")</script>")
        Else
            Dim addquery As String = "INSERT INTO user_tbl VALUES (@username, @password, @user_level, @firstname, @lastname, @age, @contact, @position, @datehired,@gender)"
            Dim com = New SqlCommand(addquery, conn)

            com.Parameters.AddWithValue("@username", user)
            com.Parameters.AddWithValue("@password", pass)
            com.Parameters.AddWithValue("@user_level", user_levels)
            com.Parameters.AddWithValue("@firstname", firstnames)
            com.Parameters.AddWithValue("@lastname", lastnames)
            com.Parameters.AddWithValue("@age", ages)
            com.Parameters.AddWithValue("@contact", contacts)
            com.Parameters.AddWithValue("@position", posistions)
            com.Parameters.AddWithValue("@datehired", datehireds)
            com.Parameters.AddWithValue("@gender", genders)

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
                    Response.Write("<script> alert(""Registered successfully"")</script>")
                Case 0
                    Response.Write("<script> alert(""Password not match!"")</script>")
            End Select
        End If
    End Sub
End Class