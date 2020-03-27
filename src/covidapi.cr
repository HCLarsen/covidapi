require "http/client"

require "./covidapi/*"

# TODO: Write documentation for `Covidapi`
module Covidapi
  VERSION = "0.1.0"

  def self.getCountryHistory(country_code : String) : Covidapi::CountryHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/country/#{country_code}"
    Covidapi::CountryHistory.from_json(data.body)
  end

  def self.getGlobalHistory : Covidapi::GlobalHistory
    data = HTTP::Client.get "https://covidapi.info/api/v1/global/count"
    Covidapi::GlobalHistory.from_json(data.body)
  end
end
