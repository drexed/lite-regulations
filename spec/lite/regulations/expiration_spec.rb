# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Regulations::Expiration do
  let(:klass) { User.include(described_class) }
  let(:user) { klass.create! }

  describe '#unexpired' do
    it 'to be 35' do
      10.times { klass.create!(expires_at: Time.current) }
      35.times { klass.create!(expires_at: Time.current + 30) }
      15.times { klass.create!(expires_at: nil) }

      expect(klass.unexpired.count).to eq(35)
    end
  end

  describe '#expired' do
    it 'to be 25' do
      10.times { klass.create!(expires_at: Time.current) }
      35.times { klass.create!(expires_at: Time.current + 30) }
      15.times { klass.create!(expires_at: nil) }

      expect(klass.expired.count).to eq(25)
    end
  end

  describe '.expires_at' do
    it 'to be nil' do
      expect(user.expires_at).to eq(nil)
    end

    it 'to be nil expired' do
      user.unexpire!
      user.expire!

      expect(user.expires_at).to eq(nil)
    end

    it 'to not be nil when unexpired' do
      user.unexpire!

      expect(user.expires_at).not_to eq(nil)
    end

    it 'to not be nil when extended' do
      user.extend!

      expect(user.expires_at).not_to eq(nil)
    end
  end

  describe '.unexpire' do
    it 'to be true' do
      user.unexpire!

      expect(user.unexpired?).to eq(true)
    end
  end

  describe '.extend' do
    it 'to be true' do
      user.extend!

      expect(user.unexpired?).to eq(true)
    end
  end

  describe '.expire' do
    it 'to be false' do
      user.expire!

      expect(user.unexpired?).to eq(false)
    end
  end

  describe '.unexpired?' do
    it 'to be false' do
      expect(user.unexpired?).to eq(false)
    end

    it 'to be false when expired' do
      user.expire!

      expect(user.unexpired?).to eq(false)
    end

    it 'to be true when unexpired' do
      user.unexpire!

      expect(user.unexpired?).to eq(true)
    end

    it 'to be true when extended' do
      user.extend!

      expect(user.unexpired?).to eq(true)
    end
  end

  describe '.expired?' do
    it 'to be true' do
      expect(user.expired?).to eq(true)
    end

    it 'to be true when expired' do
      user.expire!

      expect(user.expired?).to eq(true)
    end

    it 'to be false when extended' do
      user.extend!

      expect(user.expired?).to eq(false)
    end

    it 'to be false when unexpired' do
      user.unexpire!

      expect(user.expired?).to eq(false)
    end
  end

  describe '.to_expiration' do
    it 'to be "Expired"' do
      expect(user.to_expiration).to eq('Expired')
    end

    it 'to be "Expired" when expired' do
      user.expire!

      expect(user.to_expiration).to eq('Expired')
    end

    it 'to be "Unexpired" when unexpired' do
      user.unexpire!

      expect(user.to_expiration).to eq('Unexpired')
    end

    it 'to be "Unexpired" when extended' do
      user.extend!

      expect(user.to_expiration).to eq('Unexpired')
    end
  end

end
