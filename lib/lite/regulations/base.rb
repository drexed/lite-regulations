# frozen_string_literal: true

module Lite
  module Regulations
    module Base

      def self.timestamp
        Time.respond_to?(:current) ? Time.current : Time.now
      end

    end
  end
end
