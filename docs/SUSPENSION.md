# Suspension

#### Usage

```ruby
# 1. Add column to table
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :suspended_at

    # - or -

    add_column :your_model, :suspended_at, :datetime
  end
end

# 2. Include module
class User < ActiveRecord::Base
  include Lite::Regulations::Suspension
end
```

#### Methods

```ruby
user = User.first
user.unsuspend!
user.unsuspended?   #=> true

user.suspend!
user.suspended?     #=> true

user.to_suspension  #=> Returns the visibility state locale string (ex: Suspended)
```

#### Scopes

```ruby
User.unsuspended  # Returns all unsuspended records
User.suspended    # Returns all suspended records
```
