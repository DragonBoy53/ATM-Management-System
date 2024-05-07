<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="out_of_service.aspx.cs" Inherits="ATM_Machine.out_of_status" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    h1 {
        margin-bottom: 20px;
        text-align:left;
        color:tomato;
    }
    h3 {
        margin-bottom: 20px;
        text-align:left;
        color:black;
    }
    .button {
        width: 200px;
        padding: 10px;
        margin: 10px ; /
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
        background-color: #007bff;
        color: #fff;
        border: 1px solid #007bff;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        text-align: center;
        display: block;
    }
    .button:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    </style>
</head>
<body>
    <section>
        <h1>Out of Service</h1>
        <h3>The ATM cannot process transactions at the moment. Sorry for the inconvenience.</h3>
        <a href="user.aspx" class="button">Proceed to Home</a>
    </section>
</body>
</html>
