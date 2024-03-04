[//]: # "###################################################"
[//]: # "#####                 HEADER                  #####"
[//]: # "###################################################"


# [Sanitized](https://github.com/Rubology/sanitized)



[//]: # "############################################"
[//]: # "#####              BADGES              #####"
[//]: # "############################################"


| Main Branch| Dev Branch|
|---|---|
| ![ruby 3.3](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_3.yml/badge.svg?branch=main) | ![ruby 3.3](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_3.yml/badge.svg?branch=dev) |
| ![ruby 3.2](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_2.yml/badge.svg?branch=main) | ![ruby 3.2](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_2.yml/badge.svg?branch=dev) |
| ![ruby 3.1](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_1.yml/badge.svg?branch=main) | ![ruby 3.1](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_1.yml/badge.svg?branch=dev) |
| ![ruby 3.0](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_0.yml/badge.svg?branch=main) | ![ruby 3.0](https://github.com/Rubology/sanitized/actions/workflows/ruby_3_0.yml/badge.svg?branch=dev) |
| ![ruby 2.7](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_7.yml/badge.svg?branch=main) | ![ruby 2.7](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_7.yml/badge.svg?branch=dev) |
| ![ruby 2.6](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_6.yml/badge.svg?branch=main) | ![ruby 2.6](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_6.yml/badge.svg?branch=dev) |
| ![ruby 2.5](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_5.yml/badge.svg?branch=main) | ![ruby 2.5](https://github.com/Rubology/sanitized/actions/workflows/ruby_2_5.yml/badge.svg?branch=dev) |
| &nbsp; |  |
| [![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](#license)  | [![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](#license) |
| [![Gem Version](https://badge.fury.io/rb/state_gate.svg)](https://badge.fury.io/rb/sanitized) | [![Gem Version](https://badge.fury.io/rb/state_gate.svg)](https://badge.fury.io/rb/sanitized) |
| ![100% Coverage](https://github.com/Rubology/state_gate/actions/workflows/code_coverage.yml/badge.svg?branch=main) | ![100% Coverage](https://github.com/Rubology/state_gate/actions/workflows/code_coverage.yml/badge.svg?branch=dev) |





[//]: # "###################################################"
[//]: # "#####                  INDEX                  #####"
[//]: # "###################################################"


## Index

- [Description](#sanitized)
- [Requirements](#requirements)
- [Installation](#installation)
- [ChangeLog](#changelog)
- [Sanitized::String](#sanitized-string)
- [Sanitized::Decimal](#sanitized-decimal)
- [Sanitized::Float](#sanitized-float)
- [Sanitized::Integer](#sanitized-integer)
- [Sanitized::BigInteger](#sanitized-big-integer)
- [Sanitized::DateTime](#sanitized-date-time)
- [Custom Code](#custom-code)
- [Contributing](#contributing)
- [Security Policy](SECURITY.md)
- [Code of Conduct](#code-of-conduct)
- [License](#license)



---

[//]: # "###################################################"
[//]: # "#####               DESCRIPTION               #####"
[//]: # "###################################################"


<a name='sanitized'></a>
## **Never trust user input - _EVER!_**

Before validating input, it's common practice to sanitize it; removing leading and trailing spaces, downcasing emails, reducing multiple spaces between names to a single space, etc.

***Sanitized*** simplifies the process of cleaning input data, significantly reducing 
the callbacks and custom methods normally used to handle the issue.

As a suite of `ActiveModel::Type` helpers, ***Sanitized*** applies the selected options
every time, even when skipping validations, callbacks or directly setting with
`:update_columns`.

The built-in options are mapped direct to the standard Ruby and ActiveSupport context 
methods for String, Integer, Float, etc.

And because every application is original, helpers are easily extended with 
your own custom code, for those unique edge cases you need to catch.



---

[//]: # "###################################################"
[//]: # "#####               REQUIREMENTS              #####"
[//]: # "###################################################"


<a name='requirements'></a>
## Requirements

- Ruby 2.5+
- ActiveRecord 5.0+



---

[//]: # "###################################################"
[//]: # "#####              INSTALLATION               #####"
[//]: # "###################################################"


<a name='installation'></a>
## Installation

Add this line to your Gemfile:

`gem 'sanitized'`



---

[//]: # "#######################################"
[//]: # "#####          CHANGELOG          #####"
[//]: # "#######################################"


<a name='changelog'></a>
## ChangeLog
All changes can be found in the [ChangeLog](CHANGELOG.md) file.



---

[//]: # "################################################"
[//]: # "#####          SANITIZED::STRING           #####"
[//]: # "################################################"


<a name='sanitized-string'></a>
## Sanitized::String
This example sanitizes a string by removing all whitespace at the beginning & end of the sting,
reducing multiple whitespace in the middle to a single space, and changing everything to lower case.

```ruby
class User < ActiveRecord::Base
  attribute :name, Sanitized::String.new(:squish, :downcase)
end

user = User.new(name: "  Code    Meister \n")
user.name  #=> "code meister"

```

**Options**

All options that change the string's case are mutually exclusive. For example, you cannot use 
`:downcase` and `:upcase` at the same time.

> - :capitalize       
> - :camelcase       
> - :camelize       
> - :chomp
> - :dasherize       
> - :downcase       
> - :humanize       
> - :lstrip
> - :parameterize       
> - :rstrip
> - :singularize
> - :squish
> - :strip
> - :swapcase       
> - :titlecase       
> - :titleize       
> - :underscore       
> - :upcase       
> - :upcase_first       

---

[//]: # "################################################"
[//]: # "#####         SANITIZED::DECIMAL           #####"
[//]: # "################################################"


<a name='sanitized-decimal'></a>
## Sanitized::Decimal
This example sanitizes a Decimal by truncating it to 0 decimal places.

```ruby
class User < ActiveRecord::Base
  attribute :age, Sanitized::Decimal.new(:truncate)
end

user = User.new(age: 13.75)
user.age  #=> 13

```

**Options**

Both `:ceil` and `:floor` are mutually exclusive, as are `:abs` and `:magnitude`.

> - :abs
> - :ceil
> - :floor
> - :magnitude
> - :truncate


---

[//]: # "################################################"
[//]: # "#####          SANITIZED::Float            #####"
[//]: # "################################################"


<a name='sanitized-float'></a>
## Sanitized::Float
This example sanitizes a Float by ensuring its absolute value.

```ruby
class User < ActiveRecord::Base
  attribute :age, Sanitized::Float.new(:abs)
end

user = User.new(age: -23)
user.age  #=> 23

```


**Options**

Both `:ceil` and `:floor` are mutually exclusive, as are `:abs` and `:magnitude`.

> - :abs
> - :ceil
> - :floor
> - :magnitude
> - :truncate

---

[//]: # "################################################"
[//]: # "#####          SANITIZED::INTEGER          #####"
[//]: # "################################################"


<a name='sanitized-integer'></a>
## Sanitized::Integer
This example sanitizes an Integer by ensuring its absolute value.

```ruby
class User < ActiveRecord::Base
  attribute :age, Sanitized::Integer.new(:abs)
end

user = User.new(age: -23)
user.age  #=> 23

```


**Standard Options**

> - :abs

---

[//]: # "################################################"
[//]: # "#####          SANITIZED::BIGINTEGER          #####"
[//]: # "################################################"


<a name='sanitized-big-integer'></a>
## Sanitized::BigInteger
This example sanitizes an BigInteger by ensuring its absolute value.

```ruby
class User < ActiveRecord::Base
  attribute :age, Sanitized::BigInteger.new(:abs)
end

user = User.new(age: -23)
user.age  #=> 23

```


**Options**

> - :abs

---

[//]: # "################################################"
[//]: # "#####         SANITIZED::DATETIME          #####"
[//]: # "################################################"


<a name='sanitized-date-time'></a>
## Sanitized::DateTime
This example sanitizes a DateTime by setting it to the beginning of the month.

```ruby
class User < ActiveRecord::Base
  attribute :event_at, Sanitized::DateTime.new(:beginning_of_month)
end

user = User.new(event_at: DateTime.new(2001,2,3,4,5,6))
user.event_at.to_s  #=> "Thu, 01 Feb 2001 00:00:00"

```

**Options**

All option are mutually exclusive, so only one may be used at any time.

> - :at_beginning_of_day
> - :at_beginning_of_hour
> - :at_beginning_of_minute
> - :at_beginning_of_month
> - :at_beginning_of_quarter
> - :at_beginning_of_week
> - :at_beginning_of_year
> - :at_end_of_day
> - :at_end_of_hour
> - :at_end_of_minute
> - :at_end_of_month
> - :at_end_of_quarter
> - :at_end_of_week
> - :at_end_of_year
> - :at_midday
> - :at_middle_of_day
> - :at_midnight
> - :at_noon
> - :beginning_of_day
> - :beginning_of_hour
> - :beginning_of_minute
> - :beginning_of_month
> - :beginning_of_quarter
> - :beginning_of_week
> - :beginning_of_year
> - :end_of_month
> - :end_of_quarter
> - :end_of_week
> - :end_of_year
> - :end_of_day
> - :end_of_hour
> - :end_of_minute
> - :midday
> - :middle_of_day
> - :midnight
> - :noon


---

[//]: # "################################################"
[//]: # "#####              CUSTOM CODE             #####"
[//]: # "################################################"


<a name='custom-code'></a>
## Custom Code
You can add you own custom code by passing in a block:

```ruby
class User < ActiveRecord::Base
  name_sanitizer = Sanitized::String.new(:squash, :downcase) do |name|
    if name == 'codemeister'
      'Godzilla'
    else
      name
    end
  end

  attribute :name, name_sanitizer
end

user = User.new(name: "  CodeMeister  ")
user.name  #=> "Godzilla"
user.save  
user.name  #=> 'godzilla'

```

***GOTCHA'S***

1. The custom code is run ***after*** any options are applied. So, as in the example above,
   even through the option was to `:downcase` the custom block returned a capitalized string. 


2. The custom code ***MUST*** be idempotent. The sanitation is run each time an attribute
   is set or the model is updated. In the example above, the sanitizer is run both on 
   assigning the value and on saving the record.

---

[//]: # "###################################################"


<a name='contributing'></a>
## Contributing

> - [Security issues](#security-issues)
> - [Reporting issues](#reporting-issues)
> - [Pull requests](#pull-requests)

In all cases please respect our [Contributor Code of Conduct](CODE_OF_CONDUCT.md).


<a name='security-issues'></a>
### Security issues

If you have found a security related issue, please follow our 
[Security Policy](SECURITY.md).


<a name='reporting-issues'></a>
### Reporting issues

Please try to answer the following questions in your bug report:

- What did you do?
- What did you expect to happen?
- What happened instead?

Make sure to include as much relevant information as possible, including:

- Ruby version.
- Sanitized version.
- ActiveModel version.
- ActiveRecord version.
- OS version.
- The steps needed to replicate the issue.
- Any stack traces you have are very valuable.


<a name='pull-requests'></a>
### Pull Requests

We encourage contributions via GitHub pull requests.

Our [Developer Guide](DEVELOPER_GUIDE.md) details how to fork the project;
get it running locally; run the tests; ensure 100% coverage; check the documentation;
check your style; and submit a pull request.



---

[//]: # "###################################################"
[//]: # "#####              CODE OF CONDUCT            #####"
[//]: # "###################################################"


<a name='code-of-conduct'></a>
## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, religion, or sexual identity
and orientation.


Read the full details in our [Contributor Code of Conduct](CODE_OF_CONDUCT.md).



---

[//]: # "###################################################"
[//]: # "#####                  LICENSE                #####"
[//]: # "###################################################"


<a name='license'></a>
## License

The MIT License (MIT)

Copyright (c) 2021 CodeMeister

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


