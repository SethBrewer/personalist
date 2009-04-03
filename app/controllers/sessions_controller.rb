class SessionsController < ApplicationController
  
  before_filter :authorize, :only => :destroy

  layout 'sessions'

  def create
    session[:account_id] = nil
    logger.debug("email: #{params[:email]}")
    logger.debug("pwd: #{params[:password]}")
    account = Account.authenticate(params[:email], params[:password])
    if account
      session[:account_id] = account.id
      session[:account_name] = account.name
      if params[:remember_me]
        cookies[:auth_id] = { :value => account.id.to_s, :expires => 2.weeks.from_now }  
        cookies[:auth_token] = { :value => account.auth_token, :expires => 2.weeks.from_now }
      end
      account.update_last_login_at!
      handle_login_redirect(index_url)
    else
      flash[:notice] = "Invalid user/password combination"
      respond_to do |format|
        format.html { redirect_to(login_url) }
      end
    end
  end

  def destroy
    session[:account_id] = nil
    session[:account_name] = nil
    if cookies[:auth_id] then cookies.delete :auth_id end
    if cookies[:auth_token] then cookies.delete :auth_token end
    flash[:notice] = "Logged out"
    redirect_to(login_path)
  end

end
