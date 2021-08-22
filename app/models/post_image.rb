class PostImage < ApplicationRecord
  # userモデルに関連付けをする
  # ここで、PostImageモデルに関連付けられるのは1つのUserモデルなので、単数形
  belongs_to :user
  #画像アップ用のメソッドを追加して、フィールド名にimageを指定
  #refileを使用する上での
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
