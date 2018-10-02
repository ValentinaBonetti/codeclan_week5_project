require_relative('../models/member')
require_relative('../models/court')
require_relative('../models/coach')
require_relative('../models/tennisclass')
require_relative('../models/booking')

require("pry-byebug")

Member.delete_all()
Court.delete_all()
Coach.delete_all()
Tennisclass.delete_all()
Booking.delete_all()

member01 = Member.new({
  "first_name" => "Valentina",
  "last_name" => "Bonetti",
  "membership_type" => "student",
  "date_of_birth" => "1979-03-02",
  "opt_in_Wimbledon" => 1 #find way to transform 1 into true automatically
  })
  member01.save


court01 = Court.new({"court_number" => 1})
court01.save

court02 = Court.new({"court_number" => 2})
court02.save

court03 = Court.new({"court_number" => 3})
court03.save

court04 = Court.new({"court_number" => 4})
court04.save

court05 = Court.new({"court_number" => 5})
court05.save

court06 = Court.new({"court_number" => 6})
court06.save


coach01 = Coach.new({"first_name" => "Julie",
    "last_name" => "Gordon",
    "qualification" => "LTA Level 5",
    "date_of_birth" => "1976-01-29"
    })
coach01.save


tennisclass01 = Tennisclass.new({"name" => "Cardio tennis",
    "class_date" => "2018-10-29",
    "class_time" => "12:00",
    "class_duration" => "2:00",
    "court_id" => court01.id,
    "coach_id" => coach01.id})
tennisclass01.save


booking01 = Booking.new({"member_id" => member01.id,
   "tennis_class_id" => tennisclass01.id,
   "court_id" => court01.id,
   "booking_date" => tennisclass01.class_date,
   "booking_time" => tennisclass01.class_time,
   "booking_duration" => tennisclass01.class_duration})
booking01.save


  binding.pry
  nil
