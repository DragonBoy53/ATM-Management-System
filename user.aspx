<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>User - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .button {
            width: 200px;
            padding: 10px;
            margin: 10px; /* Adjusted to only vertical margin */
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

        .bottom-right {
            position: absolute;
            bottom: 0;
            right: 0;
        }

        h1 {
            margin-bottom: 20px; /* Add some space below the heading */
            text-align: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <section>
        <h2>Welcome User!</h2>
        <a href="Account Information.html" class="button">View Account Information</a>
        <a href="Withdraw.html" class="button">Withdraw</a>
        <a href="Deposit.html" class="button">Deposit</a>
        <a href="Transfer.html" class="button">Transfer</a>
    </section>
    <div class="bottom-right">
        <a href="login.html">
            <button class="button">Logout</button>
        </a>
    </div>
</body>
</html>