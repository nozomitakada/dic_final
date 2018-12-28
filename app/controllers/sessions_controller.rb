class SessionsController < ApplicationController
  def new
  end
  
  def create
    if session[:email] == Owner.find_by(email:session[:email])
      owner = Owner.find_by(email: params[:session][:email].downcase)
      if owner && owner.authenticate(params[:session][:password])
        session[:owner_id] = owner.id
        redirect_to owners_path(owner.id)
        #redirect_to houses_path  
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
      end
    else
      user = Uer.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        #redirect_to owners_path(owner.id)
        redirect_to houses_path
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
      end
    end
  end
  
  def destroy
    session.delete(:owner_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
