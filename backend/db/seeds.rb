# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Usersのサンプルデータ
users = [
  { password: 'password1', password_confirmation: 'password1', last_name: '田中', first_name: '太郎' },
  { password: 'password2', password_confirmation: 'password2', last_name: '鈴木', first_name: '花子' },
  # 他のユーザーデータを追加...
]

users.each do |user|
  User.create!(user)
end

# Lecturesのサンプルデータ
# 大学の講義のサンプルデータを作成
lectures = [
  { instructor_id: User.first.id, title: '数学', day_of_week: 1, period: 1 },
  { instructor_id: User.first.id, title: '物理', day_of_week: 2, period: 2 },
  { instructor_id: User.first.id, title: '情報理論', day_of_week: 3, period: 3 },
  { instructor_id: User.first.id, title: '統計学', day_of_week: 4, period: 4 },
  { instructor_id: User.first.id, title: '経済学', day_of_week: 5, period: 5 },
  { instructor_id: User.first.id, title: '英語', day_of_week: 6, period: 6 },
  { instructor_id: User.first.id, title: '日本史', day_of_week: 3, period: 1 },
  { instructor_id: User.first.id, title: '世界史', day_of_week: 1, period: 2 },
  { instructor_id: User.first.id, title: 'データベースシステム', day_of_week: 2, period: 3 },
  { instructor_id: User.first.id, title: 'アルゴリズム', day_of_week: 3, period: 4 },
  { instructor_id: User.first.id, title: '人工知能', day_of_week: 4, period: 5 },
  { instructor_id: User.first.id, title: '機械学習', day_of_week: 5, period: 6 },
  { instructor_id: User.first.id, title: '基礎物理学', day_of_week: 6, period: 2 },
  { instructor_id: User.first.id, title: '量子力学', day_of_week: 6, period: 1 },
  { instructor_id: User.first.id, title: '電磁気学', day_of_week: 1, period: 3 },
  { instructor_id: User.first.id, title: '熱力学', day_of_week: 2, period: 4 },
  { instructor_id: User.first.id, title: '相対性理論', day_of_week: 4, period: 6 },
  { instructor_id: User.first.id, title: '宇宙論', day_of_week: 5, period: 5 },
  { instructor_id: User.first.id, title: '現代文学概論', day_of_week: 6, period: 1 },
  { instructor_id: User.first.id, title: '現代美術概論', day_of_week: 6, period: 2 },
  { instructor_id: User.first.id, title: '現代音楽概論', day_of_week: 1, period: 4 },
  { instructor_id: User.first.id, title: '基礎化学', day_of_week: 2, period: 5 },
  { instructor_id: User.first.id, title: '有機化学', day_of_week: 3, period: 6 },
  { instructor_id: User.first.id, title: '無機化学', day_of_week: 4, period: 4 },
  { instructor_id: User.first.id, title: '生化学', day_of_week: 5, period: 1 },
  { instructor_id: User.first.id, title: '物理化学', day_of_week: 6, period: 2 },
  { instructor_id: User.first.id, title: '天文学', day_of_week: 6, period: 3 },
  { instructor_id: User.first.id, title: '地球科学', day_of_week: 1, period: 5 },
  { instructor_id: User.first.id, title: '地球物理学', day_of_week: 2, period: 6 },
  { instructor_id: User.first.id, title: '地質学', day_of_week: 3, period: 3 },
  { instructor_id: User.first.id, title: '生物学入門', day_of_week: 4, period: 1 },
  { instructor_id: User.first.id, title: '生物学概論', day_of_week: 5, period: 2 },
  { instructor_id: User.first.id, title: '応用論理学概論', day_of_week: 6, period: 3 },
  { instructor_id: User.first.id, title: '応用数学概論', day_of_week: 5, period: 4 },
  { instructor_id: User.first.id, title: '応用物理学概論', day_of_week: 1, period: 6 },
  { instructor_id: User.first.id, title: '応用化学概論', day_of_week: 2, period: 4 },
  { instructor_id: User.first.id, title: '応用生物学概論', day_of_week: 3, period: 1 },
  { instructor_id: User.first.id, title: '応用地学概論', day_of_week: 4, period: 2 },
  { instructor_id: User.first.id, title: '応用情報学概論', day_of_week: 5, period: 3 },
  # 他のレクチャーデータを追加...
]

lectures.each do |lecture|
  Lecture.create!(lecture)
end

# Schedulesのサンプルデータ
schedules = [
  { lecture_id: Lecture.first.id, user_id: User.first.id },
  { lecture_id: Lecture.first.id, user_id: User.second.id },
  # 他のスケジュールデータを追加...
]

schedules.each do |schedule|
  Schedule.create!(schedule)
end
