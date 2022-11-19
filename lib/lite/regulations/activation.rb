# frozen_string_literal: true

module Lite
  module Regulations
    module Activation

      extend ActiveSupport::Concern

      included do
        scope :active, -> { where(inactivated_at: nil) }
        scope :inactive, -> { where.not(inactivated_at: nil) }
      end

      def active!
        return true if active?

        update(inactivated_at: nil)
      end

      def active?
        inactivated_at.nil?
      end

      def inactive!
        return true if inactive?

        update(inactivated_at: Lite::Regulations::Base.timestamp)
      end

      def inactive?
        !active?
      end

      def inactivated_at_or_time
        return inactivated_at if inactive?

        Lite::Regulations::Base.timestamp
      end

      def to_activation
        I18n.t("lite.regulations.activation.#{:in if inactive?}active")
      end

    end
  end
end
