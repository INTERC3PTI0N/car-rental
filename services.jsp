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
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css"
        integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>My Bookings</title>
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
    <svg id="wave" style="transform:rotate(180deg); transition: 0.3s" viewBox="0 0 1440 150" version="1.1"
        xmlns="http://www.w3.org/2000/svg">
        <defs>
            <linearGradient id="sw-gradient-0" x1="0" x2="0" y1="1" y2="0">
                <stop stop-color="rgba(155, 93, 173, 1)" offset="0%"></stop>
                <stop stop-color="rgba(239, 93, 174, 1)" offset="100%"></stop>
            </linearGradient>
        </defs>
        <path style="transform:translate(0, 0px); opacity:1" fill="url(#sw-gradient-0)"
            d="M0,105L48,92.5C96,80,192,55,288,50C384,45,480,60,576,70C672,80,768,85,864,82.5C960,80,1056,70,1152,72.5C1248,75,1344,90,1440,80C1536,70,1632,35,1728,20C1824,5,1920,10,2016,15C2112,20,2208,25,2304,45C2400,65,2496,100,2592,112.5C2688,125,2784,115,2880,107.5C2976,100,3072,95,3168,80C3264,65,3360,40,3456,35C3552,30,3648,45,3744,45C3840,45,3936,30,4032,30C4128,30,4224,45,4320,62.5C4416,80,4512,100,4608,100C4704,100,4800,80,4896,62.5C4992,45,5088,30,5184,27.5C5280,25,5376,35,5472,50C5568,65,5664,85,5760,90C5856,95,5952,85,6048,87.5C6144,90,6240,105,6336,97.5C6432,90,6528,60,6624,55C6720,50,6816,70,6864,80L6912,90L6912,150L6864,150C6816,150,6720,150,6624,150C6528,150,6432,150,6336,150C6240,150,6144,150,6048,150C5952,150,5856,150,5760,150C5664,150,5568,150,5472,150C5376,150,5280,150,5184,150C5088,150,4992,150,4896,150C4800,150,4704,150,4608,150C4512,150,4416,150,4320,150C4224,150,4128,150,4032,150C3936,150,3840,150,3744,150C3648,150,3552,150,3456,150C3360,150,3264,150,3168,150C3072,150,2976,150,2880,150C2784,150,2688,150,2592,150C2496,150,2400,150,2304,150C2208,150,2112,150,2016,150C1920,150,1824,150,1728,150C1632,150,1536,150,1440,150C1344,150,1248,150,1152,150C1056,150,960,150,864,150C768,150,672,150,576,150C480,150,384,150,288,150C192,150,96,150,48,150L0,150Z">
        </path>
    </svg>
    <!-- End Header Section -->

    <!-- Start Hero Section -->
    <section>
        <div class="container-fluid">

                <main>
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>

                    <h2>My Bookings</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Booking ID</th>
                                    <th scope="col">Car Model</th>
                                    <th scope="col">Pickup Address</th>
                                    <th scope="col">Pickup Date</th>
                                    <th scope="col">Dropoff Date</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Payment Method</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                try {
                                    Statement statement = conn.createStatement();
                                    ResultSet resultSet = statement.executeQuery("SELECT * FROM booking");

                                    while (resultSet.next()) {
                                %>
                                <tr>
                                    <td><%= resultSet.getInt("booking_id") %></td>
                                    <td><%= resultSet.getString("model") %></td>
                                    <td><%= resultSet.getString("address") %></td>
                                    <td><%= resultSet.getString("pickup_date") %></td>
                                    <td><%= resultSet.getString("return_date") %></td>
                                    <td><%= resultSet.getString("status") %></td>
                                    <td><%= resultSet.getString("payment_method") %></td>
                                </tr>
                                <% 
                                    }
                                    resultSet.close();
                                    statement.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </main>
        </div>
    </section>
    <!-- End Hero Section -->
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