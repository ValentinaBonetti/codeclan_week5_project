require("minitest/autorun")
require("minitest/rg")
require_relative("../court")

class TestCourt < MiniTest::Test

  def setup
     options = {"court_number" => 1}
     @court01 = Court.new(options)
  end

  def test_court_number()
    result = @court01.court_number()
    assert_equal(1, result)
  end

end
