class FormDatasController < ApplicationController

  def index

  end

  def create
    @visitor = Visit.find(session[:visit_id])
    ans = params[:question][:form_datas][:answer]
    if ans.present?
      ans.each do |a|
        FormData.create(:question_id => a.first.to_i, :answer => a.last, :visit_id => @visitor.id )
      end
    end
    session[:visit_id] = nil
    redirect_to form_data_path(@visitor.id)
  end

  def show
    @visitor = Visit.find(params[:id])
  end

end
