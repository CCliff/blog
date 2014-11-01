require './app'
run Sinatra::Application

require './connection'
require './models/post'
require './models/user'
require './models/tag'
require './models/tag_assignment'
require './helpers/authentication_helper'