require "webmock"

def loadfile(filename : String)
  file = File.new("test/files/#{filename}.json")
  content = file.gets_to_end
  file.close

  return content
end

WebMock.stub(:get, "https://covidapi.info/api/v1/country/CAN").to_return(status: 200, body: loadfile("canada"))
WebMock.stub(:get, "https://covidapi.info/api/v1/country/CAD").to_return(status: 404, body: %({"count":0,"result":{}}))

WebMock.stub(:get, "https://covidapi.info/api/v1/country/CAN/latest").to_return(status: 200, body: loadfile("canada-latest"))

WebMock.stub(:get, "https://covidapi.info/api/v1/global").to_return(status: 200, body: loadfile("global-latest"))

WebMock.stub(:get, "https://covidapi.info/api/v1/global/count").to_return(status: 200, body: loadfile("global"))
