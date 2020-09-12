require "json"

module Covidapi
  struct Result
    include JSON::Serializable

    getter confirmed : Int32
    getter deaths : Int32
    getter recovered : Int32
  end
end
