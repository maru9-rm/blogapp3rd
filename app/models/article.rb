# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :content, uniqueness: true
  validates :title, format: { with: /\A(?!@)/ }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :eyecatch
  has_rich_text :content
  
end
