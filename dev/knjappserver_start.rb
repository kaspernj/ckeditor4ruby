#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__))
path = File.realpath(File.dirname(__FILE__))
path_db = "#{path}/knjappserver_db.sqlite3"

require "rubygems"
require "knjrbfw"
require "knjappserver"

require "knj/autoload"

require "../lib/ckeditor4ruby.rb"

db = Knj::Db.new(
  :type => "sqlite3",
  :path => path_db,
  :return_keys => "symbols",
  :index_append_table_name => true
)

begin
  appsrv = Knjappserver.new(
    :port => 8085,
    :doc_root => File.realpath(File.dirname(__FILE__)),
    :title => "ckeditor4ruby_dev",
    :db => db,
    :dbrev => true,
    :debug => false,
    :knjrbfw_path => "#{Knj.knjrbfw_path}/../"
  )
  appsrv.start

  print "Development webserver started on port 8085. Insert URL into browser: http://localhost:8085\n"
  appsrv.join
ensure
  File.unlink(path_db) if File.exists?(path_db)
end