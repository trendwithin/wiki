class CreateJoinTablePageUser < ActiveRecord::Migration
  def change
    create_join_table :pages, :users do |t|
      t.index [:page_id, :user_id]
    end
  end
end
