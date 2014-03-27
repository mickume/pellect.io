#
# redirect to 'home' instead of 'signin'
#
# see https://stackoverflow.com/questions/8809681/cannot-override-devise-passwords-controller
#
class PasswordsController < Devise::PasswordsController
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    root_url
  end
end