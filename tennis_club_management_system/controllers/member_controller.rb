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

get '/members/:id/courts' do
  @member = Member.find_by_id(params[:id])
  @courts = Court.all()
  erb(:"members/courts")
end

get '/members/:id/post' do
  booking = Booking.new({"member_id" => params[:id],
     "court_id" => params[:court_id],
     "booking_date" => params[:booking_date],
     "booking_time" => params[:booking_time],
     "booking_duration" => params[:booking_duration]})
  booking.save
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
  # check if member already booked the class:
  if (@member.my_bookings.any? {|booking| booking.tennis_class_id == tennisclass.id})
    redirect to("/members/#{@member.id}/index")
  else
    booking = Booking.new({"member_id" => @member.id,
                           "tennis_class_id" => tennisclass.id,
                           "court_id" => court.id,
                           "booking_date" => tennisclass.class_date,
                           "booking_time" => tennisclass.class_time,
                           "booking_duration" => tennisclass.class_duration})
    booking.save
    redirect to("/members/#{@member.id}/index")
  end
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
