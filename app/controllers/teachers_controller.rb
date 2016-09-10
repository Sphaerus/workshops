class TeachersController < ApplicationController
  before_action :authenticate_user!
  expose(:teachers)
  expose(:teacher, attributes: :teacher_params)
  expose(:teacher_subject_items) { teacher.subject_items }

  def create
    if teacher.save
      redirect_to teacher_path(teacher), notice: I18n.t('shared.created', resource: 'Teacher')
    else
      render :new
    end
  end

  def update
    if teacher.save
      if !teacher.subject_items.empty?
        redirect_to report_subjects_path, notice: teacher_updated
      else
        redirect_to teacher_path(teacher), notice: teacher_updated
      end
    else
      render :edit
    end
  end

  def destroy
    teacher.destroy
    redirect_to teachers_path, notice: I18n.t('shared.deleted', resource: 'Teacher')
  end

  def subjects

  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :academic_title, subject_item_ids: [])
  end

  def teacher_updated
    I18n.t('shared.updated', resource: 'Teacher')
  end
end
