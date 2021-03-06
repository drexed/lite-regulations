# frozen_string_literal: true

require 'rails/railtie'

module Lite
  module Regulations
    class Railtie < ::Rails::Railtie

      initializer 'lite-regulations' do |app|
        Lite::Regulations::Railtie.instance_eval do
          [app.config.i18n.available_locales].flatten.each do |locale|
            path = File.expand_path("../../../config/locales/#{locale}.yml", __FILE__)
            next if !File.file?(path) || I18n.load_path.include?(path)

            I18n.load_path << path
          end
        end
      end

    end
  end
end
