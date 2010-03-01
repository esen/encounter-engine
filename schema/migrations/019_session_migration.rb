class SessionMigration < ActiveRecord::Migration
  def self.up
		create_table :sessions do |t|
		t.column :session_id, :string
		t.column :data, :text
		t.column :created_at, :datetime
	end
  end

  def self.down
    drop_table :sessions
  end
end

