require_relative('../models/member')
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

binding.pry
nil
