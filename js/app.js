    // Get filter select elements
    const carTypeSelect = document.getElementById('carTypeFilter');
    const seatingCapacitySelect = document.getElementById('seatingCapacityFilter');
    const fuelTypeSelect = document.getElementById('fuelTypeFilter');
    const gearTypeSelect = document.getElementById('gearTypeFilter');

    // Add event listeners to filter select elements
    [carTypeSelect, seatingCapacitySelect, fuelTypeSelect, gearTypeSelect].forEach(select => {
        select.addEventListener('change', filterCards);
    });

    // Function to filter cards based on selected criteria
    function filterCards() {
        // Construct URL with selected filter criteria
        const url = 'inventory.jsp?carTypeFilter=' + carTypeSelect.value
                    + '&seatingCapacityFilter=' + seatingCapacitySelect.value
                    + '&fuelTypeFilter=' + fuelTypeSelect.value
                    + '&gearTypeFilter=' + gearTypeSelect.value;

        // Redirect to the constructed URL
        window.location.href = url;
    }

    function editFunction(BookingID, Status) {
        document.getElementsByName("BookingID")[0].value = BookingID;
        document.getElementsByName("Status")[0].value = Status;
      }

    function editCar(car_id, brand, model, car_type, colour, plate_number, price_per_day, rating, gear_type, location, num_seats, fuel_type) {
        document.getElementsByName("carID")[0].value = car_id;
        document.getElementsByName("brand")[0].value = brand;
        document.getElementsByName("model")[0].value = model;
        document.getElementsByName("colour")[0].value = colour;
        document.getElementsByName("plateNumber")[0].value = plate_number;
        document.getElementsByName("pricePerDay")[0].value = price_per_day;
        document.getElementsByName("rating")[0].value = rating;
        document.getElementsByName("gearType")[0].value = gear_type;
        document.getElementsByName("carType")[0].value = car_type;
        document.getElementsByName("location")[0].value = location;
        document.getElementsByName("numSeats")[0].value = num_seats;
        document.getElementsByName("fuelType")[0].value = fuel_type;
    }

    function deleteCar(car_id) {
        document.getElementsByName("carID")[0].value = car_id;
        if (confirm("Are you sure you want to delete this Car?")) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'jsp/app.jsp?action=deleteCar', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("Car deleted successfully.");
                    window.location.reload();
                } else {
                    alert("Failed to delete Car.");
                }
            };
            xhr.send('carID=' + encodeURIComponent(car_id)); // Change 'car_id' to 'carID'
        }
    }

    function deleteUser(user) {
        document.getElementsByName("User")[0].value = user;
        if (confirm("Are you sure you want to delete this User?")) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'jsp/app.jsp?action=deleteUser', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("User deleted successfully.");
                    window.location.reload();
                } else {
                    alert("Failed to delete User.");
                }
            };
            xhr.send('User=' + encodeURIComponent(user)); // Change 'car_id' to 'carID'
        }
    }
    