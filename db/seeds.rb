# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# add the default roles
CreateRoleService.new.call("admin")
CreateRoleService.new.call("staff")
CreateRoleService.new.call("user")

# add the admin user
admin = CreateAdminUserService.new.call

# add a default icon to the database
site = Site.new
site.host = "default"
site.favicon = "default.png"
site.save!

if Rails.env != 'production'

	# add some dummy data for testing

end