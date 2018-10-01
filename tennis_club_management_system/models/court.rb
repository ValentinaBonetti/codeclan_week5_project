require_relative('../db/sql_runner')

class Court

  attr_reader :id
  attr_accessor :court_number

  def initialize(options)
    @id = options['if'].to_i if options['id']
    @court_number = options['court_number']
  end


  def save()
    sql = "INSERT INTO courts
    (
      court_number
    )
    VALUES
    ($1)
    RETURNING *"
    values = [@court_number]
    court = SqlRunner.run(sql,values)
    @id = court.first()['id'].to_i
  end

  def update()
    sql = "UPDATE courts
    SET (court_number)
      = ($1)
      WHERE id = $2"
      values = [@court_number,@id]
        SqlRunner.run(sql,values)
      end

      def delete()
        sql = "DELETE FROM courts
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql,values)
      end


      # class methods

      def self.all()
        sql = "SELECT * FROM courts"
        courts = SqlRunner.run(sql)
        result = courts.map {|court| Court.new(court)}
        return result
      end

      def self.delete_all()
        sql = "DELETE FROM courts;"
        SqlRunner.run(sql)
      end


    end
