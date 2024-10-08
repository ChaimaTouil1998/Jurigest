<%@ Page Language="VB" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">   
        <asp:Button ID="Button1" runat="server" Height="85px" OnClick="Button1_Click" Text="Connect" Width="100px" />
        <asp:Button ID="Button2" runat="server" Height="85px" OnClick="Button1_Click" Text="déconnexion" Width="100px" />
        <asp:Label ID="Label1" runat="server" Text="........................."></asp:Label>
    </form>
</body>
</html>
