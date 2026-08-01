class Public::UsersController < Public::ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :set_and_authorize_user, only: %i[ show edit update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to about_path, notice: "登録が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_and_authorize_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "権限がありません" unless @user == Current.user || action_name == "show"
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :profile_image)
  end
end