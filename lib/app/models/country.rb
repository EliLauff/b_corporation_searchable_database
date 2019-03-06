class Country < ActiveRecord::Base
    has_many :companies
    has_many :industries, through: :companies
end