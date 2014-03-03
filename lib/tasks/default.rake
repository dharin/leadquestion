namespace :db do
  desc "default provider"
  task :default_providers => :environment do
    Provider.create(:name => "test-provider-1", :domain_name => "https://www.google.co.in", :secret_key => SecureRandom.hex(16))
    Provider.create(:name => "test-provider-2", :domain_name => "https://www.facebook.com", :secret_key => SecureRandom.hex(16))
  end

  desc "default form data"
  task :default_forms => :environment do
    Form.create(:name => "Education", :domain => "Edu.")
    Form.create(:name => "Marketing", :domain => "Add.")
  end

  desc "default Question data"
  task :default_question => :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE questions")
    @from = Form.first
    @from.questions.create(:question_name => "Highest level of education so far")
    @from.questions.create(:question_name => "What degree is next for you?")
    @from.questions.create(:question_name => "Area of Study")
    @from.questions.create(:question_name => "Area of Concentration")
    @from.questions.create(:question_name => "Classroom Experience Wanted")
    @from.questions.create(:question_name => "Year graduated from high school")
    @from.questions.create(:question_name => "Are you interested in Federal Financial Aid?")
    @from.questions.create(:question_name => "Are you a Citizen of the United States?")
    @from.questions.create(:question_name => "Are you interested in Military Tuition ")
    @from.questions.create(:question_name => "Assistance or Veterans Educational Benefits?")
    @from.questions.create(:question_name => "Are you affiliated with the U.S. military?")
    @from.questions.create(:question_name => "Are you employed by a company that offers Tuition Reimbursement?")
    @from.questions.create(:question_name => "Employer")
    @from.questions.create(:question_name => "First Name")
    @from.questions.create(:question_name => "Last Name")
    @from.questions.create(:question_name => "Street")
    @from.questions.create(:question_name => "Zipcode")
    @from.questions.create(:question_name => "Email Address")
    @from.questions.create(:question_name => "Primary Phone Number")
    @from.questions.create(:question_name => "Best Time to Call")
  end
end
