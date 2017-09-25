class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super
	end
	def update
		super
	end

	private
	def sign_up_params
		allow = [:password, :password_confirmation, :rut, :email, :nombre, :apellido]
		params.require(resource_name).permit(allow)
	end
end