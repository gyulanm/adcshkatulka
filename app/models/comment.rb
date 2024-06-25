class Comment < ApplicationRecord
    validates :body, presence: true

    has_many :replies, class_name: "Comment", foreign_key: "reply_to_comment_id", dependent: :destroy
    belongs_to :comment, class_name: "Comment", foreign_key: "reply_to_comment_id", optional: true

    belongs_to :post
    belongs_to :user

    default_scope { where(reply_to_comment_id: nil) }

    # scope :out_of_print, -> { where(out_of_print: true) }

        # def api_as_json
    #     {
    #         body: body
    #     }
    # end

end
