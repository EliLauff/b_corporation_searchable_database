require 'bundler'
Bundler.require
require 'csv'
require 'pry'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
