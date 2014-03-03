class Api::LeadsController < Api::BaseController
   
  ## Store Information from other website
  def store_lead
    if params[:secret_key].present?
      provider = Provider.find_by_secret_key(params[:secret_key])
      if provider.present?
        lead = Lead.find_by_source_url_and_email(params[:lead][:source_url], params[:lead][:email])
        @lead = lead.present? ? lead : provider.leads.create(lead_params)
        visit = @lead.visits.build
        visit.ipaddress = params[:lead][:ipaddress]
        visit.visit_date = Time.now    
        visit.save
        render_json({:messages => "Ok", :status => 200}.to_json)
      else
        render_json({:errors => "Invalid Secret Key", :status => 404}.to_json)
      end
    else
      render_json({:errors => "Bad Request", :status => 400}.to_json)
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:provider_id, :username, :firstname, :lastname, :email, :source_url, :latitude, :longitude, :city, :state, :country, :zipcode, :ipaddress)
  end

end
