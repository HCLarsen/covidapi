# Covid API

This is a Crystal wrapper for the [COVID19 API](https://covidapi.info/).

Currently, it doesn't cover all the options of the API. The two main classes are GlobalHistory and CountryHistory. Values of most other API endpoints can be determined from those two.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     covidapi:
       github: HCLarsen/covidapi
   ```

2. Run `shards install`

## Usage

```crystal
require "covidapi"
```

To obtain the history of global spread of the virus, use Covidapi#getGlobalHistory.

```crystal
global = Covidapi.getGlobalHistory
assert_equal global.results.size                  #=> 63
assert_equal global.results.last_value.confirmed  #=> 418678

```

Passing in the three letter code for a country to the #getCountryHistory method will return the historical data for that country.

```crystal
canada = Covidapi.getCountryHistory("CAN")
canada.count                        #=> 63
canada.results.last_value.confirmed #=> 2790
```

## Contributing

1. Fork it (<https://github.com/HCLarsen/covidapi/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Larsen](https://github.com/HCLarsen) - creator and maintainer
