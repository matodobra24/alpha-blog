class User < ActiveRecord::Base
    
    has_many :articles
    
    #before user email is saved it saves it as downcase
    before_save { self.email = email.downcase }
    #Validation tools. Validates :username presence to show username isnt blank
    #Uniqueness ensures that usernames arent the same and are not case sensitive
    #Usernames have a minimum length of 3 characters & a max of 25
    #Lecture #93
    
    validates :username, presence: true, 
                            uniqueness: { case_sensitive: false }, 
                            length: { minimum: 3, maximum: 25}
                            
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, uniqueness: {case_sensitive: false},
                            format: { with: VALID_EMAIL_REGEX },
                            length: { minimum: 3, maximimum: 25 }
end