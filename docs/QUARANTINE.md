# Quarantine

#### Table

```ruby
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :quarantined_at
    add_column :your_model, :quarantined_at, :datetime
  end
end
```

#### Usage

```ruby
class User < ActiveRecord::Base
  include Lite::Regulations::Quarantine
end
```

#### Methods

```ruby
user = User.first
user.unquarantine!
user.unquarantined? #=> true
user.quarantine!
user.quarantined?   #=> true
user.to_quarantine  #=> Returns the visibility state locale string (ex: Quarantined)
```

#### Scopes

```ruby
User.unquarantined  # Returns all unquarantined records
User.quarantined    # Returns all quarantined records
```
