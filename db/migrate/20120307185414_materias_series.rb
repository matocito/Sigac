class MateriasSeries < ActiveRecord::Migration
  def self.up
    create_table :materias_series, :id => false do |t|
      t.integer :serie_id
      t.integer :materia_id
    end
  end

  def self.down
    drop_table :materias_series
  end
end
