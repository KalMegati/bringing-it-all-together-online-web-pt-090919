class Dog
  
  attr_accessor :id, :name, :breed
  
  def initialize(hashdog)
    @name = hashdog[:name]
    @breed = hashdog[:breed]
    @id = hashdog[:id]
  end
  
  def self.create_table
    
  end
  
end