require_relative('../db/sql_runner')

class Coach

  attr_reader :id
  attr_accessor :first_name, :last_name, :qualification, :date_of_birth

  def initialize(options)
    @id = options['if'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @qualification = options['qualification']
    @date_of_birth = options['date_of_birth']
    @wallet = 0
  end

  def save()
    sql = "INSERT INTO coaches
    (
      first_name,
      last_name,
      qualification,
      date_of_birth,
      wallet
      )
      VALUES
      ($1,$2,$3,$4,$5)
      RETURNING *"
    values = [@first_name,@last_name,@qualification,@date_of_birth,@wallet]
    coach = SqlRunner.run(sql,values)
    @id = coach.first()['id'].to_i
  end

  def update()
    sql = "UPDATE coaches
    SET (first_name,
      last_name,
      qualification,
      date_of_birth,
      wallet)
      = ($1,$2,$3,$4,$5)
      WHERE id = $6"
      values = [@first_name,@last_name,
        @qualification,@date_of_birth,@wallet,@id]
      SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM coaches
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end


  # class methods

  def self.all()
    sql = "SELECT * FROM coaches"
    coaches = SqlRunner.run(sql)
    result = coaches.map {|coach| Coach.new(coach)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM coaches;"
    SqlRunner.run(sql)
  end


end
