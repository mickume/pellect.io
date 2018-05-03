# frozen_string_literal: true

class CreateAdminUserService
  def call
    begin
      user = User.find_or_create_by!(email: Rails.application.secrets.admin_user_email) do |u|
        u.password = Rails.application.secrets.admin_user_password
        u.password_confirmation = Rails.application.secrets.admin_user_password
        u.full_name = Rails.application.secrets.admin_user_email
        u.role = 'admin'
        u.confirm
      end
      puts "CREATED ADMIN USER: #{user.email}"
    rescue => exception
      puts "User already exists."
    end
  end
end