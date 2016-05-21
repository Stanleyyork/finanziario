class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(current_user.id)
    @shared_users = User.where("id != ?", @user.id)
    render :settings
  end

  def update
    @user = User.find(current_user.id)
    user_params = params.require(:user).permit(:name,:email)
    if @user.update_attributes(user_params)
      flash[:notice] = "Updated!"
      redirect_to "/settings"
    else 
      flash[:notice] = @user.errors.map{|k,v| "#{k} #{v}".capitalize}
      redirect_to "/settings"
    end
  end

  def destroy
    if current_user
      current_user.destroy
      session[:user_id] = nil
      respond_to do |format|
        format.html { redirect_to '/signup', notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
