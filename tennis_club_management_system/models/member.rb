require_relative('../db/sql_runner')

class Member

  attr_accessor :id
  attr_accessor :first_name, :last_name, :membership_type, :date_of_birth, :opt_in_wimbledon

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
    @date_of_birth = options['date_of_birth']
    @opt_in_wimbledon = options['opt_in_wimbledon']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      membership_type,
      date_of_birth,
      opt_in_wimbledon
      )
      VALUES
      ($1,$2,$3,$4,$5)
      RETURNING *"
    values = [@first_name,@last_name,@membership_type,@date_of_birth,@opt_in_wimbledon]
    member = SqlRunner.run(sql,values)
    @id = member.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members
    SET (first_name,
      last_name,
      membership_type,
      date_of_birth,
      opt_in_wimbledon)
      = ($1,$2,$3,$4,$5)
      WHERE id = $6"
      values = [@first_name,@last_name,
        @membership_type,@date_of_birth,@opt_in_wimbledon,@id]
      SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def my_bookings()
    sql = "SELECT b.* FROM class_bookings b INNER JOIN members ON b.member_id = members.id
         WHERE members.id = $1"
    values = [@id]
    my_bookings_hash = SqlRunner.run(sql,values)
    my_bookings = my_bookings_hash.map {|booking| Booking.new(booking)}
    return my_bookings
  end

  def my_court_bookings()
    sql = "SELECT b.* FROM court_bookings b INNER JOIN members ON b.member_id = members.id
         WHERE members.id = $1"
    values = [@id]
    my_bookings_hash = SqlRunner.run(sql,values)
    my_bookings = my_bookings_hash.map {|booking| Booking.new(booking)}
    return my_bookings
  end


  # class methods

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map {|member| Member.new(member)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values =[id]
    member = SqlRunner.run(sql, values)
    return Member.new(member.first())
  end

  def self.delete_all()
    sql = "DELETE FROM members;"
    SqlRunner.run(sql)
  end


end
