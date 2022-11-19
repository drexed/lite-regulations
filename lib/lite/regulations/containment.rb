# frozen_string_literal: true

module Lite
  module Regulations
    module Containment

      extend ActiveSupport::Concern

      included do
        scope :contained, -> { where.not(contained_at: nil) }
        scope :uncontained, -> { where(contained_at: nil) }
      end

      def contain!
        return true if contained?

        update(contained_at: Lite::Regulations::Base.timestamp)
      end

      def contained?
        !uncontained?
      end

      def contained_at_or_time
        return contained_at if contained?

        Lite::Regulations::Base.timestamp
      end

      def to_containment
        I18n.t("lite.regulations.containment.#{uncontained? ? :uncontained : :contained}")
      end

      def uncontain!
        return true if uncontained?

        update(contained_at: nil)
      end

      def uncontained?
        contained_at.nil?
      end

    end
  end
end
