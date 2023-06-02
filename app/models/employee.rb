class Employee < ApplicationRecord
    def name
        "#{first_name} #{middle_name} #{last_name}".strip
    end

    def full_address
        "#{address_line_1}, #{city}, #{state}, #{country}, #{pincode}"
    end
end
