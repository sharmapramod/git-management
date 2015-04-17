class CreateUserProviders < ActiveRecord::Migration
  def change
    create_table :user_providers do |t|
      t.string :uid
      t.string :provider
      t.timestamps
      t.references :user
    end
    add_index :user_providers, :user_id
  end
end
