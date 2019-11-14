class Dog
  
  attr_accessor :id, :name, :breed
  
  def initialize(hashdog)
    @name = hashdog[:name]
    @breed = hashdog[:breed]
    @id = hashdog[:id]
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs
    SQL
    DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
    sql = <<-SQL
      SELECT id FROM dogs
      WHERE name = ? AND breed = ?
    SQL
    @id = DB[:conn].execute(sql, self.name, self.breed)[0][0]
    self
  end
  
end