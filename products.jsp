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
    <title>User Portal</title>
</head>

<body>
    <!-- Start Header Section -->
    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="#" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="assets/images/web.svg" height="50">
                </a>
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
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="position-sticky pt-3 sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="portal.jsp">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-file align-text-bottom"
                                        aria-hidden="true">
                                        <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                        <polyline points="13 2 13 9 20 9"></polyline>
                                    </svg>
                                    Bookings
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="products.jsp">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-shopping-cart align-text-bottom"
                                        aria-hidden="true">
                                        <circle cx="9" cy="21" r="1"></circle>
                                        <circle cx="20" cy="21" r="1"></circle>
                                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                        </path>
                                    </svg>
                                    Vehicle Manager
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="customer.jsp">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-users align-text-bottom"
                                        aria-hidden="true">
                                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="9" cy="7" r="4"></circle>
                                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                    </svg>
                                    Customers
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="chartjs-size-monitor">
                        <div class="chartjs-size-monitor-expand">
                            <div class=""></div>
                        </div>
                        <div class="chartjs-size-monitor-shrink">
                            <div class=""></div>
                        </div>
                    </div>


                    <h2>Vehicle Management</h2>
                    <form action="jsp/app.jsp?action=addCar" method="post">
                        <div class="form-group">
                            <input type="text" hidden class="form-control" id="carID" name="carID">
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand</label>
                            <select class="form-control" id="brand" name="brand">
                                <option value="Toyota">Toyota</option>
                                <option value="Suzuki">Suzuki</option>
                                <option value="Renault">Renault</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="model">Model</label>
                            <input type="text" class="form-control" id="model" name="model">
                        </div>
                        <div class="form-group">
                            <label for="colour">Colour</label>
                            <input type="text" class="form-control" id="colour" name="colour">
                        </div>
                        <div class="form-group">
                            <label for="photo">Photo</label>
                            <input type="file" class="form-control" id="photo" name="photo">
                        </div>
                        <div class="form-group">
                            <label for="plateNumber">Plate Number</label>
                            <input type="text" class="form-control" id="plateNumber" name="plateNumber">
                        </div>
                        <div class="form-group">
                            <label for="pricePerDay">Price Per Day</label>
                            <input type="text" class="form-control" id="pricePerDay" name="pricePerDay">
                        </div>
                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <input type="text" class="form-control" id="rating" name="rating">
                        </div>
                        <div class="form-group">
                            <label for="gearType">Gear Type</label>
                            <select class="form-control" id="gearType" name="gearType">
                                <option value="Automatic">Automatic</option>
                                <option value="Manual">Manual</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="carType">Car Body Type</label>
                            <select class="form-control" id="carType" name="carType">
                                <option value="SUV">SUV</option>
                                <option value="MPV">MPV</option>
                                <option value="Hatchback">Hatchback</option>
                                <option value="Sports">Sports</option>
                                <option value="Sedan">Sedan</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="location">Location</label>
                            <select class="form-control" id="location" name="location">
                                <option value="Mangalore">Mangalore</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Bangalore">Bangalore</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="numSeats">Number of Seats</label>
                            <input type="text" class="form-control" id="numSeats" name="numSeats">
                        </div>
                        <div class="form-group">
                            <label for="fuelType">Fuel Type</label>
                            <select class="form-control" id="fuelType" name="fuelType">
                                <option value="Petrol">Petrol</option>
                                <option value="Diesel">Diesel</option>
                            </select>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-purple">Submit</button>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Car ID</th>
                                    <th scope="col">Brand</th>
                                    <th scope="col">Model</th>
                                    <th scope="col">Body Type</th>
                                    <th scope="col">Colour</th>
                                    <th scope="col">Plate Number</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Rating</th>
                                    <th scope="col">Gear</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Seating</th>
                                    <th scope="col">Fuel</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                try {
                                    String sql = "SELECT car_id, brand, model, colour, plate_number, price_per_day, rating, gear_type, location, num_seats, fuel_type, car_type FROM Car";
                                    Statement statement = conn.createStatement();
                                    ResultSet rs = statement.executeQuery(sql);


                                    while (rs.next()) {
                                        String car_id = rs.getString("car_id");
                                        String brand = rs.getString("brand");
                                        String model = rs.getString("model");
                                        String car_type = rs.getString("car_type");
                                        String colour = rs.getString("colour");
                                        String plate_number = rs.getString("plate_number");
                                        String price_per_day = rs.getString("price_per_day");
                                        String rating = rs.getString("rating");
                                        String gear_type = rs.getString("gear_type");
                                        String location = rs.getString("location");
                                        String num_seats = rs.getString("num_seats");
                                        String fuel_type = rs.getString("fuel_type");
                                %>
                                    <tr>
                                        <td><%= car_id %></td>
                                        <td><%= brand %></td>
                                        <td><%= model %></td>
                                        <td><%= car_type %></td>
                                        <td><%= colour %></td>
                                        <td><%= plate_number %></td>
                                        <td><%= price_per_day %></td>
                                        <td><%= rating %></td>
                                        <td><%= gear_type %></td>
                                        <td><%= location %></td>
                                        <td><%= num_seats %></td>
                                        <td><%= fuel_type %></td>
                                        <td>
                                        <div>
                                            <button class="btn btn-outline-primary" onclick="editCar('<%= car_id %>', '<%= brand %>', '<%= model %>', '<%= car_type %>', '<%= colour %>', '<%= plate_number %>', '<%= price_per_day %>', '<%= rating %>', '<%= gear_type %>', '<%= location %>', '<%= num_seats %>', '<%= fuel_type %>')">Edit</button>
                                            <button class="btn btn-danger" onclick="deleteCar('<%= car_id %>')">Delete</button>
                                        </div>
                                        </td>
                                    </tr>

                                <% 
                                    }
                                    rs.close();
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