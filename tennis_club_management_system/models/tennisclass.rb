require_relative('../db/sql_runner')

class Tennisclass

  attr_reader :id
  attr_accessor :name, :class_date, :class_time, :class_duration,
  :court_id, :coach_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @class_date = options['class_date']
    @class_time = options['class_time']
    @class_duration = options['class_duration']
    @court_id = options['court_id'].to_i
    @coach_id = options['coach_id'].to_i
  end

  def save()
    sql = "INSERT INTO tennis_classes
    (
      name,
      class_date,
      class_time,
      class_duration,
      court_id,
      coach_id
    )
    VALUES
    ($1,$2,$3,$4,$5,$6)
    RETURNING *"
    values = [@name,@class_date,@class_time,@class_duration,@court_id,@coach_id]
    tennis_class = SqlRunner.run(sql,values)
    @id = tennis_class.first()['id'].to_i
  end

  def update()
    sql = "UPDATE tennis_classes
    SET (name,
      class_date,
      class_time,
      class_duration,
      court_id,
      coach_id)
      = ($1,$2,$3,$4,$5,$6)
      WHERE id = $7"
      values = [@name,@class_date,@class_time,@class_duration,@court_id,@coach_id,@id]
      SqlRunner.run(sql,values)
    end

    def delete()
      sql = "DELETE FROM tennis_classes
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql,values)
    end

# here
    # def members_coming()
    #   sql = "SELECT member_id FROM class_bookings
    #   WHERE id = $1"
    #   values = [@id]
    #   members_id_hash = SqlRunner.run(sql,values)
    #   members_coming = members_id_hash.map{|member_id| Member.find_by_id(member_id["id"])}
    #   return members_coming
    # end

    def members_coming()
      sql = "SELECT * FROM
             class_bookings INNER JOIN members
             ON class_bookings.member_id = members.id
             WHERE class_bookings.id = $1"
      values = [@id]
      members_coming_hash = SqlRunner.run(sql,values)
      members_coming_array = members_coming_hash.map{|member| Member.new(member)}
      return members_coming_array
    end


    def court_number()
      sql = "SELECT * FROM courts
      WHERE id = $1"
      values = [@court_id]
      court_hash = SqlRunner.run(sql,values)
      court = Court.new(court_hash.first)
      return court.court_number
    end

    def coach()
      sql = "SELECT * FROM coaches
      WHERE id = $1"
      values = [@coach_id]
      coach_hash = SqlRunner.run(sql,values)
      coach = Coach.new(coach_hash.first)
      return coach
    end

    def coach_first_name()
      sql = "SELECT * FROM coaches
      WHERE id = $1"
      values = [@coach_id]
      coach_hash = SqlRunner.run(sql,values)
      coach = Coach.new(coach_hash.first)
      return coach.first_name
    end

    def coach_last_name()
      sql = "SELECT * FROM coaches
      WHERE id = $1"
      values = [@coach_id]
      coach_hash = SqlRunner.run(sql,values)
      coach = Coach.new(coach_hash.first)
      return coach.last_name
    end

    # class methods

    def self.all()
      sql = "SELECT * FROM tennis_classes"
      tennis_classes = SqlRunner.run(sql)
      result = tennis_classes.map {|tennis_class| Tennisclass.new(tennis_class)}
      return result
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM tennis_classes WHERE id = $1"
      values =[id]
      tennisclass = SqlRunner.run(sql, values)
      return Tennisclass.new(tennisclass.first())
    end

    def self.delete_all()
      sql = "DELETE FROM tennis_classes;"
      SqlRunner.run(sql)
    end


  end
