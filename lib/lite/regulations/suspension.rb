# frozen_string_literal: true

module Lite
  module Regulations
    module Suspension

      extend ActiveSupport::Concern

      included do
        scope :suspended, -> { where.not(suspended_at: nil) }
        scope :unsuspended, -> { where(suspended_at: nil) }
      end

      def suspend!
        return true if suspended?

        update(suspended_at: Time.current)
      end

      def suspended?
        !unsuspended?
      end

      def suspended_at_or_time
        return suspended_at if unsuspended?

        Lite::Regulations::Base.timestamp
      end

      def to_suspension
        I18n.t("lite.regulations.suspension.#{:un if unsuspended?}suspended")
      end

      def unsuspend!
        return true if unsuspended?

        update(suspended_at: nil)
      end

      def unsuspended?
        suspended_at.nil?
      end

    end
  end
end
