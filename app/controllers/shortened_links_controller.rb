class ShortenedLinksController < ApplicationController
  def translate
    b = Bookmark.find_by_url_shortened(params[:short_url])

    if b && (b.user_id == current_user.id)
      # don't want to wait for the increment to happen, make it snappy!
      Thread.new do
      # this is the place to enhance the metrics captured
      # for the system. You could log the request origin
      # browser type, ip address etc.
        b.increment(:view_count)
        b.save
      end

      # retrieve and redirect to the 'real' url
      redirect_to Resource.find(b.resource_id).url

    else
      redirect_to root_path
    end

  end
end