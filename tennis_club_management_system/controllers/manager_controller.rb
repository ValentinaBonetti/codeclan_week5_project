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
  @member = Member.find_by_id(params[:id])
  @member.first_name = params[:first_name]
  @member.last_name = params[:last_name]
  @member.membership_type = params[:membership_type]
  @member.date_of_birth = params[:date_of_birth]
  @member.opt_in_wimbledon = params[:opt_in_wimbledon]
  @member.update
  # understand why the following is not working:
  # @updatedmember = Member.new(params)
  # @updatedmember.save
  redirect to("/manager/memberships")
end
