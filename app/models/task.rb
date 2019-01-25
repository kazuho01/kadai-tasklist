class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255, message: "255文字以下で記入してください" }
  validates :status, presence: true, length: { maximum: 10, message: "10文字以下で記入してください" }
end
