class CreateTurmas < ActiveRecord::Migration
  def self.up
    create_table :turmas do |t|
      t.string :sala
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :turmas
  end
end
