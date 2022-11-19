# frozen_string_literal: true

require "spec_helper"

RSpec.describe Lite::Regulations::Base do

  describe ".timestamp" do
    it "to be Time.current" do
      expect(described_class.timestamp.to_s).to eq(Time.current.to_s)
    end
  end

end
