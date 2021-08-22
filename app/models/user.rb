class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PostImageモデルに関連づける ユーザーが削除されれば関連しているモデルの内容も削除される
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # refileのルールとして、画像高等が出来るようにする
  # attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述
  attachment :profile_image

end
