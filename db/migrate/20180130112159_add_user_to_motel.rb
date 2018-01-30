class AddUserToMotel < ActiveRecord::Migration[5.1]
  def change
    add_reference :motels, :user, index: true
  end
end
