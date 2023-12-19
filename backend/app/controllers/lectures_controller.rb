class LecturesController < ApplicationController
  def index
    lectures = Lecture.joins(:teacher)
                      .select('lectures.*, CONCAT(users.last_name, " ", users.first_name) as teacher_name')
                      .filter_period_by(params[:period])
                      .filter_dow_by(params[:day_of_week])
                      .filter_title_by(params[:title])
                      .all
    render json: lectures
  end

  def show
    lecture = Lecture.joins(:teacher)
                      .select('lectures.*, CONCAT(users.last_name, " ", users.first_name) as teacher_name')
                      .find(params[:id])
    render json: lecture
  end
end
