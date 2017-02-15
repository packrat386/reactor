require 'octokit'

issue_url = "https://github.com/packrat386/Test-Repo/issues/1"
token = '3e9502aa625bb913ebc13d11c9f71572e2fd5367'

client = Octokit::Client.new(access_token: token)

repo = Octokit::Repository.from_url(issue_url)
client.add_comment(repo, issue_url.split('/').last, ":+1:")
puts "Comment created!"
