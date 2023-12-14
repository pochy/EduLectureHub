require 'rails_helper'

RSpec.describe Lecture, type: :model do
  # 正しい値での有効性テスト
  it 'is valid with valid day_of_week and period' do
    lecture = Lecture.new(day_of_week: 1, period: 1)
    expect(lecture).to be_valid
  end

  # day_of_weekの範囲外の値での無効性テスト
  it 'is invalid with a day_of_week outside the range 1-6' do
    lecture = Lecture.new(day_of_week: 0, period: 1)
    expect(lecture).to_not be_valid
  end

  # periodの範囲外の値での無効性テスト
  it 'is invalid with a period outside the range 1-6' do
    lecture = Lecture.new(day_of_week: 1, period: 7)
    expect(lecture).to_not be_valid
  end

  # day_of_weekが整数でない場合の無効性テスト
  it 'is invalid with a non-integer day_of_week' do
    lecture = Lecture.new(day_of_week: 'Monday', period: 1)
    expect(lecture).to_not be_valid
  end

  # periodが整数でない場合の無効性テスト
  it 'is invalid with a non-integer period' do
    lecture = Lecture.new(day_of_week: 1, period: 'First')
    expect(lecture).to_not be_valid
  end
end