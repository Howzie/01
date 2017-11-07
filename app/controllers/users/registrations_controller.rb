class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_filter :configure_permitted_parameters
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def new
    # build_resource({})
    # self.resource.account = Account.new
    # respond_with self.resource
    build_resource({})
    resource.accounts.build
    respond_with self.resource
  end
 
  def create
    super
  end
 
  # private
  # def sign_up_params
  #   # allow = [:email, :password, :password_confirmation, :name, :address, :mobile, :user_type, [accounts_attributes: [:user_id, :bank_name, :bank_address, :account_no, :IFSC, :PAN, :GST]]
  #   params.require(resource_name).permit(:email, :password, :password_confirmation, :name, :address, :mobile, :user_type, accounts_attributes: [:user_id, :bank_name, :bank_address, :account_no, :IFSC, :PAN, :GST])
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, :name, :address, :mobile, :user_type,accounts_attributes: [:user_id, :bank_name, :bank_address, :account_no, :IFSC, :PAN, :GST])
    }

    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(
      :email,
      :password, 
      :password_confirmation, 
      :name, 
      :address, 
      :mobile, 
      :user_type,
      :current_password,
      accounts_attributes: [:id, :user_id, :bank_name, :bank_address, :account_no, :IFSC, :PAN, :GST]
    )}
  end
end
