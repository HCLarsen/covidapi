require "./result"

module Covidapi
  class CountryLatest
    JSON.mapping(
      count: Int32,
      results: { type: Hash(String, Covidapi::Result), key: "result" }
    )

    def confirmed
      @results.first_value.confirmed
    end

    def deaths
      @results.first_value.deaths
    end

    def recovered
      @results.first_value.recovered
    end
  end
end
