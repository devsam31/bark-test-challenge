# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render 'shared/not_found', status: :not_found
    end

    rescue_from ActionController::ParameterMissing do |exception|
      flash.now[:alert] = "Required parameters are missing: #{exception.param}"
      render :new
    end
  end
end
