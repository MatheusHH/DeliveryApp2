class Admin::EditUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]
  
  def edit
  end

  def update
    respond_to do |format|
      if @user.update_with_password(user_params)
        format.html { redirect_to admin_root_url, notice: t('flash.actions.update.notice', model: @user.model_name.human) }
        format.json { render :show, status: :ok, location: @user }
        bypass_sign_in @user, scope: :user
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
   
end