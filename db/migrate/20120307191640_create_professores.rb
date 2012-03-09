class CreateProfessores < ActiveRecord::Migration
  def self.up
    create_table :professores do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable 
    
      t.string :nome
      t.string :cpf
      t.date :nascimento
      t.string :telefone
      t.string :foto

      t.timestamps
    end
    
    add_index :professores, :email,                :unique => true
    add_index :professores, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :professores
  end
end
