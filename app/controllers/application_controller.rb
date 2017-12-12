class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_usuario!

	def after_sign_in_path_for(resource_or_scope)
  	evidences_path
	end

	def after_sign_out_path_for(resource_or_scope)
  	new_usuario_session_path
	end

	def current_ability
		@current_ability ||= Ability.new(current_usuario)
	end

	rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
end
