require 'sinatra'
require 'sinatra/base'
require 'sinatra/static_assets'
require 'sinatra/cookies'
require 'haml'
require 'savon'
require 'octokit'
require 'pp'
require 'open-uri'
require 'stringio'
require 'rack'
require 'simple-rss'
require 'cgi'
require 'jekyll'
require 'rdiscount'

module Site
	class App < Sinatra::Application

		Dir["./app/helpers/*.rb"].each { |file| require file }
		Dir["./app/models/*.rb"].each { |file| require file }
		Dir["./app/controllers/*.rb"].each { |file| require file }

		helpers Site::Helpers

		use Routes::Index
		use Routes::Blog
	end

end
