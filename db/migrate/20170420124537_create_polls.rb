class CreatePolls < ActiveRecord::Migration
  def change
    add_column :statuses, :poll_options, :string, array: true, null: false, default: []

    create_table :poll_votes, force: :cascade do |t|
      t.bigint :status_id
      t.string :poll_option, null: false
      t.integer :account_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    add_index :poll_votes, :status_id, unique: true
  end
end
