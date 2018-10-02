require_relative( '../db/sql_runner' )

class Booking

  attr_reader :id
  attr_accessor :member_id, :tennis_class_id, :court_id,
                :booking_date, :booking_time, :booking_duration

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @tennis_class_id = options['tennis_class_id'].to_i
    @court_id = options['court_id'].to_i
    @booking_date = options['booking_date']
    @booking_time = options['booking_time']
    @booking_duration = options['booking_duration']
  end

  def save()
    sql = "INSERT INTO bookings
    (
      member_id,
      tennis_class_id,
      court_id,
      booking_date,
      booking_time,
      booking_duration
    )
    VALUES
    ($1,$2,$3,$4,$5,$6)
    RETURNING id"
    values = [@member_id,@tennis_class_id,@court_id,@booking_date,
              @booking_time,@booking_duration]
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

  def tennis_class()
    sql = "SELECT * FROM tennis_classes
    WHERE id = $1"
    values = [@tennis_class_id]
    tennis_class = SqlRunner.run(sql,values)
    return Tennisclass.new(tennis_class.first)
  end

  def court_number()
    sql = "SELECT * FROM courts
    WHERE id = $1"
    values = [@court_id]
    court_hash = SqlRunner.run(sql,values)
    court = Court.new(court_hash.first)
    return court.court_number
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
