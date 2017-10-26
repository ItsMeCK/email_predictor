require 'rails_helper'

describe Domain do
	#before { @resource = FactoryGirl.create :doamin }
	context 'when Domain is created' do
		context 'valid domain' do
		  	let(:valid_domain1)  { Domain.create(domain_name: 'google.com', email_generator: 'first_name_last_name') }
		    let!(:valid_domain2) { Domain.create(domain_name: 'babel.com', email_generator: 'first_name_initial_last_name') }

		    it 'valid domain' do
		    	email = valid_domain1.get_email('xyz abc')
		    	expect(email).to eq('xyzabc@google.com')
		    end

		    it 'invalid domain' do
		    end
		end
	end
end