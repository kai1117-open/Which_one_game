class Quiz < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :genre
end
