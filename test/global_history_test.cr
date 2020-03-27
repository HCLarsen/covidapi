require "minitest/autorun"

require "/../src/covidapi/global_history"

class GlobalHistoryTest < Minitest::Test
  def test_initializes_from_json
    file = File.new("test/files/global.json")
    json = file.gets_to_end
    file.close

    history = Covidapi::GlobalHistory.from_json(json)
    assert_equal 63, history.count

    result = history.results["2020-03-09"]
    assert_equal 113571, result.confirmed
  end
end
