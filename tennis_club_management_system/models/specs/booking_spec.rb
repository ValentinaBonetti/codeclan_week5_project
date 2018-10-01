require("minitest/autorun")
require("minitest/rg")
require_relative("../booking")
require_relative("../member")
require_relative("../tennisclass")
require_relative("../court")
require_relative("../coach")

class TestBooking < MiniTest::Test

  def setup

    @member01 = Member.new({
      "first_name" => "Valentina",
      "last_name" => "Bonetti",
      "membership_type" => "student",
      "date_of_birth" => "1979-03-02",
      "opt_in_Wimbledon" => 1 #find way to transform 1 into true automatically
      })
    @member01.save

    @court01 = Court.new({"court_number" => 1})
    @court01.save

    @coach01 = Coach.new({"first_name" => "Julie",
      "last_name" => "Gordon",
      "qualification" => "LTA Level 5",
      "date_of_birth" => "1976-01-29"
      })
    @coach01.save

    @tennisclass01 = Tennisclass.new({"name" => "Cardio tennis",
          "class_date" => "2018-10-29",
          "class_time" => "12:00",
          "class_duration" => 2,
          "court_id" => @court01.id,
          "coach_id" => @coach01.id})
    @tennisclass01.save

    @booking01 = Booking.new({"member_id" => @member01.id,
       "tennis_class_id" => @tennisclass01.id,
       "court_id" => @court01.id,
       "court_booking_date" => "2018-10-05",
       "court_booking_time" => "12:00",
       "court_booking_duration" => 2})
    @booking01.save

  end

  def test_member_id()
    result = @booking01.member_id()
    assert_equal(@member01.id, result)
  end

  def test_tennis_class_id()
    result = @booking01.tennis_class_id()
    assert_equal(@tennisclass01.id, result)
  end

  def test_court_id()
    result = @booking01.court_id()
    assert_equal(@court01.id, result)
  end

  def test_court_booking_date()
    result = @booking01.court_booking_date()
    assert_equal("2018-10-05",result)
  end

  def test_court_booking_time()
    result = @booking01.court_booking_time()
    assert_equal("12:00",result)
  end

  def test_court_booking_duration()
    result = @booking01.court_booking_duration()
    assert_equal(2,result)
  end

end
