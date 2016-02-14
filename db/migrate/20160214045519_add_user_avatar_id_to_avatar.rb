class AddUserAvatarIdToAvatar < ActiveRecord::Migration
  def change
    add_column :avatars, :user_avatar_id, :integer
  end
end
