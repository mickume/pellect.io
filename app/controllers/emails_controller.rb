
require 'griddler'

class EmailsController < ActionController::Base
  def create
    status = 200 # OK
    
    begin
      normalized_params.each do |p|
        status = Griddler::Email.new(p).process
      end
    
    rescue
      status = 500
    end
    
    render :nothing => true, :status => status
  end

  private

  def normalized_params
    Array.wrap(Griddler.configuration.email_service.normalize_params(params))
  end
end
