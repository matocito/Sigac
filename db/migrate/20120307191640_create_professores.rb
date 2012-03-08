class CreateProfessores < ActiveRecord::Migration
  def self.up
    create_table :professores do |t|
      t.string :nome
      t.string :cpf
      t.date :nascimento
      t.string :telefone

      t.timestamps
    end
  end

  def self.down
    drop_table :professores
  end
end
