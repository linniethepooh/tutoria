class SignedUrlController < ApplicationController
  skip_after_action :verify_authorized


  def signed_url
    render json: {
      signed_url: GoogleStorage.signed_url(
        method: :put,
        name: params[:name],
        expires: 5.minutes.from_now,
        content_type: params[:content_type]
      )
    }
  end
end
