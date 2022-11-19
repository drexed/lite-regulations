# Activation

#### Table

```ruby
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :inactivated_at
    add_column :your_model, :inactivated_at, :datetime
  end
end
```

#### Model

```ruby
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
