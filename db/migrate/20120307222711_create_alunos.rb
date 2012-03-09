class CreateAlunos < ActiveRecord::Migration
  def self.up
    create_table :alunos do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      
      t.string :nome
      t.string :identidade
      t.date :nascimento
      t.string :telefone
      t.string :celular
      t.string :responsavel
      t.string :foto
      t.integer :turma_id

      t.timestamps
    end
    
    add_index :alunos, :email,                :unique => true
    add_index :alunos, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :alunos
  end
end
