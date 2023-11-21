# Alelo iOS Developer Test - Demo Project

This repository contains an iOS application developed for the Alelo iOS Developer Test. The app allows users to list and filter products, view detailed information about each product, and perform actions such as adding and removing items from the shopping cart.

## Key Features

### 1. Product Listing and Filtering
- Users can browse a comprehensive list of available products.
- Filters are available to streamline searches based on specific categories or other criteria.

### 2. Product Details
- Selecting a product from the list provides users with additional details, including descriptions, prices, and other relevant information.

### 3. Shopping Cart
- Users can easily add products to their shopping cart.
- The cart dynamically updates to display the quantity of each product and the overall total cost.
- Removing items from the cart is a seamless process.

## Technologies Used

- **Swift and SwiftUI:** The application is built using Swift, a powerful and intuitive programming language, along with SwiftUI for the user interface.

## How to Run the Project

1. Clone this repository: `git clone https://github.com/renatonasc/alelo-products.git`
2. Open the project in Xcode.
3. Ensure you are using a compatible version of Xcode, and that all dependencies are installed.
4. Run the app on an iOS simulator or device.

## Running the Go Server

In addition to the iOS app, a Go server is provided to support the application's backend. To run the server, navigate to the `alelo-server` folder in the terminal and execute the following command:

```bash
go run server.go
```

## Using ServiceMocked in Repository

The project offers the option to use `ServiceMocked` in the repository to avoid making calls to the web server. This can be particularly useful during development and testing phases.

## Contributions

Contributions are welcomed! If you encounter issues, have suggestions for improvements, or wish to add new features, please feel free to open issues or submit pull requests.

## Contact

For questions or additional information, please reach out to us at [renato@renatonascimento.com](mailto:renato@renatonascimento.com).

---

**Note:** This project is a fictional implementation created solely for the Alelo iOS Developer Test and does not represent a fully functional production application.
