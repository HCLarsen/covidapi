require "./result"

module Covidapi
  abstract class Historic
    JSON.mapping(
      count: Int32,
      results: { type: Hash(String, Covidapi::Result), key: "result" }
    )
  end
end
