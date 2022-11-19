# frozen_string_literal: true

module Lite
  module Regulations
    module Base

      module_function

      def timestamp
        Time.respond_to?(:current) ? Time.current : Time.now
      end

    end
  end
end
