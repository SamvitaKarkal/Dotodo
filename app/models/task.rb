class Task < ApplicationRecord
    validates_presence_of :title, presence: true
end