require "minitest/autorun"

require "/../src/covidapi/country_history"

class CountryHistoryTest < Minitest::Test
  def test_initializes_from_json
    file = File.new("test/files/canada-latest.json")
    json = file.gets_to_end
    file.close

    latest = Covidapi::CountryLatest.from_json(json)
    assert_equal 1, latest.count

    assert_equal 2790, latest.confirmed
  end
end
