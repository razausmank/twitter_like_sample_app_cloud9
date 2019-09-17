class AddTokenToPens < ActiveRecord::Migration[5.1]
  def change
    add_column :pens, :token, :string
  end
end
