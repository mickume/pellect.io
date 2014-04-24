class ShortenedLinksController < ApplicationController
  def translate
    b = Bookmark.find_by_url_shortened(params[:short_url])

    if b && (b.user_id == current_user.id)
      
      # increment the view count
      b.increment(:view_count)
      
      # add some days to prevent the bookmark from expiring
      ttl = Figaro.env.url_ttl.to_i
      if b.time_to_expiration < (ttl * 2)
        if b.view_count < 8
          b.time_to_expiration = b.time_to_expiration + (2 ** b.view_count)
        end
      end
      
      b.save
      
      # retrieve and redirect to the 'real' url
      redirect_to Resource.find(b.resource_id).url

    else
      redirect_to root_path
    end

  end
end