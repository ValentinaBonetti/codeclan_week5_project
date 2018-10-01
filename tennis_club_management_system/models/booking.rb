require_relative( '../db/sql_runner' )

class Booking

  attr_reader :id
  attr_accessor :member_id, :tennis_class_id, :court_id,
                :court_booking_date, :court_booking_time, :court_booking_duration

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @tennis_class_id = options['tennis_class_id'].to_i
    @court_id = options['court_id'].to_i
    @court_booking_date = options['court_booking_date']
    @court_booking_time = options['court_booking_time']
    @court_booking_duration = options['court_booking_duration']
  end

  def save()
    sql = "INSERT INTO bookings
    (
      member_id,
      tennis_class_id,
      court_id,
      court_booking_date,
      court_booking_time,
      court_booking_duration
    )
    VALUES
    ($1,$2,$3,$4,$5,$6)
    RETURNING id"
    values = [@member_id,@tennis_class_id,@court_id,@court_booking_date,
              @court_booking_time,@court_booking_duration]
    booking = SqlRunner.run(sql, values)
    @id = booking.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM bookings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql)
  end


  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    member = SqlRunner.run(sql,values)
    return Member.new(member.first)
  end


  # Class methods

  def self.all()
    sql = "SELECT * FROM bookings"
    bookings = SqlRunner.run( sql )
    return bookings.map {|booking| Booking.new(booking)}
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run( sql )
  end



end
