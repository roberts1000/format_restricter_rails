# format_restricter_rails

This gem provides a simple way to block your Rails controller actions from trying to process unsupported formats.  Without this, you'll eventually start seeing the following errors on your production site:

````
ActionView::MissingTemplate (Missing template tasks/index, application/index with {:locale=>[:en], :formats=>[:json], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :jbuilder]}
````

Why are you getting these errors?  Because you designed your sweet little controller action to only process html requests and someone decided to send it a .json request.  Rails happily obliged, processed the action and failed when it couldn't find a corresponding json template to render.

When this happens, you may think to start defining `respond_to` calls in your actions.  Once you realize that's going to explode your code base, you'll probably try to call `respond_to :html` at the top of your controller class in hopes that will help.  Sadly, it won't; and that's where this gem comes in.  It provides a single controller class method, called `restrict_formats_to` that you can add to your controller to declare the formats that it is allowed to process.  When unallowed formats are requested, halts execution and returns an **HTTP Error 406 Not acceptable**.

## Versioning Scheme

This gem uses [semver](http:/semver.org).

## Supported Rails Versions

Currently tested with Rails 4+.
Not tested in Rails 5 yet.

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'format_restricter_rails'
```

And then execute:

    $ bundle

## Usage

The `restrict_formats_to` is just a wrapper around a `before_action` helper and you can use the standard `only:` and `except:` options.

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

#### Example 2: Mix and match

````ruby
class MySnazzyController < ApplicationController
  restrict_formats_to :html, only: :my_action_1
  restrict_formats_to :json, only: :my_action_2

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

