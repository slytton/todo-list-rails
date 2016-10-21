class ApplicationController < ActionController::API
  rescue_from Exception, :with => :record_not_found

  def default_url_options
      {host: ENV['HOSTNAME']}
  end
  # def record_not_found(e)
  #   puts e.message
  #   render json: {errors: [e.message]}
  # end

  def send_response condition, success, failure
    if condition
      render success
    else
      render failure
    end
  end
end
