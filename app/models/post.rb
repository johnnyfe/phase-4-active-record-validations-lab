class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ["Fiction","Non-Fiction"]}
    validate :clickbait?

    Clickbaits = [/Believe/i, /Guess/i, /Top/i, /Popular/i]

    def clickbait?
        if Clickbaits.none? {|path| path.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
