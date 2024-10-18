class Call < ApplicationRecord
    enum :status, [ :started, :completed, :undefined ]
    belongs_to :patient, class_name: 'User'
    belongs_to :doctor, class_name: 'User'

    scope :history_for_patient, ->(patient_id) {
        includes(:patient)
          .where(patient_id: patient_id)
          .order(created_at: :desc)
      }
end
