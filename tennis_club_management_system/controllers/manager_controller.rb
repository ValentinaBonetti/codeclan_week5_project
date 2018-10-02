require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/coach.rb' )
require_relative( '../models/court.rb' )
require_relative( '../models/tennisclass.rb' )
require_relative( '../models/booking.rb' )
require_relative( '../models/courtbooking.rb' )
also_reload( '../models/*' )

get '/manager/login' do
  erb (:"/manager/login" )
end

get '/manager/index' do
  erb (:"/manager/index")
end
