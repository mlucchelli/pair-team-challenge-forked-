class CallsController < ApplicationController

    def start
        Patient.find
        call = Call.create!
        {
            patient_id: params["patient_id"],
            doctor_id: params["doctor_id"]
        }
        external_call_id = ExternalCallService.start_call(phone_number_1, phone_number_2)
        call.external_call_id = external_call_id
        call.save
        Rails.logger.info("Call Started")
        call
    rescue => err
        Rails.logger.error("Creation failure #{error.description}")
    end

    def history
        @patient = User.find(params[:patient_id])
        @calls = Call.history_for_patient(@patient.id).page(params[:page]).per(10)
      end
end
