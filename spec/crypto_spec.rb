require_relative '../lib/crypto.rb'

describe "crypto method" do
    it "should return an array client that is not nil" do
      expect(array_crypto).not_to be_nil
    end
  end