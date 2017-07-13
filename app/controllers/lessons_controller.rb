class LessonsController < ApplicationController
  def index
  end

  def new
    @lesson = Lesson.new
  end

  def search
    if (params[:lesson_subject_id].present? &&
        params[:since].present? &&
        params[:finish].present?)

      since = Time.at params[:since].to_i
      finish = Time.at params[:finish].to_i

      lessons = Lesson.active
        .includes(:giving_member, :taking_member, :lesson_subject)
        .where(:datetime => since..finish)
        .where(lesson_subject_id: params[:lesson_subject_id])
        .order(datetime: :desc)
    elsif params[:since].present? && params[:finish].present?
      since = Time.at params[:since].to_i
      finish = Time.at params[:finish].to_i

      lessons = Lesson.active
        .includes(:giving_member, :taking_member, :lesson_subject)
        .where(:datetime => since..finish)
        .order(datetime: :desc)
    else
      lessons = []
    end

    json = []
    lessons.each do |l|
      json.push({
          id: l.id,
          giving_member: {
            first_name: l.giving_member.first_name,
            last_name: l.giving_member.last_name,
            pesel: l.giving_member.pesel
          },
          taking_member: {
            first_name: l.taking_member.first_name,
            last_name: l.taking_member.last_name,
            pesel: l.taking_member.pesel
          },
          lesson_subject: l.lesson_subject.name,
          datetime: l.datetime
        })
    end

    render json: json
  end

  def create
    lesson = Lesson.new lesson_params

    if lesson.save
      render json: {success: true}
    else
      render json: {
        success: false,
        errors: lesson.errors.full_messages
        }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def edit
    @lesson = Lesson.find_or_create_by id: params[:id]

    lesson_subjects = LessonSubject.active.select(:id, :name)

    @public_lesson = {
      id: @lesson.id,
      giving_member: {
        id: @lesson.giving_member.id,
        first_name: @lesson.giving_member.first_name,
        last_name: @lesson.giving_member.last_name,
        pesel: @lesson.giving_member.pesel
      },
      taking_member: {
        id: @lesson.taking_member.id,
        first_name: @lesson.taking_member.first_name,
        last_name: @lesson.taking_member.last_name,
        pesel: @lesson.taking_member.pesel
      },
      lesson_subjects: lesson_subjects,
      lesson_subject: {
        id: @lesson.lesson_subject.id,
        name: @lesson.lesson_subject.name
      },
      time: @lesson.time,
      datetime: @lesson.datetime
    }
  end

  def update
    @lesson = Lesson.find params[:id]

    if @lesson.update lesson_params
      render json: {success: true}
    else
      render json: {
        success: false,
        errors: @lesson.errors.full_messages
        }
    end
  end

  def destroy
    lesson = Lesson.find params[:id]
    lesson.destroy
    redirect_to lessons_path
  end

private
  def lesson_params
    params.permit :giving_member_id, :taking_member_id, :lesson_subject_id,
      :time, :datetime
  end
end
