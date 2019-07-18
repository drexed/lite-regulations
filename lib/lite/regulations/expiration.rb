# frozen_string_literal: true

module Lite
  module Regulations
    module Expiration

      extend ActiveSupport::Concern

      # rubocop:disable Style/Lambda
      included do
        scope :expired, -> do
          where('expires_at IS NULL OR expires_at < ?', Lite::Regulations::Base.timestamp)
        end
        scope :unexpired, -> do
          where('expires_at IS NOT NULL AND expires_at >= ?', Lite::Regulations::Base.timestamp)
        end
      end
      # rubocop:enable Style/Lambda

      def expire!
        return true if expires_at.nil?

        update(expires_at: nil)
      end

      def expired?
        return true if expires_at.nil?

        Lite::Regulations::Base.timestamp >= expires_at
      end

      def extend!(amount = nil)
        update(expires_at: extension_date(amount))
      end

      def unexpire!
        return true unless expires_at.nil?

        update(expires_at: extension_date)
      end

      def unexpired?
        return false if expires_at.nil?

        Lite::Regulations::Base.timestamp < expires_at
      end

      def expires_at_or_time(amount = nil)
        return expires_at if unexpired?

        extension_date(amount)
      end

      def to_expiration
        I18n.t("lite.regulations.expiration.#{:un if unexpired?}expired")
      end

      private

      def extension_date(amount = nil)
        amount ||= 30
        return amount unless amount.is_a?(Integer)

        Lite::Regulations::Base.timestamp + amount
      end

    end
  end
end
