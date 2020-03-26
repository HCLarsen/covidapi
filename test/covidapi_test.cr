require "minitest/autorun"

require "/../src/covidapi.cr"
require "./webmocks.cr"

class CountryHistoryTest < Minitest::Test
  def test_gets_country_history
    canada = Covidapi.getCountryHistory("CAN")
    assert_equal canada.count, canada.results.size
  end
end
