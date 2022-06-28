require './libs/main.rb'
require "dotenv"
require "octokit"

Dotenv.load

describe OInstance do
    let(:oinstance) {OInstance.new}
    
    it "should create an issues event" do
        responseCode = oinstance.get_repos(ENV['ACCESS_TOKEN'])

        expect(responseCode).to eq(200)
    end
end