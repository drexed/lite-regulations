# frozen_string_literal: true

require "active_record" unless defined?(ActiveRecord)
require "active_support" unless defined?(ActiveSupport)

require "lite/regulations/railtie" if defined?(Rails::Railtie)
require "lite/regulations/version"
require "lite/regulations/base"
require "lite/regulations/activation"
require "lite/regulations/containment"
require "lite/regulations/expiration"
require "lite/regulations/quarantine"
require "lite/regulations/suspension"
require "lite/regulations/visibility"
