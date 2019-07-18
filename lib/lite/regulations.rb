# frozen_string_literal: true

require 'active_record'
require 'active_support'

require 'lite/regulations/version'
require 'lite/regulations/railtie' if defined?(Rails)

%w[base activation containment expiration quarantine suspension visibility].each do |name|
  require "lite/regulations/#{name}"
end
