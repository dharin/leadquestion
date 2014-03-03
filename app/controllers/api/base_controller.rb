class Api::BaseController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record
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
