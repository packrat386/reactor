require 'octokit'
require 'yaml'

module Reactor
  class Client
    def initialize(config:)
      token = YAML.safe_load(File.read(config))['token']
      @octokit = Octokit::Client.new(access_token: token)
    end

    def react(issue_url:, message:)
      repo = Octokit::Repository.from_url(issue_url)
      @octokit.add_comment(repo, issue_url.split('/').last, message)
    end
  end
end
