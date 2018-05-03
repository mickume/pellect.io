
class CreateRoleService
  def call(role = 'user')
    begin
      role = Role.find_or_create_by!(name: role) do |r|
        r.name = name
        u.save!
      end

      puts "CREATED ROLE: #{role.name}"
    rescue => exception
      puts "Role already exists."
    end
  end
end