<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%                             
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental","root","");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Inventory</title>
</head>

<body>
    <!-- Start Header Section -->
    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="assets/images/web.svg" height="50">
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="index.jsp" class="nav-link px-2 text-white">Home</a></li>
                    <li><a href="blog.jsp" class="nav-link px-2 text-white">Blog</a></li>
                    <li><a href="inventory.jsp" class="nav-link px-2 text-white">Inventory</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Services</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Support</a></li>
                </ul>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control form-control-dark text-bg-light" placeholder="Search..."
                        aria-label="Search">
                </form>

                <div class="text-end">
                    <a type="button" href="login.html" class="btn btn-outline-purple">Login</a>
                </div>
            </div>
        </div>
    </header>
    <!-- End Header Section -->

    <!-- Start Hero Section -->
    <section class="text-center container">
        <div class="row py-2">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Inventory</h1>
                <p class="lead text-body-secondary">View Our Premier Fleet of Featured Vehicles</p>
            </div>
        </div>
    </section>
    <!-- End Hero Section -->
    <div class="container col-xxl-4 px-4 py-4">
        <div class="card" style="background: linear-gradient(77deg, rgba(239,93,174,1) 6%, rgba(109,95,181,1) 100%);">
            <div class="card-body">
                <form id="filterForm" method="GET" action="inventory.jsp">
                <div class="row">
                    <div class="col">
                        <label style="color: #fff;">Pickup Location</label>
                        <select class="form-select" aria-label="" name="locationTypeFilter">
                            <option selected value="">Any</option>
                            <option value="Mangalore">Mangalore</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Bangalore">Bangalore</option>
                        </select>
                    </div>
                    <div class="col">
                        <label style="color: #fff;">Drop Off Location</label>
                        <select class="form-select" aria-label="">
                            <option selected hidden>Choose City</option>
                            <option value="Mangalore">Mangalore</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Bangalore">Bangalore</option>
                        </select>
                    </div>
                    <div class="col">
                        <label style="color: #fff;">Pickup Date</label>
                        <input type="date" class="form-control" placeholder="Last name" aria-label="Last name">
                    </div>
                    <div class="col">
                        <label style="color: #fff;">Drop Off Date</label>
                        <input type="date" class="form-control" placeholder="Last name" aria-label="Last name">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container col-xxl-4 px-4 py-4">
        <div class="card" style="background: linear-gradient(77deg,  rgba(109,95,181,1) 6%, rgba(239,93,174,1) 100%);">
            <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <label style="color: #fff;">Car Type</label>
                            <select class="form-select" name="carTypeFilter">
                                <option value="">All</option>
                                <option value="SUV">SUV</option>
                                <option value="MPV">MPV</option>
                                <option value="Hatchback">Hatchback</option>
                                <option value="Sports">Sports</option>
                                <option value="Sedan">Sedan</option>
                            </select>
                        </div>
                        <div class="col">
                            <label style="color: #fff;">Seating Capacity</label>
                            <select class="form-select" name="seatingCapacityFilter">
                                <option value="">All</option>
                                <option value="2">2</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                            </select>
                        </div>
                        <div class="col">
                            <label style="color: #fff;">Fuel Type</label>
                            <select class="form-select" name="fuelTypeFilter">
                                <option value="">All</option>
                                <option value="Petrol">Petrol</option>
                                <option value="Diesel">Diesel</option>
                            </select>
                        </div>
                        <div class="col">
                            <label style="color: #fff;">Gear Type</label>
                            <select class="form-select" name="gearTypeFilter">
                                <option value="">All</option>
                                <option value="Manual">Manual</option>
                                <option value="Automatic">Automatic</option>
                            </select>
                        </div>
                        <div class="col py-4">
                            <button type="submit" class="btn btn-outline-light btn-xl">Apply Filters</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="album bg-light">
        <div class="container">
            <div id="carCardsContainer" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    String locationTypeFilter = request.getParameter("locationTypeFilter");
                    String carTypeFilter = request.getParameter("carTypeFilter");
                    String seatingCapacityFilter = request.getParameter("seatingCapacityFilter");
                    String fuelTypeFilter = request.getParameter("fuelTypeFilter");
                    String gearTypeFilter = request.getParameter("gearTypeFilter");

                    try {
                        String sql = "SELECT car_id, brand, model, price_per_day, car_type, num_seats, fuel_type, gear_type, rating, location, photo " +
                 "FROM car " +
                 "WHERE car_id NOT IN ( " +
                 "    SELECT car_id " +
                 "    FROM booking " +
                 "    WHERE status = 'booked' " +
                 ")";
                        if (locationTypeFilter != null && !locationTypeFilter.isEmpty()) {
                            sql += " AND location = '" + locationTypeFilter + "'";
                        }
                        if (carTypeFilter != null && !carTypeFilter.isEmpty()) {
                            sql += " AND car_type = '" + carTypeFilter + "'";
                        }
                        if (seatingCapacityFilter != null && !seatingCapacityFilter.isEmpty()) {
                            sql += " AND num_seats = '" + seatingCapacityFilter + "'";
                        }
                        if (fuelTypeFilter != null && !fuelTypeFilter.isEmpty()) {
                            sql += " AND fuel_type = '" + fuelTypeFilter + "'";
                        }
                        if (gearTypeFilter != null && !gearTypeFilter.isEmpty()) {
                            sql += " AND gear_type = '" + gearTypeFilter + "'";
                        }

                        // Execute SQL query
                        Statement statement = conn.createStatement();
                        ResultSet rs = statement.executeQuery(sql);

                        // Iterate through the filtered results and display cards
                        while (rs.next()) {
                            // Retrieve data for each card
                            String car_id = rs.getString("car_id");
                            String brand = rs.getString("brand");
                            String model = rs.getString("model");
                            String car_type = rs.getString("car_type");
                            String num_seats = rs.getString("num_seats");
                            String fuel_type = rs.getString("fuel_type");
                            String gear_type = rs.getString("gear_type");
                            String photo = rs.getString("photo");
                            String price_per_day = rs.getString("price_per_day");
                            String rating = rs.getString("rating");

                            // Display card HTML
                %>
                            <div class="col">
                                <div class="card shadow-sm">
                                    <img height="200" src="assets/images/cars/<%= photo %>">

                                    <div class="card-body">
                                        <p class="card-text" style="font-weight:bold;"><%= brand %> - <%= model %></p>
                                        <label>Car Type:</label>
                                        <p class="card-text" style="font-weight:bold;"><%= car_type %></p>
                                        <label>Seating Capacity:</label>
                                        <p class="card-text" style="font-weight:bold;"><%= num_seats %></p>
                                        <label>Fuel Type:</label>
                                        <p class="card-text" style="font-weight:bold;"><%= fuel_type %></p>
                                        <label>Transmission:</label>
                                        <p class="card-text" style="font-weight:bold;"><%= gear_type %></p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-success disabled">₹<%= price_per_day %>/Day</button>
                                                <a type="button" href="detail.jsp?car=<%= car_id %>" class="btn btn-purple">View</a>
                                            </div>
                                            <i class="bi bi-star-fill"> <%= rating %></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                <%
                        }
                        rs.close();
                        statement.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </div>
        </div>
    </div>
    <img src="assets/images/footer.svg">
    <div class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
            <p class="col-md-4 mb-0 text-muted">© 2024 CarLo</p>

            <a href="/"
                class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                <img src="assets/images/web.svg" height="50px">
            </a>

            <ul class="nav col-md-4 justify-content-end">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About Us</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Inventory</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Services</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Support</a></li>

            </ul>
        </footer>
    </div>



    <script src="js/app.js"></script>
</body>

</html>