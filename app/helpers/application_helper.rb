module ApplicationHelper

  @CONFIG = nil
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def user_has_admin_role?
    current_user.has_role? :admin
  end
  
  def user_is_confirmed? (user)
    not (user.confirmed_at == nil)
  end
  
  def user_is_locked? (user)
    false
  end

  #
  # do we need this 
  #
  def application_name
    CONFIGURATION 'APP_NAME'
  end

  def gravatar_image_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def CONFIGURATION(key=nil)
    if !@CONFIG
      @CONFIG = YAML.load_file('config/application.yml')[Rails.env] rescue {}
    end
    @CONFIG[key]
  end
  
end
