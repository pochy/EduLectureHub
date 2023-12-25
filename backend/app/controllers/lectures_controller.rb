class LecturesController < ApplicationController
  before_action :authenticate_api_user!
  def index
    lectures = Lecture.left_outer_joins(:schedules).joins(:teacher)
                      .select('lectures.*, schedules.id as schedules_id, CONCAT(users.last_name, " ", users.first_name) as teacher_name')
                      .filter_period_by(params[:period])
                      .filter_dow_by(params[:day_of_week])
                      .filter_title_by(params[:title])
                      .merge(
                        Schedule.where({ user_id: current_api_user.id })
                          .or(Schedule.where("schedules.user_id is NULL"))
                      )
                      .all
    render json: lectures
  end

  def show
    lecture = Lecture.left_outer_joins(:schedules).joins(:teacher)
                     .select('lectures.*, schedules.id as schedules_id, CONCAT(users.last_name, " ", users.first_name) as teacher_name')
                      .merge(
                        Schedule.where({ user_id: current_api_user.id })
                          .or(Schedule.where("schedules.user_id is NULL"))
                      )
                     .find(params[:id])
    render json: lecture
  end
end
