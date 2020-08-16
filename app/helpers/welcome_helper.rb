module WelcomeHelper
	def get_doctor_email(doc_id)
		User.find(doc_id).email
	end

	def get_doctor_username(doc_id)
		User.find(doc_id).username
	end

	def get_patient_email(pat_id)
		User.find(pat_id).email
	end

	def get_patient_username(pat_id)
		User.find(pat_id).username
	end
end
