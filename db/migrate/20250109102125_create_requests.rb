class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.integer :request_status, default: 0

      t.timestamps
    end
  end
end
