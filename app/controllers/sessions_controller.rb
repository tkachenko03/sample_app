class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Учетная запись не активирована. "
        message += "Проверьте свой email для перехода по ссылке активации."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Не верная комбинация email/пароль' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end