s<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Global_Kitchen.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - Register Page</title>
    <style>
        body, html{
            margin: 0;
            height: 100%;
            justify-content: center;
            align-items: flex-start;
        }

        .logo {
            margin-top: 20px;
            text-align: center;
        }

        .logo img{
            width: 370px;
            height: auto;
        }

        .tagline {
            margin: 40px auto; /* Control the position of text from the logo*/
            text-align: center;
            max-width: 650px;/* Limit width to avoid being too long */
            background: rgba(255,255,255,0.7);
            border-radius: 12px;
            padding: 20px 30px;
        }

        .tagline h1 {
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin: 0 0 10px;
            letter-spacing: 1px;
            text-transform: uppercase; /* Capital letters are more eye-catching and can be removed*/
            font-family: 'Georgia', serif; 
        }

        .tagline h2 {
            font-size: 18px;
            font-weight: 400;
            color: #555;
            margin: 0;
            line-height: 1.5;
            font-family: 'Arial', sans-serif;
        }

        .features {
            text-align: center;
            padding: 50px 20px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 16px;
            max-width: 1000px;
            margin: 40px auto;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            animation: fadeIn 1.2s ease-out;
        }

        .features h1 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #222;
        }

        .features .subtitle {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }

        .feature-cards {
            margin: 40px auto;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            width: 260px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: floatUp 1s ease forwards;
            opacity: 0;
        }

        .card img {
            width: 200px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        .card h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            font-size: 14px;
            color: #666;
            line-height: 1.4;
        }

        /* Dynamic effect */
        .card:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        /* Animation keyframes */
         @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
         }

         @keyframes floatUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
         }

         .card:nth-child(1) { animation-delay: 0.3s; }
         .card:nth-child(2) { animation-delay: 0.6s; }
         .card:nth-child(3) { animation-delay: 0.9s; }
        
        .regis-container {
            margin: 60px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            width: 320px;
            text-align: center;
        }

        .regis-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .regis-container p {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .regis-container a {
            color: #e67300;
            text-decoration: none;
            font-weight: bold;
        }

        .regis-container a:hover {
            text-decoration: underline;
        }

        .regis-container button {
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

        .regis-container button:hover {
            background: #cc6600;
        }

        .regis-container p {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .regis-container a {
            color: #e67300;
            text-decoration: none;
            font-weight: bold;
        }

        .regis-container a:hover {
            text-decoration: underline;
        }

        .gender-section{
            margin: 15px 0;
            text-align: left;
        }

        .gender-section label{
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .gender-option{
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            background: rgba(255,255,255,0.6);
            padding: 10px;
            border-radius: 10px;
            box-shadow: inset 0 1px 4px rgba(0,0,0,0.1);
        }

        .gender-option label{
            display: flex;
            align-items: center;
            gap: 6px;
            color: #333;
            font-size: 15px;
            cursor: pointer;
            transition: color 0.3s ease, transform 0.2s ease;
        }

        .gender-option input[type="radio"]{
            accent-color: #e67300;
            transform: scale(1.1);
            margin: 0;
            vertical-align: middle;
        }

        .gender-option label:hover{
            color: #e67300;
            transform: scale(1.05);
        }

        .birthday-section{
            text-align: left;
            margin: 15px 0;
        }

        .birthday-section label{
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .country-section{
            text-align: left;
            margin: 15px 0;
        }

        .country-section label{
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .country-section select{
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            background: rgba(255,255,255,0.8);
            color: #333;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img alt="Background"
                src="Image/Background.png"
                style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: -1;"/>

            <div class="logo">
                <img alt="Logo"
                     src="Image/Logo.png"/>
            </div>

            <div class="tagline">
                <h1>Learn about Western, Chinese, Japanese, and other cuisines.</h1>
                <h2>Create your profile and get cooking tutorials—all in one place.</h2>
            </div>

            <div class="feature-cards">
                <div class="card">
                    <img src="Image/Picture.png" alt="Personalized Learning" />
                    <h2>Personalized Learning</h2>
                    <p>Get course recommendations based on your tastes and cooking level.</p>
                </div>

                <div class="card">
                    <img src="Image/Picture2.png" alt="Save Favorites" style="width:130px; height:auto; display:block; margin:0 auto 10px;"/>
                    <h2>Save Favorites</h2>
                    <p>Save your favorite cooking tutorials and recipes for quick reference and easy access, creating your own delicious recipe list.</p>
                </div>

                <div class="card">
                    <img src="Image/Picture3.jpg" alt="Personal Tutorial" />
                    <h2>Add a Personal Tutorial</h2>
                    <p>Upload your signature dishes to the platform so more people can learn and appreciate your delicious creations.</p>
                 </div>
            </div>

            <div class="regis-container">
                <input type="text" placeholder="User Name" required/>
                <input type="email" placeholder="Email" required/>

                <!-- Gender -->
                <div class="gender-section">
                    <label>Gender:</label>
                    <div class="gender-option">
                        <label><input type="radio" name="gender" value="Male" required /> Male</label>
                        <label><input type="radio" name="gender" value="Female" /> Female</label>
                    </div>
                </div>

                <div class="birthday-section">
                    <label>Birthday:</label>
                    <input type="date" required />
                </div>

                <!-- Country -->
                <div class="country-section">
                    <label> Country: </label>
                    <select required>
                        <option value=""> Select Country </option>
                        <option value="Malaysia"> Malaysia </option>
                        <option value="Singapore"> Singapore </option>
                        <option value="Japan"> Japan </option>
                        <option value="German"> German </option>
                        <option value="Cina"> Cina </option>
                        <option value="Korea"> Korea </option>
                    </select>
                </div>

                <input type="password" placeholder="Password" required/>
                
                <button type="Create"> Create </button>
                <p> Go Back <a href="Index.aspx"> Home Page </a> or <a href="Login.aspx">Login Page</a></p>
            </div>
        </div>
    </form>
</body>
</html>
