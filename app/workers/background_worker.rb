class BackgroundWorker
  include Sidekiq::Worker

  def perform(patient_id, doctor_id, for_person)
  	if for_person == 'for_doctor'
  		UserMailer.with(doctor: doctor_id, patient: patient_id).reminder_email_for_doctor.deliver_later
  	else
  		UserMailer.with(doctor: doctor_id, patient: patient_id).reminder_email_for_patient.deliver_later
  	end
  end

end