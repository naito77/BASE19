class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  include SessionsHelper

  def t(key, options={})
    pp key
    if key[0] == '.'
      key = controller_name + "_controller." + action_name + key
    end

    super
  end

end
