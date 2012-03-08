class CreateAvaliacoes < ActiveRecord::Migration
  def self.up
    create_table :avaliacoes do |t|
      t.string :titulo
      t.integer :peso
      t.boolean :recuperacao
      t.references :disciplina_professor

      t.timestamps
    end
  end

  def self.down
    drop_table :avaliacoes
  end
end
