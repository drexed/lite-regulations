# frozen_string_literal: true

module Lite
  module Regulations
    module Quarantine

      extend ActiveSupport::Concern

      included do
        scope :quarantined, -> { where.not(quarantined_at: nil) }
        scope :unquarantined, -> { where(quarantined_at: nil) }
      end

      def quarantine!
        return true if quarantined?

        update(quarantined_at: Time.current)
      end

      def quarantined?
        !unquarantined?
      end

      def quarantined_at_or_time
        return quarantined_at if quarantined?

        Lite::Regulations::Base.timestamp
      end

      def to_quarantine
        I18n.t("lite.regulations.quarantine.#{:un if unquarantined?}quarantined")
      end

      def unquarantine!
        return true if unquarantined?

        update(quarantined_at: nil)
      end

      def unquarantined?
        quarantined_at.nil?
      end

    end
  end
end
