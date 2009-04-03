# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # array to use in status selectors
  @public_or_private = Array[ "Public", "Private" ]

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '986dbca54014ed86454a706f2472ca3b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  helper_method :logged_in?
  
  def authenticate_from_cookie
      return unless cookies[:auth_token] && cookies[:auth_id] && session[:account_id].nil?
      auth_id = cookies[:auth_id]
      auth_token = cookies[:auth_token]
      account = Account.authenticate_using_token(auth_id,auth_token)
      if account  
         session[:account_id] = account.id  
         session[:account_name] = account.name
      end
  end
  
  def authorize
    unless Account.find_by_id(session[:account_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please log in"
      redirect_to(login_path)
      false
    end
  end
  
  def authorize_or_signup
    unless Account.find_by_id(session[:account_id])
      session[:original_uri] = request.request_uri
      if request.method == :post
        session[:return_post_params] = params
      end
      logger.debug("Session URI: #{session[:original_uri]}")
      flash[:notice] = "Oops.  Looks like you don't have account yet."
      redirect_to(signup_path)
      false
    end
  end
  
  #From here: http://last10percent.com/2008/05/26/post-redirects-in-rails/
  def redirect_post(redirect_post_params)
      controller_name = redirect_post_params[:controller]
      controller = "#{controller_name.camelize}Controller".constantize
      # Throw out existing params and merge the stored ones
      request.parameters.reject! { true }
      request.parameters.merge!(redirect_post_params)
      controller.process(request, response)
      if response.redirected_to
        @performed_redirect = true
      else
        @performed_render = true
      end
  end
  
  def handle_login_redirect(default_redirect = login_url)
    uri = session[:original_uri]
    session[:original_uri] = nil
    return_params = session[:return_post_params]
    session[:return_post_params] = nil
    if return_params
      redirect_post(return_params)
    else
      redirect_to(uri || default_redirect)
    end
  end
  
  def logged_in?
    session[:account_id]
  end
  
end

class String
  def last
    self[self.length-1].chr
  end

  def possessive
    self.last == 's' ? (self + "\'") : (self + "\'s")
  end
end
