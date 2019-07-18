# Expiration

#### Usage

```ruby
# 1. Add column to table
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :expires_at

    # - or -

    add_column :your_model, :expires_at, :datetime
  end
end

# 2. Include module
class User < ActiveRecord::Base
  include Lite::Regulations::Expiration
end
```

#### Methods

```ruby
user = User.first
user.unexpire!
user.unexpired?       #=> true

user.expire!
user.expired?         #=> true

user.extend!
user.extend!(20.days)
user.expired?         #=> false

user.to_expiration    #=> Returns the visibility state locale string (ex: Expired)
```

#### Scopes

```ruby
User.expired    # Returns all expired records
User.unexpired  # Returns all unexpired records
```
