require_relative('../db/sql_runner')

class Tennisclass

  attr_reader :id
  attr_accessor :name, :class_date, :class_time, :class_duration,
                :court_id, :coach_id

  def initialize(options)
    @id = options['if'].to_i if options['id']
    @name = options['name']
    @class_date = options['class_date']
    @class_time = options['class_time']
    @class_duration = options['class_duration']
    @court_id = options['court_id']
    @coach_id = options['coach_id']
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


  # class methods

  def self.all()
    sql = "SELECT * FROM tennis_classes"
    tennis_classes = SqlRunner.run(sql)
    result = tennis_classes.map {|tennis_class| Tennisclass.new(tennis_class)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tennis_classes;"
    SqlRunner.run(sql)
  end


end
