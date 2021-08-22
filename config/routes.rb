Rails.application.routes.draw do
  get 'users/show'
  # これはdeviseを使用する際にURLとしてusersを含むことを設定
  devise_for :users
  # 最初の画面の表示を設定
  root to: 'homes#top'
  # PostImageのルーティングを作成
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # いいね機能のルート
    resource :favorites, only: [:create, :destroy]
    # コメントは、投稿画像に足してコメントされるため、post_commentsはpost_imagesに結び付く。
    # よって親子関係になるため、このように記述する。
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


end