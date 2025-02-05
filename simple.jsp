<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <h2>Simple Calculator</h2>
    <form method="post">
        Enter First Number: <input type="text" name="num1" required><br><br>
        Enter Second Number: <input type="text" name="num2" required><br><br>
        
        Select Operation: 
        <select name="operation">
            <option value="add">Addition (+)</option>
            <option value="subtract">Subtraction (-)</option>
            <option value="multiply">Multiplication (*)</option>
            <option value="divide">Division (/)</option>
        </select>
        <br><br>
        
        <input type="submit" value="Calculate">
    </form>

    <h3>Result:</h3>
    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            try {
                double num1 = Double.parseDouble(request.getParameter("num1"));
                double num2 = Double.parseDouble(request.getParameter("num2"));
                String operation = request.getParameter("operation");
                double result = 0;

                switch (operation) {
                    case "add":
                        result = num1 + num2;
                        break;
                    case "subtract":
                        result = num1 - num2;
                        break;
                    case "multiply":
                        result = num1 * num2;
                        break;
                    case "divide":
                        if (num2 != 0) {
                            result = num1 / num2;
                        } else {
                            out.println("<p style='color:red;'>Error: Cannot divide by zero.</p>");
                            return;
                        }
                        break;
                    default:
                        out.println("<p style='color:red;'>Invalid operation</p>");
                        return;
                }

                out.println("<p>The result is: <strong>" + result + "</strong></p>");
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Error: Please enter valid numbers.</p>");
            }
        }
    %>
</body>
</html>
