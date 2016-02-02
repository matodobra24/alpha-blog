class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #Created From Migration With Fields Username & Email as well as Timestamps for update/create
      t.string :username
      t.string :email
      t.timestamps 
    end
  end
end
