class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, foreign_key: { to_table: :users}
      t.integer :post_id, foreign_key: { to_table: :posts}
      t.string :text

      t.timestamps
    end
  end
end
