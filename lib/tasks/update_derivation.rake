namespace :system do
  namespace :update_derivation do
    desc "Calculates flows to fix and creates the relevant flows"
    task :roll => :environment  do
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
  end
end
