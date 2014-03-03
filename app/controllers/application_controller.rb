class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record


  protect_from_forgery with: :exception
 

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
        session[:visit_id] = visit.id
        #render_json({:messages => "Ok", :status => 200}.to_json)
        redirect_to home_path
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

  protected

  def render_json(json)
    callback = params[:callback]
    response = begin
      if callback
        "#{callback}(#{json});"
      else
        json
      end
    end
    render({:content_type => :js, :text => response})
  end

  def bad_record
    render_json({:errors => "No Record Found!", :status => 404}.to_json)
  end

  def parameter_errors
    render_json({:errors => "You have supplied invalid parameter list.", :status => 404}.to_json)
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end
