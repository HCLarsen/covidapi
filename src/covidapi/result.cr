require "json"

module Covidapi
  struct Result
    JSON.mapping(
      confirmed: Int32,
      deaths: Int32,
      recovered: Int32
    )
  end
end
