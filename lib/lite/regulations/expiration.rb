# frozen_string_literal: true

module Lite
  module Regulations
    module Expiration

      extend ActiveSupport::Concern

      # rubocop:disable Style/Lambda
      included do
        scope :expired, -> do
          where("expires_at IS NULL OR expires_at < ?", Lite::Regulations::Base.timestamp)
        end
        scope :unexpired, -> do
          where("expires_at IS NOT NULL AND expires_at >= ?", Lite::Regulations::Base.timestamp)
        end
      end
      # rubocop:enable Style/Lambda

      def default_expires_in
        30.minutes
      end

      def expire!
        return true if expires_at.nil?

        update(expires_at: nil)
      end

      def expired?
        return true if expires_at.nil?

        Lite::Regulations::Base.timestamp >= expires_at
      end

      def extend!(expires_in = nil)
        update(expires_at: extension_date(expires_in))
      end

      def unexpire!
        return true unless expires_at.nil?

        update(expires_at: extension_date)
      end

      def unexpired?
        return false if expires_at.nil?

        Lite::Regulations::Base.timestamp < expires_at
      end

      def expires_at_or_time(expires_in = nil)
        return expires_at if unexpired?

        extension_date(expires_in)
      end

      def to_expiration
        I18n.t("lite.regulations.expiration.#{:un if unexpired?}expired")
      end

      private

      def extension_date(expires_in = nil)
        Lite::Regulations::Base.timestamp + (expires_in || default_expires_in).to_i
      end

    end
  end
end
