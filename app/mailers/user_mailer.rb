class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def reminder_email_for_doctor(doctor_id, patient_id)
  	@doctor = User.find(doctor_id)
  	@patient = User.find(patient_id)
    @url  = 'http://example.com/login'

    mail(to: @doctor.email, subject: 'Reminder of Appointment')
  end

  def reminder_email_for_patient(doctor_id, patient_id)
  	@doctor = User.find(doctor_id)
  	@patient = User.find(patient_id)
    @url  = 'http://example.com/login'
    
    mail(to: @patient.email, subject: 'Reminder of Appointment')
  end

end