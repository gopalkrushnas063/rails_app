class Employee < ApplicationRecord
    has_many :documents

    validates :first_name, :last_name, presence: true
    validates :personal_email, presence: true
    validates :city, :state, :pincode, :country, :address_line_1,  presence: true


    def name
        "#{first_name} #{middle_name} #{last_name}".strip
    end

    def full_address
        "#{address_line_1}, #{city}, #{state}, #{country}, #{pincode}".strip
    end
end
