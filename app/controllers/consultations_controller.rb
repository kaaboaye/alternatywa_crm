class ConsultationsController < ApplicationController
  def index
  end

  def new
    @consultation = Consultation.new
  end

  def search
    if (params[:since].present? &&
        params[:finish].present?)

      since = Time.at params[:since].to_i
      finish = Time.at params[:finish].to_i

      consultations = Consultation.active
        .includes(:member)
        .where(:datetime => since..finish)
        .order(datetime: :desc)
    else
      lessons = []
    end

    json = []
    consultations.each do |c|
      json.push({
          id: c.id,
          member: {
            first_name: c.member.first_name,
            last_name: c.member.last_name,
            phone: c.member.phone
          },
          datetime: c.datetime
        })
    end

    render json: json
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

  def show
    @consultation = Consultation.find_by_id params[:id]
    if @consultation.nil?
      render 'index'
    end
  end

  def edit
    @consultation = Consultation.find_or_create_by id: params[:id]

    @public_consultation = {
      id: @consultation.id,
      member: {
        id: @consultation.member.id,
        first_name: @consultation.member.first_name,
        last_name: @consultation.member.last_name,
        phone: @consultation.member.phone
      },
      datetime: @consultation.datetime,
      description: @consultation.description
    }
  end

  def update
    @consultation = Consultation.find params[:id]

    if @consultation.update consultation_params
      render json: {success: true}
    else
      render json: {
        success: false,
        errors: @consultation.errors.full_messages
        }
    end
  end

private
  def consultation_params
    params.permit :member_id, :datetime, :description
  end
end
