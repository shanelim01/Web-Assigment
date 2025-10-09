<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Global_Kitchen.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <style>
        body, html {
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: Arial, sans-serif;
        }

        /* === Admin Overview === */
        .admin-section {
            margin: 50px auto;
            max-width: 1200px;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 30px 40px;
        }

        .admin-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .admin-header h1 {
            font-size: 32px;
            color: #333;
            margin-bottom: 8px;
        }

        .admin-header p {
            color: #666;
        }

        /* === Panels Container === */
        .admin-panels {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
        }

        .panel {
            flex: 1;
            min-width: 350px;
            background: rgba(255,255,255,0.95);
            border-radius: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 25px;
            transition: transform 0.2s ease;
        }

        .panel:hover {
            transform: translateY(-4px);
        }

        .panel h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* === Pending Recipes === */
        .pending-recipe {
            background: #fff8ee;
            border-radius: 12px;
            padding: 12px;
            margin-bottom: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        }

        .pending-recipe h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .pending-recipe p {
            margin: 6px 0;
            color: #777;
        }

        .approve-button, .reject-button {
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            margin-right: 10px;
            font-weight: bold;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .approve-button {
            background: linear-gradient(135deg, #4caf50, #81c784);
            color: white;
        }

        .reject-button {
            background: linear-gradient(135deg, #e53935, #ef5350);
            color: white;
        }

        .approve-button:hover, .reject-button:hover {
            transform: scale(1.05);
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
        }

        /* === Popular Category Panel === */
        .chart-box {
            text-align: center;
            background: rgba(255,255,255,0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: inset 0 1px 6px rgba(0,0,0,0.1);
        }

        .chart-box p {
            color: #555;
            margin: 6px 0;
        }

        /* === Advertisement Panel === */
        .ad-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
        }

        .ad-form input,
        .ad-form textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            background: rgba(255,255,255,0.95);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .ad-form input:focus,
        .ad-form textarea:focus {
            outline: none;
            border-color: #e67300;
            box-shadow: 0 0 6px rgba(230,115,0,0.3);
        }

        .ad-form textarea {
            min-height: 120px;
            resize: vertical;
        }

        .ad-form button {
            margin-top: 10px;
            align-self: center;
            padding: 12px 50px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #ff9800, #ffc107);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .ad-form button:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="admin-section">
            <div class="admin-header">
                <h1>Welcome, Admin!</h1>
                <h1> Johan Welson </h1>
                <p>Here you can review user submissions, view statistics, and post advertisements.</p>
            </div>

            <div class="admin-panels">
                <!-- Panel 1: Approve Recipes -->
                <div class="panel">
                    <h2>Pending Recipes</h2>

                    <div class="pending-recipe">
                        <h3>Spicy Ramen</h3>
                        <p>By: @Hana | Uploaded: 7 Oct 2025</p>
                        <button class="approve-button">Approve</button>
                        <button class="reject-button">Reject</button>
                    </div>

                    <div class="pending-recipe">
                        <h3>Garlic Butter Shrimp</h3>
                        <p>By: @Luca | Uploaded: 6 Oct 2025</p>
                        <button class="approve-button">Approve</button>
                        <button class="reject-button">Reject</button>
                    </div>
                </div>

                <!-- Panel 2: Popular Categories -->
                <div class="panel">
                    <h2>Most Popular Recipe Type</h2>
                    <div class="chart-box">
                        <p>#1 🍝 Italian Cuisine — 345 Likes</p>
                        <p>#2 🍜 Asian Cuisine — 289 Likes</p>
                        <p>#3 🥗 Healthy Meals — 203 Likes</p>
                    </div>
                </div>

                <!-- Panel 3: Advertisement -->
                <div class="panel">
                    <h2>Post Advertisement</h2>
                    <div class="ad-form">
                        <input type="text" placeholder="Ad Title (e.g., New Cooking Challenge)" required />
                        <textarea placeholder="Write your announcement or promotional content..." required></textarea>
                        <button type="submit">Publish Ad</button>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
