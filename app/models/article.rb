class Article < ApplicationRecord
    has_many :comment

    validates :content, :name, presence: {message:'は、ちゃんと入力してください。'}
end
