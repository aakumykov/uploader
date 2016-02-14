class AddUserIdAvatarIdToUserAvatar < ActiveRecord::Migration
  def change
    add_column :user_avatars, :user_id, :integer
    add_column :user_avatars, :avatar_id, :integer
  end
end
