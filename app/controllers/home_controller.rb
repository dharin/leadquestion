class HomeController < ApplicationController

  before_filter :current_visitor, :only => [:home]
  
  def current_visitor
    if session[:visit_id].present? 
      @visitor = Visit.find(session[:visit_id])
    else
      @visitor = Visit.create(:ipaddress => request.remote_ip)
      session[:visit_id] = @visitor.id 
    end
  end

  def index
  end

  def articles
  end

  def home
    @providers = Provider.all
    @form_data = Question.new()
  end
end
