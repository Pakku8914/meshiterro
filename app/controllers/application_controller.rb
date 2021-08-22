class ApplicationController < ActionController::Base
  # ログインしていない状態だと、トップページ以外のページは表示できない仕様に
  # before_actionはコントローラーが動作する間に実行される
  # authenticate_user!はdeviceが用意しているメソッド
  # ログイン状態でない場合、ログイン画面へリダイレクトする
  # exceptはbefore_actionの対象から外す
  before_action :authenticate_user!,except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizerはnameのデータ操作を許可するアクションメソッドが指定されている
    # 今回は、ユーザ登録(sign_up)の際に、ユーザ名(name)のデータ操作が許可される。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
