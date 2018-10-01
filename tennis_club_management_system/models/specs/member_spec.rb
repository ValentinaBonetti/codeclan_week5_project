require("minitest/autorun")
require("minitest/rg")
require_relative("../member")

class TestMember < MiniTest::Test

  def setup
     options = {"id" => 1, "first_name" => "Valentina", "last_name" => "Bonetti",
       "membership_type" => "student", "date_of_birth" => "1979-03-02", "opt_in_Wimbledon" => true}

     @member01 = Member.new(options)
  end

  def test_first_name()
    result = @member01.first_name()
    assert_equal("Valentina", result)
  end

  def test_last_name()
    result = @member01.last_name()
    assert_equal("Bonetti", result)
  end

  def test_membership_type()
    result = @member01.membership_type().downcase
    assert_equal("student", result)
  end

  def test_date_of_birth()
    result = @member01.date_of_birth()
    assert_equal("1979-03-02", result)
  end

  def test_opt_in_Wimbledon()
    result = @member01.opt_in_Wimbledon()
    assert_equal(true, result)
  end



end
