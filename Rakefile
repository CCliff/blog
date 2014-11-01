require 'bundler'
Bundler.require
require 'sinatra/activerecord/rake'

require './connection'
require './models/post'
require './models/user'
require './models/tag'
require './models/tag_assignment'

namespace :db do
  desc "create blog_db"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE blog_db;')
    conn.close
  end

  desc "drop blog_db"
  task :drop_db do
    conn = PG::Connection.op()
    conn.exec('DROP DATABASE blog_db;')
    conn.close
  end

  desc "load Aldric's blog.csv"
  task :load_data do
    require 'csv'
    CSV.foreach('blog.csv') do |csv|
      binding.pry
      title = csv[0]
      body = csv[1]
      Page.create(title: title, body: body)
    end
  end

end