require "webmock"

file = File.new("test/files/canada.json")
canada_history = file.gets_to_end
file.close

WebMock.stub(:get, "https://covidapi.info/api/v1/country/CAN").to_return(status: 200, body: canada_history)
