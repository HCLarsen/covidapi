require "./result"

module Covidapi
  abstract class Historic
    PATTERN = "%Y-%m-%d"

    JSON.mapping(
      count: Int32,
      results: { type: Hash(String, Covidapi::Result), key: "result", setter: false }
    )

    def [](date : String)
      @results[date]
    end

    def [](date : Time)
      @results[date.to_s(PATTERN)]
    end

    def first_case
      @results.select { |k, v| v.confirmed > 0 }.first_key
    end

    def last_date
      @results.last_key
    end
  end
end
