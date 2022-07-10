SYSTEM REQUIREMENTS 

•	NETBEANS
•	XAMPP
•	MYSQL

In this project we have used netbeans 12.5 version for coding. Xampp and Mysql server is used for creating database for the project, which stores all the data.


LANGUAGES WE HAVE USED

The project consists with the designing part where html, css and bootstrap are used as frontend languages. The main part is the backend, which contains jsp, servlet and jdbc languages. Overall, the most highlighted part in project is  JAVA technology with its different types .



DATABASE QUERIES OF THE PROJECT

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `id` int(11) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `web_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phoneno` bigint(20) NOT NULL,
  `shop_type` varchar(100) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneno` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `total_amt` bigint(20) DEFAULT '0',
  `total_paid` bigint(255) DEFAULT NULL,
  `total_pending` bigint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `customers_details` (
  `id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` bigint(255) NOT NULL,
  `prod_quantity` bigint(255) NOT NULL DEFAULT '1',
  `customer_id` int(12) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `total` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



add_customer.jsp
This page is particularly used for customer details. Whenever  new customer gets added, it stores  their details directly in database system.


Home.jsp
Basically this content page shows the number of customers . It also has an add button through which we can add the number of customers we want. The main highlighted part is the graphs here, it contains 3 types of graphs 1) bar graph,  2) plot graph,  3) pie graph all this graphs show the total amount, pending amount and paid amount.


Details.jsp
In this , the first thing that the page contains is the admin details which includes name, etc. Also this page includes customer details, with his/her name, address, phone number and other details. The textboxes are also the part of this page where we can add more details we want, and atlast , this page contains is graph.

