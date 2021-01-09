class Comment < ApplicationRecord
    belongs_to :article

    validates :title, :content, presence: {message: 'は、しっかりと入力してください。'}
end
