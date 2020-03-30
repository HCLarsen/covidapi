require "http/client"

require "./covidapi/*"

# TODO: Write documentation for `Covidapi`
module Covidapi
  VERSION = "0.1.0"

  def self.getCountryHistory(country_code : String) : Covidapi::CountryHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/country/#{country_code}"
    if data.success?
      Covidapi::CountryHistory.from_json(data.body)
    else
      raise Exception.new("COVID API error: #{data.status_code}")
    end
  end

  def self.getGlobalHistory : Covidapi::GlobalHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/global/count"
    if data.success?
      Covidapi::GlobalHistory.from_json(data.body)
    else
      raise Exception.new("COVID API error: #{data.status_code}")
    end
  end
end
