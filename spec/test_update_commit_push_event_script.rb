require './libs/github_api.rb'
require "dotenv"
require "github_api"

Dotenv.load

describe GitInstance do
    let(:gitInstance) {GitInstance.new}
    
    it "should update commits" do
        responseCode = gitInstance.update_commit_event(
            ENV['ACCESS_TOKEN'], 
            ENV['GIT_USERNAME'], 
            ENV['GIT_REPO'],
            ENV['PUSH_FILE'])

    end
end