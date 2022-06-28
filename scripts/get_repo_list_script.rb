require './libs/main.rb'
require "dotenv"
require "colorize"
require "octokit"
Dotenv.load

include OInstance

oinstance = OInstance.new
oinstance.get_repos(ENV['ACCESS_TOKEN'])
