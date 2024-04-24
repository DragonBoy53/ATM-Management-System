

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            margin: 30px; /* Adjusted to only vertical margin */
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

        h1 {
            margin-bottom: 20px; /* Add some space below the heading */
            text-align: center;
            align-items: center;
        }

        .button:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <section>
        <h1> Welcome Admin#  </h1>
        <a href="view.html" class="button">View Users</a>
        <a href="addition.html" class="button">Add User</a>
        <a href="removal.html" class="button">Remove User</a>
    </section>
</body>
</html>