class Post < ApplicationRecord
    include PgSearch::Model
    multisearchable against: [:title, :description]

    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence: true
    validates :type, presence: true
    validates :post_image, presence: true

    has_many :comments, dependent: :destroy
    belongs_to :user
    mount_uploader :post_image, PostImageUploader

        has_many :favorites
        has_many :favorited_by, through: :favorites, source: :user

    acts_as_taggable_on :tags

    # def api_as_json
    #     {
    #         title: title,
    #         description: description,
    #         post_image: post_image
    #     }
    # end

    # def to_param
    #     "#{title.parameterize}"
    # end

end
