<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Global_Kitchen.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - Login</title>

    <style>
    body, html{
        margin: 0;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: flex-end;
    }

    .container {
        display: flex;
        justify-content: center; /* Horizontal center */
        align-items: flex-end; /* Vertical bottom alignment */
        height: 100%;
        padding-bottom: 200px; /* Adjust the height from the bottom */
        position: relative;
        z-index: 1; /* Make sure it is above the background image */
    }

    .login-container {
        background: white;
        padding: 40px 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        width: 320px;
        text-align: center;
        transform: translateY(-120px); 
    }

    .login-container input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .login-container p {
        margin-top: 15px;
        font-size: 14px;
        color: #555;
    }

    .login-container a {
        color: #e67300;
        text-decoration: none;
        font-weight: bold;
    }

    .login-container a:hover {
        text-decoration: underline;
    }

    .login-container button {
        padding: 15px 40px;
        font-size: 20px;
        font-family: Arial, sans-serif;
        color: white;
        background: linear-gradient(135deg, #ff7e5f, #feb47b);
        border: none;
        border-radius: 30px;
        cursor: pointer;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .login-container button:hover {
        background: #cc6600;
    }

    .login-container p {
        margin-top: 15px;
        font-size: 14px;
        color: #555;
    }

    .login-container a {
        color: #e67300;
        text-decoration: none;
        font-weight: bold;
    }

    .login-container a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img alt="Background" 
                src="Image/Login Page.png" 
                style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: -1;"/>

            <div class="login-container">
                <input type="text" placeholder="User Name" required/>
                <input type="password" placeholder="Password" required/>

                <button type="submit"> Login </button>
                <p> Don't Have Account? <a href="Register.aspx"> Register Here </a></p>
                <p> Continue Browsing <a href="Index.aspx"> Home Page Here </a></p>
            </div>
        </div>
    </form>
</body>
</html>
