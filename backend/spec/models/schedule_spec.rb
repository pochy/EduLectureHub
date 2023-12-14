require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # レクチャーとユーザーを作成する
  let(:user) { User.create!(password: 'TestPassword', last_name: 'Doe', first_name: 'John') }
  let(:lecture) { Lecture.create!(instructor_id: user.id, title: 'Test Lecture', day_of_week: 1, period: 1) }

  # 有効なスケジュールをテストする
  it 'is valid with a lecture and a user' do
    schedule = Schedule.new(lecture: lecture, user: user)
    expect(schedule).to be_valid
  end

  # lecture_idが無い場合は無効であることをテストする
  it 'is invalid without a lecture_id' do
    schedule = Schedule.new(lecture: nil, user: user)
    expect(schedule).to_not be_valid
  end

  # user_idが無い場合は無効であることをテストする
  it 'is invalid without a user_id' do
    schedule = Schedule.new(lecture: lecture, user: nil)
    expect(schedule).to_not be_valid
  end
end