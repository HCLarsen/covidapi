require "minitest/autorun"

require "/../src/covidapi.cr"
require "./webmocks.cr"

class CountryHistoryTest < Minitest::Test
  def test_gets_country_history
    canada = Covidapi.getCountryHistory("CAN")
    assert_equal 63, canada.results.size
    assert_equal 2790, canada.results.last_value.confirmed
  end

  def test_gets_global_history
    global = Covidapi.getGlobalHistory
    assert_equal 63, global.results.size
    assert_equal 418678, global.results.last_value.confirmed
  end
end
