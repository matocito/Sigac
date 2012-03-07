class CreateAlunos < ActiveRecord::Migration
  def self.up
    create_table :alunos do |t|
      t.string :nome
      t.string :identidade
      t.date :nascimento
      t.string :telefone
      t.string :celular
      t.string :responsavel
      t.integer :turma_id

      t.timestamps
    end
  end

  def self.down
    drop_table :alunos
  end
end
