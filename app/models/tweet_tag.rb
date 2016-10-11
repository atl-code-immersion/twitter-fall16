class TweetTag < ApplicationRecord
	belongs_to :tag
	belongs_to :tweet
end
