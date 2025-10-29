<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserModifyPage.aspx.cs" Inherits="Global_Kitchen.UserModifyPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
    <style>
        body { font-family: Arial; background: #f5f5f5; }
        .container { max-width: 600px; margin: 50px auto; background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        label { font-weight: bold; margin-top: 10px; display: block; }
        input[type=text], input[type=password], input[type=date], select, input[type=file] { width: 100%; padding: 10px; margin-top: 5px; border-radius: 8px; border: 1px solid #ccc; }
        button { margin-top: 15px; padding: 12px 25px; border: none; border-radius: 25px; background: linear-gradient(135deg,#ff7e5f,#feb47b); color: #fff; font-weight: bold; cursor: pointer; }
        .profile-img { width: 150px; height: 150px; border-radius: 12px; object-fit: cover; margin-bottom: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <h2>Edit Profile</h2>

            <asp:Image ID="imgProfile" runat="server" CssClass="profile-img" />

            <label>Profile Image</label>
            <asp:FileUpload ID="fuProfileImg" runat="server" />

            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server" />

            <label>Gender</label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>

            <label>Date of Birth</label>
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" />

            <label>Country</label>
            <asp:TextBox ID="txtCountry" runat="server" />

            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" />

            <h3>Change Password</h3>
            <label>New Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

            <button type="submit" runat="server" onserverclick="btnSave_Click">Save Changes</button>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
