# Activation

#### Usage

```ruby
# 1. Add column to table
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :inactivated_at

    # - or -

    add_column :your_model, :inactivated_at, :datetime
  end
end

# 2. Include module
class User < ActiveRecord::Base
  include Lite::Regulations::Activation
end
```

#### Methods

```ruby
user = User.first
user.inactive!
user.inactive?      #=> true

user.active!
user.active?        #=> true

user.to_activation  #=> Returns the visibility state locale string (ex: Active)
```

#### Scopes

```ruby
User.inactive # Returns all inactive records
User.active   # Returns all active records
```
