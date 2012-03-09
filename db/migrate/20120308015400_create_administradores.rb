class CreateAdministradores < ActiveRecord::Migration
  def self.up
    create_table :administradores do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable      
    
      t.string :nome
      t.string :cpf
      t.string :nascimento
      t.string :telefone
      t.string :foto

      t.timestamps
    end
    
    add_index :administradores, :email,                :unique => true
    add_index :administradores, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :administradores
  end
end
