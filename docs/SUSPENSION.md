# Suspension

#### Table

```ruby
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :suspended_at
    add_column :your_model, :suspended_at, :datetime
  end
end
```

#### Usage

```ruby
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
