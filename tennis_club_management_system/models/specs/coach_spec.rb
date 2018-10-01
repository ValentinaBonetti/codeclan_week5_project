require("minitest/autorun")
require("minitest/rg")
require_relative("../coach")

class TestCoach < MiniTest::Test

  def setup
    options = {"first_name" => "Julie",
      "last_name" => "Gordon",
      "qualification" => "LTA Level 5",
      "date_of_birth" => "1976-01-29"
    }
    @coach01 = Coach.new(options)
  end


  def test_first_name()
    result = @coach01.first_name()
    assert_equal("Julie", result)
  end

  def test_last_name()
    result = @coach01.last_name()
    assert_equal("Gordon", result)
  end

  def test_qualification()
    result = @coach01.qualification().downcase
    assert_equal("lta level 5", result)
  end

  def test_date_of_birth()
    result = @coach01.date_of_birth()
    assert_equal("1976-01-29", result)
  end


end
