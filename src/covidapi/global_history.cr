require "./result"

module Covidapi
  class GlobalHistory
    JSON.mapping(
      count: Int32,
      results: { type: Hash(String, Covidapi::Result), key: "result" }
    )
  end
end
