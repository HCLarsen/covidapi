require "http/client"

require "./covidapi/*"

# TODO: Write documentation for `Covidapi`
module Covidapi
  VERSION = "0.1.0"

  def self.getCountryHistory(country_code : String) : Covidapi::CountryHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/country/#{country_code}"
    if self.success?(data)
      Covidapi::CountryHistory.from_json(data.body)
    else
      raise Exception.new("COVID API error: 404 #{data.body.rstrip}")
    end
  end

  def self.getGlobalHistory : Covidapi::GlobalHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/global/count"
    if self.success?(data)
      Covidapi::GlobalHistory.from_json(data.body)
    else
      raise Exception.new("COVID API error: 404 #{data.body}")
    end
  end

  def self.success?(data : HTTP::Client::Response) : Bool
    body = data.body
    json = JSON.parse(body)
    count = json["count"].as_i

    return count > 0
  end
end
