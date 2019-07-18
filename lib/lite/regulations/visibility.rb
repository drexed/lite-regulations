# frozen_string_literal: true

module Lite
  module Regulations
    module Visibility

      extend ActiveSupport::Concern

      included do
        scope :invisible, -> { where.not(invisible_at: nil) }
        scope :visible, -> { where(invisible_at: nil) }
      end

      def invisible!
        return true if invisible?

        update(invisible_at: Time.current)
      end

      def visible!
        return true if visible?

        update(invisible_at: nil)
      end

      def invisible?
        !visible?
      end

      def invisible_at_or_time
        return invisible_at if invisible?

        Lite::Regulations::Base.timestamp
      end

      def to_visibility
        I18n.t("lite.regulations.visibility.#{:in if invisible?}visible")
      end

      def visible?
        invisible_at.nil?
      end

    end
  end
end
