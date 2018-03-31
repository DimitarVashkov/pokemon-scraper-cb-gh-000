class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    result = db.execute("SELECT * FROM pokemon where id = ?",id)
    Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2],db: db)
  end

  def alter_hp(hp,db)
    puts self.id
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,self.id)
  end

end
