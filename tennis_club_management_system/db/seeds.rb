require_relative('../models/member')
require_relative('../models/court')
require_relative('../models/coach')

require("pry-byebug")

Member.delete_all()

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


coach01 = Coach.new({"first_name" => "Julie",
  "last_name" => "Gordon",
  "qualification" => "LTA Level 5",
  "date_of_birth" => "1976-01-29"
})
coach01.save



binding.pry
nil
