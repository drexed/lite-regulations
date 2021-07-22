# frozen_string_literal: true

require 'active_record' unless defined?(ActiveRecord)
require 'active_support' unless defined?(ActiveSupport)

require 'lite/regulations/railtie' if defined?(Rails::Railtie)
require 'lite/regulations/version'

%w[base activation containment expiration quarantine suspension visibility].each do |name|
  require "lite/regulations/#{name}"
end
