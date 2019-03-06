class Company < ActiveRecord::Base
    belongs_to :industry
    belongs_to :country
end