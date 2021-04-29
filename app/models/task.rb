class Task < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {maximum: 50 }
    validates :slug, uniqueness: true
    validate :slug_not_changed

    before_create :set_slug

    private
    
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
        #col_name_changed? attr of ActiveRecord tracks changes
        #persisted checks if it's not a new record and it was not destroyed
        if slug_changed? && self.persisted?
            errors.add(:slug, t('task.slug.immutable'))
        end
        #errors is instance of ActiveModel::Errors error related functionalities.
    end
end