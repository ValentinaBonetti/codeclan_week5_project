require('sinatra')
require('sinatra/contrib/all')
# require_relative('controllers/manager_controller')
# require_relative('controllers/coach_controller')
require_relative('controllers/member_controller')

get '/' do
  erb(:index)
end

# register new member - send to form page:
get '/register' do
  erb(:registration)
end

# register new member - receive the info from the form:
post '/register/:id/create' do
  @member = Member.new(params)
  @member.save
  erb(:registration_confirmed)
end
