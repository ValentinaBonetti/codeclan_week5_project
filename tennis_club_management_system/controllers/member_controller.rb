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
  @members = Member.all()
  erb (:"members/login" )
end

get '/members/:id/index' do
  @member = Member.find_by_id(params[:id])
  erb(:"members/index")
end

get '/members/:id/classes' do
  @member = Member.find_by_id(params[:id])
  @tennis_classes = Tennisclass.all()
  erb(:"members/tennis_classes")
end

get '/members/:id/bookings' do
  @member = Member.find_by_id(params[:id])
  @mybookings = @member.my_bookings
  erb(:"members/bookings")
end

get '/members/:id/:tennis_class_id/:court_id/book_class' do
  @member = Member.find_by_id(params[:id])
  tennisclass = Tennisclass.find_by_id(params[:tennis_class_id])
  court = Court.find_by_id(params[:court_id])
  booking = Booking.new({"member_id" => @member.id,
                         "tennis_class_id" => tennisclass.id,
                         "court_id" => court.id})
  booking.save
  redirect to("/members/#{@member.id}/index")
end



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
