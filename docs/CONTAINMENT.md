# Containment

#### Table

```ruby
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :contained_at
    add_column :your_model, :contained_at, :datetime
  end
end
```

#### Usage

```ruby
class User < ActiveRecord::Base
  include Lite::Regulations::Containment
end
```

#### Methods

```ruby
user = User.first
user.uncontain!
user.uncontained?   #=> true
user.contain!
user.contained?     #=> true
user.to_containment #=> Returns the visibility state locale string (ex: Contained)
```

#### Scopes

```ruby
User.contained    # Returns all contained records
User.uncontained  # Returns all uncontained records
```
