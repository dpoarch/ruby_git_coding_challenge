require './libs/main.rb'
require "dotenv"
require "octokit"

Dotenv.load

describe OInstance do
    let(:oinstance) {OInstance.new}
    
    it "should create an issues event" do
        responseCode = oinstance.create_issue_event(
            ENV['ACCESS_TOKEN'], 
            ENV['GIT_USERNAME'], 
            ENV['GIT_REPO'])

        expect(responseCode).to eq(201)
    end

    it "should create a milestone event" do
        responseCode = oinstance.create_milestone_issue_event(
            ENV['ACCESS_TOKEN'], 
            ENV['GIT_USERNAME'], 
            ENV['GIT_REPO'])

        expect(responseCode).to eq(201)
    end
end