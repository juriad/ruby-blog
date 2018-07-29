require 'pp'
require 'date'
require 'sequel'
require 'rack-server-pages'

DB = Sequel.connect('sqlite://blog.db')
DB.create_table? :posts do
	primary_key :id
	String :title
	Text :content
	DateTime :created
end

run Rack::ServerPages.new do |config|
	config.view_path = 'public'
end