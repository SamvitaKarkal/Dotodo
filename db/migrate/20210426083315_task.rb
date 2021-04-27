class Task < ActiveRecord::Migration
    def change
      create_table :tasks do |t|
        t.timestamps
      end
    end
end