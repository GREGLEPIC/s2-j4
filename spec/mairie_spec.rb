require_relative '../lib/mairie.rb'

describe "mairie method" do
    it "should return an array of email that is not nil" do
      expect(email_mairie).not_to be_nil
    end
  end