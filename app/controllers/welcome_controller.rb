class WelcomeController < ApplicationController

	def index
		if user_signed_in?
			if current_user.is_doctor
				# Fetch appointment here and display it on ui
				@appointments = Appointment.all.where(doctor_id: current_user.id) 
				render "patients/appointments"
			else
				@doctors = User.where(is_doctor: true)
				@appointments = Appointment.all.where(patient_id: current_user.id)
				render "doctors/listing"
			end
		end
	end

	def book
		doctor = User.find(params[:doc_id])
		patient = User.find(params[:user_id])

		if !Appointment.where(doctor_id: doctor.id, patient_id: patient.id).present?
			Appointment.create(doctor_id: doctor.id, patient_id: patient.id)
			BackgroundWorker.perform_at(4.hours.from_now, current_user.id, doctor.id, 'for_patient')
			BackgroundWorker.perform_at(4.hours.from_now, current_user.id, doctor.id, 'for_doctor')
			redirect_to :root
		else
		  redirect_to :root, notice: "You already have appointment"
		end
	end

	def cancel
		doctor = User.find(params[:doc_id])
		patient = User.find(params[:user_id])
		appointment = Appointment.find_by(doctor_id: doctor.id, patient_id: patient.id)

		if appointment.created_at + 1.hour > DateTime.now
			appointment.destroy
			redirect_to :root
		else
			redirect_to :root, notice: "You can not cancel this appointment"
		end
	end

	def cancel_by_doctor
		doctor = User.find(params[:doc_id])
		patient = User.find(params[:user_id])
		appointment = Appointment.find_by(doctor_id: doctor.id, patient_id: patient.id)

		appointment.destroy
		redirect_to :root
	end

	def accept_by_doctor
		doctor = User.find(params[:doc_id])
		patient = User.find(params[:user_id])
		appointment = Appointment.find_by(doctor_id: doctor.id, patient_id: patient.id)
		
		appointment.accepted = true
		appointment.accepted_by = current_user.id
		appointment.save
		redirect_to :root
	end

end
