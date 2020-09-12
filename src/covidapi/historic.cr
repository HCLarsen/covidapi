require "./result"

module Covidapi
  abstract class Historic
    include JSON::Serializable

    getter count : Int32

    @[JSON::Field(key: "result")]
    getter results : Hash(String, Covidapi::Result)

    PATTERN = "%Y-%m-%d"

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
