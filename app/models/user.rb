class User < ApplicationRecord
    validates :email, :name, :phone_number, :role, presence: true
    has_many :calls, foreign_key: :patient_id
    has_many :calls_as_doctor, class_name: 'Call', foreign_key: :doctor_id
end