require './libs/main.rb'
require "dotenv"
require "colorize"
require "octokit"
Dotenv.load

instance = OInstance.new
instance.create_commit_push_event(
    ENV['ACCESS_TOKEN'], 
    ENV['GIT_USERNAME'], 
    ENV['GIT_REPO'], 
    ENV['PUSH_FILE'])




