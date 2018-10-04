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

get '/manager/memberships' do
  @members = Member.all()
  erb (:"/manager/members")
end

get '/manager/:id/delete' do
  @member = Member.find_by_id(params[:id])
  @member.delete
  redirect to("/manager/memberships")
end

get '/manager/:id/edit' do
  @member = Member.find_by_id(params[:id])
  erb (:"/manager/edit_member")
end

# edit member - receive the info from the form:
post '/manager/:id/update' do
   @updatedmember = Member.new(params)
   @updatedmember.update
  redirect to("/manager/memberships")
end

get '/manager/classes' do
  @tennis_classes = Tennisclass.all()
  erb (:"/manager/tennis_classes")
end

get '/manager/classes/new' do
  @coaches = Coach.all()
  @courts = Court.all()
  erb (:"/manager/create_tennis_class")
end

post '/manager/classes/create' do
  @tennisclass = Tennisclass.new(params)
  @tennisclass.save
  redirect to("/manager/classes")
end

get '/manager/classes/:id/edit' do
  @tennis_class = Tennisclass.find_by_id(params[:id])
  @coaches = Coach.all()
  @courts = Court.all()
  erb (:"/manager/edit_tennis_class")
end

get '/manager/classes/:id/bookings' do
  @tennisclass = Tennisclass.find_by_id(params[:id])
  @members_coming = @tennisclass.members_coming
  erb (:"/manager/show_members_coming")
end

post '/manager/classes/:id/update' do
  @tennisclass = Tennisclass.find_by_id(params[:id])
  @tennisclass.name = params[:name]
  @tennisclass.class_date = params[:class_date]
  @tennisclass.class_time = params[:class_time]
  @tennisclass.class_duration = params[:class_duration]
  @tennisclass.court_id = params[:court_id]
  @tennisclass.coach_id = params[:coach_id]
  @tennisclass.update
  redirect to("/manager/classes")
end
