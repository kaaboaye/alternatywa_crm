class ConsultationsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    consultation = Consultation.new consultation_params

    if consultation.save
      render json: {success: true}
    else
      render json: {
        success: false,
        errors: consultation.errors.full_messages
        }
    end
  end

private
  def consultation_params
    params.permit :member_id, :datetime, :description
  end
end
