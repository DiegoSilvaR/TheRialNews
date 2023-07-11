class ApplicationController < ActionController::Base
  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
      flash[:alert] = "No estás autorizado para realizar esta acción"
      redirect_to reports_path
    end
  end
end


