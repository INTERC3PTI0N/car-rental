<%@ page import="java.sql.*" %>
<html>
<head>
    <script>
        function showAlert(message) {
            alert(message);
            window.location.href = "../index.jsp";
        }
    </script>

    <script>
        function adminAlert(message) {
            alert(message);
            window.location.href = "../portal.jsp";
        }
    </script>
</head>
<body>
<%
String action = request.getParameter("action");

if (action != null && action.equals("register")) {
    String FirstName = request.getParameter("FirstName");
    String LastName = request.getParameter("LastName");
    String Email = request.getParameter("Email");
    String Username = request.getParameter("Username");
    String Password = request.getParameter("Password");
    String Phone = request.getParameter("Phone");
    String DateOfBirth = request.getParameter("DateOfBirth");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

        PreparedStatement psCheck = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE Username=?");
        psCheck.setString(1, Username);
        ResultSet rs = psCheck.executeQuery();

        if(rs.next()) {
            out.println("<script>showAlert('User already exists. Please choose a different username.');</script>");
        } else {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO CUSTOMER (FirstName, LastName, Email, Username, Password, Phone, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, Email);
            ps.setString(4, Username);
            ps.setString(5, Password);
            ps.setString(6, Phone);
            ps.setString(7, DateOfBirth);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<script>showAlert('Registration Successful!');</script>");
            } else {
                out.println("<script>showAlert('Registration Failed');</script>");
            }
        }

    } catch (Exception e) {
        out.println("<script>showAlert('An error occurred during registration. Please try again later.');</script>");
    }
} else if (action != null && action.equals("login")) {
    String Username = request.getParameter("Username");
    String Password = request.getParameter("Password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM CUSTOMER WHERE Username=? AND Password=?");
        ps.setString(1, Username);
        ps.setString(2, Password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("Username", Username);
            session.setAttribute("customer_id", rs.getString("customer_id"));

            response.sendRedirect("../index.jsp");
        } else {
            out.println("<script>showAlert('Login Failed. Please check your username and password.');</script>");
        }

    } catch (Exception e) {
        out.println(e);
    }


} else if (action != null && action.equals("admin")) {
    String Username = request.getParameter("Username");
    String Password = request.getParameter("Password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

        PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE username=? AND password_hash=?");
        ps.setString(1, Username);
        ps.setString(2, Password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("Admin", Username);

            response.sendRedirect("../portal.jsp");
        } else {
            out.println("<script>showAlert('Admin Login Failed');</script>");
        }

    } catch (Exception e) {
        out.println(e);
    }


} else if (action != null && action.equals("checkout")) {
    String Username = (String) session.getAttribute("Username");
    String car_id = request.getParameter("crid");
    String model = request.getParameter("model");
    String customer_id = (String) session.getAttribute("customer_id");
    String address = request.getParameter("address");
    String pickup_date = request.getParameter("pickup_date");
    String return_date = request.getParameter("return_date");
    String total_cost = request.getParameter("total_cost");
    String payment = request.getParameter("payment");

    if (address != null && pickup_date != null && return_date != null && payment != null)  {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

            String insertSql = "INSERT INTO booking (car_id, customer_id, Username, pickup_date, return_date, status, total_cost, payment_method, address, model) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertSql);
            pstmt.setString(1, car_id);
            pstmt.setString(2, customer_id);
            pstmt.setString(3, Username);
            pstmt.setString(4, pickup_date);
            pstmt.setString(5, return_date);
            pstmt.setString(6, "Booked");
            pstmt.setString(7, total_cost);
            pstmt.setString(8, payment);
            pstmt.setString(9, address);
            pstmt.setString(10, model);

            int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<script>showAlert('Vehicle Booked');</script>");
                } else {
                    out.println("<script>showAlert('Failed to Book Vehicle');</script>");
                }
                pstmt.close();
        } catch (SQLException e) {
            out.println("<script>showAlert('Please Login Before Checking Out');</script>");
        }
    }
} else if (action != null && action.equals("addCar")) {
    String carID = request.getParameter("carID");
    String brand = request.getParameter("brand");
    String model = request.getParameter("model");
    String colour = request.getParameter("colour");
    String plateNumber = request.getParameter("plateNumber");
    String pricePerDay = request.getParameter("pricePerDay");
    String rating = request.getParameter("rating");
    String gearType = request.getParameter("gearType");
    String carType = request.getParameter("carType");
    String location = request.getParameter("location");
    String numSeats = request.getParameter("numSeats");
    String fuelType = request.getParameter("fuelType");
    String photo = request.getParameter("photo");

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");

        if (carID != null && !carID.isEmpty()) {
            // Update existing entry
            PreparedStatement ps = conn.prepareStatement("UPDATE car SET brand=?, model=?, colour=?, photo=?, plate_number=?, price_per_day=?, rating=?, location=?, gear_type=?, num_seats=?, car_type=?, fuel_type=? WHERE car_id=?");
            ps.setString(1, brand);
            ps.setString(2, model);
            ps.setString(3, colour);
            ps.setString(4, photo);
            ps.setString(5, plateNumber);
            ps.setString(6, pricePerDay);
            ps.setString(7, rating);
            ps.setString(8, location);
            ps.setString(9, gearType);
            ps.setString(10, numSeats);
            ps.setString(11, carType);
            ps.setString(12, fuelType);
            ps.setString(13, carID);
            int rowsAffected = ps.executeUpdate();
            ps.close();

            if (rowsAffected > 0) {
                out.println("<script>adminAlert('Vehicle Updated!');</script>");
            } else {
                out.println("<script>adminAlert('Vehicle Update Failed');</script>");
            }
        } else {
            // Insert new entry
            PreparedStatement ps = conn.prepareStatement("INSERT INTO car (brand, model, colour, photo, plate_number, price_per_day, rating, location, gear_type, num_seats, car_type, fuel_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, brand);
            ps.setString(2, model);
            ps.setString(3, colour);
            ps.setString(4, photo);
            ps.setString(5, plateNumber);
            ps.setString(6, pricePerDay);
            ps.setString(7, rating);
            ps.setString(8, location);
            ps.setString(9, gearType);
            ps.setString(10, numSeats);
            ps.setString(11, carType);
            ps.setString(12, fuelType);
            int rowsAffected = ps.executeUpdate();
            ps.close();

            if (rowsAffected > 0) {
                out.println("<script>adminAlert('Vehicle Added!');</script>");
            } else {
                out.println("<script>adminAlert('Vehicle Adding Failed');</script>");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>adminAlert('An error occurred during Adding/Updating car. Please try again later.');</script>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>adminAlert('Database driver not found.');</script>");
    }
} else if (action != null && action.equals("editBooking")) {
    String BookingID = request.getParameter("BookingID");
    String Status = request.getParameter("Status");

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");

        // Prepare the SQL statement
        PreparedStatement ps = conn.prepareStatement("UPDATE booking SET status = ? WHERE booking_id = ?");

        // Set parameters for the SQL statement
        ps.setString(1, Status);
        ps.setString(2, BookingID);

        // Execute the SQL statement
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>adminAlert('Booking Updated!');</script>");
        } else {
            out.println("<script>adminAlert('Booking Update Failed');</script>");
        }
        ps.close();

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>adminAlert('An error occurred during updating booking. Please try again later.');</script>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>adminAlert('Database driver not found.');</script>");
    }
} else if (action != null && action.equals("deleteCar")) {

    String car_id = request.getParameter("carID");

    if (car_id != null && !car_id.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

            String deleteSql = "DELETE FROM car WHERE car_id=?";
            PreparedStatement pstmt = conn.prepareStatement(deleteSql);
            pstmt.setString(1, car_id);

            int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    out.println("<script>adminAlert('Car Deleted');</script>");
                } else {
                    out.println("<script>adminAlert('Failed to delete Car');</script>");
                }

            pstmt.close();
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
} else if (action != null && action.equals("deleteUser")) {

    String User = request.getParameter("User");

    if (User != null && !User.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");

            String deleteSql = "DELETE FROM customer WHERE customer_id=?";
            PreparedStatement pstmt = conn.prepareStatement(deleteSql);
            pstmt.setString(1, User);

            int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    out.println("<script>adminAlert('User Deleted');</script>");
                } else {
                    out.println("<script>adminAlert('Failed to delete User');</script>");
                }

            pstmt.close();
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}

%>



%>
</body>
</html>