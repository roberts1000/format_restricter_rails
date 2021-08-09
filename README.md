# format_restricter_rails

`format_restricter_rails` provides a simple way to block Ruby on Rails controller actions from processing unsupported formats. If you've seen the following type of errors on your production site, `format_restricter_rails` can help:

```ruby
ActionView::MissingTemplate (Missing template tasks/index, application/index with {:locale=>[:en], :formats=>[:json], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :jbuilder]}
```

Why do these errors occur? If it's not a bug in the app code, it's usually because a person, or a bot, is sending requests to your app in a format you didn't anticipate. 

When this happens, you could start defining `respond_to` calls in your actions to handle the new formats. Once you realize that's going to explode your code base, you might try to call `respond_to :html`, at the top of your controller class, in hopes that it will help. Sadly, it won't. That's where format_restricter_rails comes in. It provides a single controller class method called `restrict_formats_to` that does exactly what you want. When unallowed formats are requested, the controller halts execution and returns **HTTP Error 406 Not acceptable**.

## Versioning Scheme

Releases are versioned using [SemVer 2.0.0](https://semver.org/spec/v2.0.0.html) with the following caveats:

1. Support for a Ruby version, that reaches EOL, is removed in a major or minor release.
1. Support for a Ruby on Rails version, that reaches EOL, is removed in a major or minor release.

## Supported Ruby Versions

Ruby 2.6.0+

## Supported Ruby on Rails Versions

Rails 5.1+

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

Bug reports and pull requests are welcome on the format_restricter_rails [issues](https://github.com/roberts1000/format_restricter_rails/issues) page.
