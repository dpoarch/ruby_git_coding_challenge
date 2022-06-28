require './libs/main.rb'
require "dotenv"
require "octokit"

Dotenv.load

describe OInstance do
    let(:oinstance) {OInstance.new}
    
    it "should test create commit and push event" do
        responseCode = oinstance.create_commit_push_event(
            ENV['ACCESS_TOKEN'], 
            ENV['GIT_USERNAME'], 
            ENV['GIT_REPO'], 
            ENV['PUSH_FILE'])

        expect(responseCode).to eq(201)
    end
end