# format_restricter_rails

This gem provides a simple way to block your Rails controller actions from processing unsupported formats.  Without this, you'll eventually start seeing the following errors on your production site:

````
ActionView::MissingTemplate (Missing template tasks/index, application/index with {:locale=>[:en], :formats=>[:json], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :jbuilder]}
````

Why are you getting these errors?  Because you designed your snazzy controller action to only process html requests and someone decided to send it a .json request.  Rails happily obliged, processed the action and failed when it couldn't find a corresponding json template to render.

When this happens, you may start defining `respond_to` calls in your actions.  Once you realize that's going to explode your code base, you'll probably try to call `respond_to :html` at the top of your controller class in hopes that it will help.  Sadly, it won't; and that's where this gem comes in.  It provides a single controller class method called `restrict_formats_to` that does exactly what you want.  When unallowed formats are requested, the controller will halt execution and return **HTTP Error 406 Not acceptable**.

## Versioning Scheme

1. Releases are versioned using [semver 2.0.0](https://semver.org/spec/v2.0.0.html).
1. Ruby versions that reach EOL are removed in a major or minor release.

## Supported Ruby Versions

Ruby 2.6.0+

## Supported Rails Versions

Rails 4+

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'format_restricter_rails'
```

And then execute:

    $ bundle

## Usage

Add `restrict_formats_to` to the top of a controller to restrict all actions in the controller to the specified format(s).

#### Example 1: Restrict all actions

````ruby
class MySnazzyController < ApplicationController
  restrict_formats_to :html, :json

  def my_action_1
  end

  def my_action_2
  end
end
````

You can also use `only:` and `except:` options to target specific actions.


#### Example 2: Using the `only:` option

````ruby
class MySnazzyController < ApplicationController
  restrict_formats_to :html, only: :my_action_1
  restrict_formats_to :json, only: [:my_action_2, :my_action_3]

  def my_action_1
  end

  def my_action_2
  end

  def my_action_3
  end
end
````

#### Example 2: Using the `except:` Option

````ruby
class MySnazzyController < ApplicationController
  restrict_formats_to :html, except: :my_action_1

  def my_action_1
  end

  def my_action_2
  end
end
````

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/corlewsolutions/format_restricter_rails.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

