<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Dashboard.aspx.vb" Inherits="EAS.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Dashboard</title>
</head>
<body>
<form id="form1" runat="server" autocomplete="off">
	<div id="wrapper">
		<!-- #include file="navfixed.html"-->
		<div id="page-wrapper">
			<div class="col-lg-12">
			<%--<h3 class="page-header" align="center">TIME IN AND TIME OUT</h3>--%>
			</div>
            <br />
        <br />
        <br />
        <br />
			<div class="cotainer">
			<table border="0" width="100%">
			<tr>
			<td>
			<canvas  class="pull-left" id="canvas" width="400" height="400">
			</canvas>
			</td>
			<td width="60%">
			<div class="login-box">
			<div class="login-logo">
                <h4 class="page-header" align="center">TIME IN/OUT</h4>
				<h2 class="alert alert-info"><asp:Label ID="TimeInme" runat="server" Text="Label"><%= DateTime.Now.ToString("MMMM dd, yyyy")%></asp:Label>&nbsp;<%Response.Write(FormatDateTime(Now(), 3) & "")%></h2>
			</div>
			<hr/>
			<div class="login-box-body">
			<h4 class="login-box-msg"></h4>
			<div class="form-group">
			</div>
			<div class="row">
			<div class="col-xs-6">
				<asp:TextBox ID="fortimein" runat="server" CssClass="form-control" ValidationGroup="ForTimeIn" ReadOnly="True">TimeIn</asp:TextBox>
			<br />
                <asp:button id="btnTimeinIN" cssclass="btn btn-warning btn-lg btn-block" runat="server" text="TimeIN" ValidationGroup="ForTimeIn" />
			</div>
			<div class="col-xs-6">
			<asp:TextBox ID="fortimeout" runat="server"  CssClass="form-control" ValidationGroup="ForTimeOUT" ReadOnly="True">TimeOut</asp:TextBox>
			  <br />
              <asp:Button ID="btnTimeOut" CssClass="btn btn-danger btn-lg btn-block" runat="server" Text="TimeOut" ValidationGroup="ForTimeOUT" />
			</div>
			</div>
			</div>
			</div>
			</td>
			</tr>
			</table>

			</div>
		</div>
	</div>
</form>
</body>
</html>
<script>
    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var radius = canvas.height / 2;
    ctx.translate(radius, radius);
    radius = radius * 0.90
    setInterval(drawClock, 1000);

    function drawClock() {
        drawFace(ctx, radius);
        drawNumbers(ctx, radius);
        drawTime(ctx, radius);
    }

    function drawFace(ctx, radius) {
        var grad;
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, 2 * Math.PI);
        ctx.fillStyle = 'white';
        ctx.fill();
        grad = ctx.createRadialGradient(0, 0, radius * 0.95, 0, 0, radius * 1.05);
        grad.addColorStop(0, '#333');
        grad.addColorStop(0.5, 'white');
        grad.addColorStop(1, '#ccc');
        ctx.strokeStyle = grad;
        ctx.lineWidth = radius * 0.1;
        ctx.stroke();
        ctx.beginPath();
        ctx.arc(0, 0, radius * 0.1, 0, 2 * Math.PI);
        ctx.fillStyle = 'red';
        ctx.fill();
    }

    function drawNumbers(ctx, radius) {
        var ang;
        var num;
        ctx.font = radius * 0.15 + "px arial";
        ctx.textBaseline = "middle";
        ctx.textAlign = "center";
        for (num = 1; num < 13; num++) {
            ang = num * Math.PI / 6;
            ctx.rotate(ang);
            ctx.translate(0, -radius * 0.85);
            ctx.rotate(-ang);
            ctx.fillText(num.toString(), 0, 0);
            ctx.rotate(ang);
            ctx.translate(0, radius * 0.85);
            ctx.rotate(-ang);
        }
    }

    function drawTime(ctx, radius) {
        var now = new Date();
        var hour = now.getHours();
        var minute = now.getMinutes();
        var second = now.getSeconds();
        //hour
        hour = hour % 12;
        hour = (hour * Math.PI / 6) +
        (minute * Math.PI / (6 * 60)) +
        (second * Math.PI / (360 * 60));
        drawHand(ctx, hour, radius * 0.5, radius * 0.07);
        //minute
        minute = (minute * Math.PI / 30) + (second * Math.PI / (30 * 60));
        drawHand(ctx, minute, radius * 0.8, radius * 0.07);
        // second
        second = (second * Math.PI / 30);
        drawHand(ctx, second, radius * 0.9, radius * 0.02);
    }

    function drawHand(ctx, pos, length, width) {
        ctx.beginPath();
        ctx.lineWidth = width;
        ctx.lineCap = "round";
        ctx.moveTo(0, 0);
        ctx.rotate(pos);
        ctx.lineTo(0, -length);
        ctx.stroke();
        ctx.rotate(-pos);
    }
</script>