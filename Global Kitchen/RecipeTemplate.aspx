<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecipeTemplate.aspx.cs" Inherits="Global_Kitchen.RecipeTemplate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%: RecipeTitle %> | Global Kitchen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        /* --- Reset --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #fafafa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .recipe-container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .recipe-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .recipe-header h1 {
            font-size: 2rem;
            color: #2c3e50;
        }

        .recipe-header img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 12px;
            margin-top: 20px;
        }

        .section {
            margin-top: 30px;
        }

        .section h2 {
            font-size: 1.4rem;
            color: #d35400;
            margin-bottom: 10px;
            border-bottom: 2px solid #d35400;
            display: inline-block;
            padding-bottom: 4px;
        }

        .ingredients ul {
            list-style-type: square;
            margin-left: 20px;
        }

        .ingredients li, .steps li {
            margin-bottom: 8px;
        }

        .steps ol {
            margin-left: 20px;
        }

        .description {
            font-size: 1rem;
            margin-top: 10px;
            color: #555;
        }

        .footer {
            text-align: center;
            font-size: 0.9rem;
            color: #888;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="recipe-container">
            <div class="recipe-header">
                <h1><%: RecipeTitle %></h1>
                <img src="<%: RecipeImage %>" alt="<%: RecipeTitle %>" />
            </div>

            <div class="section description">
                <p><%: RecipeDescription %></p>
            </div>

            <div class="section ingredients">
                <h2>Ingredients</h2>
                <ul>
                    <% foreach (var ingredient in Ingredients) { %>
                        <li><%: ingredient %></li>
                    <% } %>
                </ul>
            </div>

            <div class="section steps">
                <h2>Steps</h2>
                <ol>
                    <% foreach (var step in Steps) { %>
                        <li><%: step %></li>
                    <% } %>
                </ol>
            </div>

            <div class="footer">
                <p>© 2025 Global Kitchen. All Rights Reserved.</p>
            </div>
        </div>
    </form>
</body>
</html>
