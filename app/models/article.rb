class Article < ActiveRecord::Base
    #Create Validations that prevent nil elements. Forces Constraints!
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    
end