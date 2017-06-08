class LessonSubjectsController < ApplicationController
  def index
  end

  def search
    if params.key? :id
      lesson_subject = LessonSubject.active.where id: params[:id]
    elsif params[:name].present?
      lesson_subject = LessonSubject.active
        .where("name LIKE ?", "%#{params[:name]}%")
    else
      lesson_subject = LessonSubject.active
    end

    render json: lesson_subject
  end

  def new
    @lesson_subject = LessonSubject.new
  end

  def create
    @lesson_subject = LessonSubject.new lesson_subject_params

    if @lesson_subject.save
      redirect_to @lesson_subject
    else
      render 'new'
    end
  end

  def show
    @lesson_subject = LessonSubject.find_by_id params[:id]
    if @lesson_subject.nil?
      render 'index'
    end
  end

  def edit
    @lesson_subject = LessonSubject.find_or_create_by id: params[:id]
  end

  def update
    @lesson_subject = LessonSubject.find params[:id]

    if @lesson_subject.update lesson_subject_params
      redirect_to @lesson_subject
    else
      render 'edit'
    end
  end

  def destroy
    @lesson_subject = LessonSubject.find params[:id]
    @lesson_subject.active = false
    @lesson_subject.save

    redirect_to lesson_subjects_path
  end

  def disabled
    @lesson_subjects = LessonSubject.disabled
  end

  def restore
    @lesson_subject = LessonSubject.find params[:id]
    @lesson_subject.active = true
    @lesson_subject.save

    redirect_to @lesson_subject
  end

private
  def lesson_subject_params
    params.require(:lesson_subject).permit :name
  end
end
