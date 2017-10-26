require 'json'
class Domain < ApplicationRecord

	def self.process_domain_file
		file = File.read("#{Rails.root}/public/email_classification.json")
		data_hash = JSON.parse(file)
		data_hash.each do |full_name, email|
			full_name = full_name.split(' ')
			domain = email.split('@').last
			unless Domain.find_by(domain_name: domain)
				initial = email.start_with?(full_name.first.downcase)
				email_generator = initial ?  'first_name_last_name' :  'first_name_initial_last_name'
				Domain.create(domain_name: domain, email_generator: email_generator)
			end
		end
	end

	#for now these methods are hardcoded can be achieved through Latent Semantic Indexer.

	def first_name_last_name(full_name)
		full_name.split.join + '@' + domain_name
	end

	def first_name_initial_last_name(full_name)
		full_name = full_name.split(' ')
		full_name[0][0] + full_name[1] + '@' + domain_name
	end

	def get_email(full_name)
		send(email_generator, full_name)
	end
end
