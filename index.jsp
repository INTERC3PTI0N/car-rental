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
    <title>Home</title>
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
                    <li><a href="services.jsp" class="nav-link px-2 text-white">My Bookings</a></li>
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
    <div class="container col-xxl-8 px-4">
        <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
            <div class="col-10 col-sm-8 col-lg-6">
                <img src="assets/images/header.png" class="d-block mx-lg-auto img-fluid" alt="BMW" width="700"
                    height="500" loading="lazy">
            </div>
            <div class="col-lg-6">
                <h1 class="display-5 fw-bold lh-1 mb-3">Beyond the Ordinary</h1>
                <p class="lead"><strong>Discover CarLo: </strong>where luxury meets the open road. Indulge in elegance
                    with our curated fleet, ensuring every journey is a celebration of style and comfort. Welcome to a
                    new standard in premium car rentals. Welcome to CarLo.</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    <a type="button" href="inventory.jsp" class="btn btn-purple btn-lg px-4 me-md-2">Rent Now</a>
                </div>
            </div>
        </div>
    </div>

    <div class="container col-xxl-4 px-4 py-4">
        <div class="card" style="background: linear-gradient(77deg, rgba(239,93,174,1) 6%, rgba(109,95,181,1) 100%);">
        <form id="filterForm" method="GET" action="inventory.jsp">
            <div class="card-body">
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
                        <label style="color: #fff;">Drop Off Address</label>
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
                    <div class="col py-4">
                        <button type="submit" class="btn btn-outline-light btn-xl">Search Now</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <!-- Start Features Section -->
    <div class="container px-4 py-5">
        <h2 class="pb-2 border-bottom">How It Works</h2>

        <div class="row row-cols-1 row-cols-md-2 align-items-md-center g-5 py-5">
            <div class="col d-flex flex-column align-items-start gap-2">
                <h2 class="fw-bold text-body-emphasis">Pick Car, Drive Far</h2>
                <p class="text-body-secondary">With <strong>CarLo's</strong> easy to use interface, rent a car in no time. We provide
                    24/7 customer support to ensure you face no roadblocks in the process. We ensure to provide vehicles
                    that are in upmost conidtion and are completely road legal.</p>
            </div>

            <div class="col">
                <div class="row row-cols-1 row-cols-sm-2 g-4">
                    <div class="col d-flex flex-column gap-2">
                        <div
                            class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-4 rounded-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                <path
                                    d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                            </svg>
                        </div>
                        <h4 class="fw-semibold mb-0 text-body-emphasis">Choose Pickup Location</h4>
                        <p class="text-body-secondary">Choose a location of your preference to pickup the car.</p>
                    </div>

                    <div class="col d-flex flex-column gap-2">
                        <div
                            class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-success bg-gradient fs-4 rounded-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-calendar-date-fill" viewBox="0 0 16 16">
                                <path
                                    d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4zm5.402 9.746c.625 0 1.184-.484 1.184-1.18 0-.832-.527-1.23-1.16-1.23-.586 0-1.168.387-1.168 1.21 0 .817.543 1.2 1.144 1.2" />
                                <path
                                    d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2m-6.664-1.21c-1.11 0-1.656-.767-1.703-1.407h.683c.043.37.387.82 1.051.82.844 0 1.301-.848 1.305-2.164h-.027c-.153.414-.637.79-1.383.79-.852 0-1.676-.61-1.676-1.77 0-1.137.871-1.809 1.797-1.809 1.172 0 1.953.734 1.953 2.668 0 1.805-.742 2.871-2 2.871zm-2.89-5.435v5.332H5.77V8.079h-.012c-.29.156-.883.52-1.258.777V8.16a13 13 0 0 1 1.313-.805h.632z" />
                            </svg>
                        </div>
                        <h4 class="fw-semibold mb-0 text-body-emphasis">Choose Pickup Date</h4>
                        <p class="text-body-secondary">Clarify when you want to pickup the vehicle</p>
                    </div>

                    <div class="col d-flex flex-column gap-2">
                        <div
                            class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-danger bg-gradient fs-4 rounded-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                            </svg>
                        </div>
                        <h4 class="fw-semibold mb-0 text-body-emphasis">Search For Cars</h4>
                        <p class="text-body-secondary">Search For the various vehicles present in our inventory and
                            choose one that fits your needs.</p>
                    </div>

                    <div class="col d-flex flex-column gap-2">
                        <div
                            class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-purple bg-gradient fs-4 rounded-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-credit-card-fill" viewBox="0 0 16 16">
                                <path
                                    d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1" />
                            </svg>
                        </div>
                        <h4 class="fw-semibold mb-0 text-body-emphasis">Book And Pay</h4>
                        <p class="text-body-secondary">Easily Book and Pay using integrated solutions. (UPI,
                            Debit/Credit Card)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Features Section -->

    <!-- Start Footer Section -->
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
    <!-- End Footer Section -->

</body>

</html>