class DomainsController < ApplicationController
 	def get_email
 		domain = Domain.find_by(domain_name: params['domain'])
 		email = domain.get_email(params[:full_name].downcase) rescue 'Email Cant be predicted.'
 		render json: {
 		  email: email
 		}
 	end
end
