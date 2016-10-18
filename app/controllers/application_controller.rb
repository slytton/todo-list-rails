class ApplicationController < ActionController::API
  rescue_from Exception, :with => :record_not_found

  def record_not_found(e)
    puts e.message
    render json: {errors: [e.message]}
  end
end
