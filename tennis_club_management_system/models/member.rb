require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type, :date_of_birth, :opt_in_Wimbledon

  def initialize(options)
    @id = options['if'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
    @date_of_birth = options['date_of_birth']
    @opt_in_Wimbledon = options['opt_in_Wimbledon']
  end

  def save()
    sql = "INSERT INTO members
    (
      first_name,
      last_name,
      membership_type,
      date_of_birth,
      opt_in_Wimbledon
      )
      VALUES
      ($1,$2,$3,$4,$5)
      RETURNING *"
    values = [@first_name,@last_name,@membership_type,@date_of_birth,@opt_in_Wimbledon]
    member = SqlRunner.run(sql,values)
    @id = member.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members
    SET (first_name,
      last_name,
      membership_type,
      date_of_birth,
      opt_in_Wimbledon)
      = ($1,$2,$3,$4,$5)
      WHERE id = $6"
      values = [@first_name,@last_name,
        @membership_type,@date_of_birth,@opt_in_Wimbledon,@id]
      SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end


  # class methods

  def self.all()
    sql = "SELECT * FROM members"
    members = SqlRunner.run(sql)
    result = members.map {|member| Member.new(member)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM members;"
    SqlRunner.run(sql)
  end


end
