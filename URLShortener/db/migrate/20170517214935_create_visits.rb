class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :shortened_url_id, null: false

      t.timestamps
    end

    add_index(:visits, :shortened_url_id)

  end
end
