require 'octokit'

module Reactor
  class Client
    def initialize(token:)
      @octokit = Octokit::Client.new(access_token: token)
    end

    def react(issue_url:, comment: ':+1:')
      repo = Octokit::Repository.from_url(issue_url)
      @octokit.add_comment(repo, issue_url.split('/').last, comment)
    end
  end
end
