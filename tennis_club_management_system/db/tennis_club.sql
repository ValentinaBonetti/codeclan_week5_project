DROP TABLE bookings;
DROP TABLE tennis_classes;
DROP TABLE coaches;
DROP TABLE courts;
DROP TABLE members;

CREATE TABLE members (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255),
  date_of_birth DATE,
  opt_in_Wimbledon BIT
);

CREATE TABLE courts (
  id SERIAL8 PRIMARY KEY,
  court_number INT2
);

CREATE TABLE coaches (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  qualification VARCHAR(255),
  wallet REAL
);

CREATE TABLE tennis_classes (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  class_date DATE,
  class_time TIME,
  class_duration INTERVAL HOUR,
  court_id INT8 REFERENCES courts(id) ON DELETE CASCADE,
  coach_id INT8 REFERENCES coaches(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
  id SERIAL8 PRIMARY KEY,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  tennis_class_id INT8 REFERENCES tennis_classes(id) ON DELETE CASCADE,
  court_id INT8 REFERENCES courts(id) ON DELETE CASCADE,
  court_booking_date DATE,
  court_booking_time TIME,
  court_booking_duration INTERVAL HOUR
);
