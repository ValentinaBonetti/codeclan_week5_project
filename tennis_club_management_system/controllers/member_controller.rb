require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/coach.rb' )
require_relative( '../models/court.rb' )
require_relative( '../models/tennisclass.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all
  erb (:"members/index" )
end

# get '/members/new' do
#   erb(:"member/new")
# end
#
# post '/members' do
#   member = Member.new(params)
#   member.save
#   redirect to("/member")
# end
#
# post '/members/:id/delete' do
#   Member.delete(params[:id])
#   redirect to("/members")
# end
