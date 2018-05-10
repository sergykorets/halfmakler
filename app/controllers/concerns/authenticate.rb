module Authenticate
  def current_user
    @current_user = User.find_by(access_token: params[:access_token])
  end

  def authenticate_with_token!
    render json: { error: 'Not authenticated', is_success: false }, status: :unauthorized unless current_user.present?
  end
end