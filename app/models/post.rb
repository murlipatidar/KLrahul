class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :image, presence: true


	# enum :status, { draft: 0, published: 1, archived: 2 }

	 # enum :status, %i(draft published archived)

	 enum status: ["unpublished","published" , "draft"]
	 
	 # published -> 0  # unpublished -> 1  # draft -> 2

end

