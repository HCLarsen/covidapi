require "json"

module Covidapi
  class CountryHistory
    JSON.mapping(
      count: Int32,
      results: { type: Hash(String, Result), key: "result" }
    )
  end

  struct Result
    JSON.mapping(
      confirmed: Int32,
      deaths: Int32,
      recovered: Int32
    )
  end
end
