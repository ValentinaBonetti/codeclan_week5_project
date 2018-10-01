require("minitest/autorun")
require("minitest/rg")
require_relative("../tennisclass")
require_relative("../coach")
require_relative("../court")


class TestTennisclass < MiniTest::Test

  def setup

    options01 = {"court_number" => 1}
    @court01 = Court.new(options01)
    @court01.save

    options02 = {"first_name" => "Julie",
      "last_name" => "Gordon",
      "qualification" => "LTA Level 5",
      "date_of_birth" => "1976-01-29"
    }
    @coach01 = Coach.new(options02)
    @coach01.save

    options03 = {"name" => "Cardio tennis",
      "class_date" => "2018-10-29",
      "class_time" => "12:00",
      "class_duration" => 2,
      "court_id" => @court01.id,
      "coach_id" => @coach01.id}
    @tennisclass01 = Tennisclass.new(options03)

  end


  def test_name()
    result = @tennisclass01.name().downcase
    assert_equal("cardio tennis", result)
  end

  def test_class_date()
    result = @tennisclass01.class_date()
    assert_equal("2018-10-29", result)
  end

  def test_class_time()
    result = @tennisclass01.class_time()
    assert_equal("12:00", result)
  end

  def test_class_duration()
    result = @tennisclass01.class_duration()
    assert_equal(2, result)
  end

  def test_court_id()
    result = @tennisclass01.court_id()
    assert_equal(@court01.id, result)
  end

  def test_coach_id()
    result = @tennisclass01.coach_id()
    assert_equal(@coach01.id, result)
  end

end
