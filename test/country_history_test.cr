require "minitest/autorun"

require "/../src/covidapi/country_history"

class CountryHistoryTest < Minitest::Test
  def test_initializes_from_json
    file = File.new("test/files/canada.json")
    json = file.gets_to_end
    file.close

    history = Covidapi::CountryHistory.from_json(json)
    assert_equal 63, history.count

    result = history.results["2020-03-09"]
    assert_equal 77, result.confirmed
  end
end
