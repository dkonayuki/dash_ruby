# Dash Ruby
Hack your Amazon Dash buttons

## Installation
```
$ gem install dash_ruby
```

## Usage
```
$ sudo find_ruby eth0
```

## Example
Reference: example.rb
```
require 'dash_ruby'

button = Dash::Button.new('08:00:27:53:b1:36', 'eth0')
button.on_pressed do |packet|
  # do awesome things
end
```

For multiple dash buttons:
```
require 'dash_ruby'

button = Dash::Button.new(['08:00:27:53:b1:36','08:00:27:53:b1:37'], 'eth0')
button.on_pressed do |packet|
  if packet.sha == '08:00:27:53:b1:36'
    # do this
  elsif packet.sha == '08:00:27:53:b1:37'
    # do that
  end
end
```
