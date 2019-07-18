# Visibility

#### Usage

```ruby
# 1. Add column to table
class AddRegulationsTimestampColumn < ActiveRecord::Migration
  def change
    t.datetime :invisible_at

    # - or -

    add_column :your_model, :invisible_at, :datetime
  end
end

# 2. Include module
class User < ActiveRecord::Base
  include Lite::Regulations::Visibility
end
```

#### Methods

```ruby
user = User.first
user.invisible!
user.invisible?     #=> true

user.visible!
user.visible?       #=> true

user.to_visibility  #=> Returns the visibility state locale string (ex: Visible)
```

#### Scopes

```ruby
User.invisible  # Returns all invisible records
User.visible    # Returns all visible records
```
