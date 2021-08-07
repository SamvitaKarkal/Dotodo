# frozen_string_literal: true

class Task < ApplicationRecord
  # validates :title, presence: true
  enum progress: { pending: 0, completed: 1 }
  enum status: { unstarred: 0, starred: 1 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :slug, uniqueness: true
  validate :slug_not_changed

  before_create :set_slug
  # after_create :log_task_details

  private

    def self.organize(progress)
      starred = send(progress).starred.order("updated_at DESC")
      unstarred = send(progress).unstarred
      starred + unstarred
    end

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)

        itr += 1
      end
    end

    def slug_not_changed
      # col_name_changed? attr of ActiveRecord tracks changes
      # persisted checks if it's not a new record and it was not destroyed
      if slug_changed? && self.persisted?
        errors.add(:slug, t("task.slug.immutable"))
      end
      # errors is instance of ActiveModel::Errors error related functionalities.
    end

  # def test_user_should_not_be_valid_without_name
  #   @user.name = ''
  #   assert_not @user.valid?
  #   assert_equal ["Name can't be blank"], @user.errors.full_messages
  # end

  # def test_name_should_be_of_valid_length
  #   @user.name = 'a' * 50
  #   assert @user.invalid?
  # end

  # def test_instance_of_user
  #   assert_instance_of User, @user
  # end

  # def test_not_instance_of_user
  #   task = Task.new
  #   assert_not_instance_of User, task
  # end
end

