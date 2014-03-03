class QuestionStepsController < ApplicationController
  include Wicked::Wizard
  steps :question, :answer, :selecttype

  def show
    if session[:question_id].present?
      @question = Question.find(session[:question_id])
    else
      @question = Question.create
      session[:question_id] = @question.id
    end
    @answer = @question.answers.build unless @question.answers.present? 
    render_wizard
  end

  def update
    @question = Question.find(session[:question_id])
    @answer = @question.answers.build unless @question.answers.present? 
    if params[:question].present? && params[:question][:ansopt2].present?
      ansopt2 = params[:question][:ansopt2]
      if ansopt2.to_s == "yes-no"
        @question.answers.destroy_all
        @question.answers.create(:answer => "Yes")
        @question.answers.create(:answer => "No")
      elsif ansopt2.to_s == "true-false"
        @question.answers.destroy_all
        @question.answers.create(:answer => "True")
        @question.answers.create(:answer => "False")
      else
        @question.answers.destroy_all
        @question.answers.create(:answer => params[:question][:ans_custom_1])
        @question.answers.create(:answer => params[:question][:ans_custom_2])
      end
    end
    @question.update_attributes(question_params)
    render_wizard @question
  end


  private

  def finish_wizard_path
    session[:question_id] = nil
    root_url
  end

  def question_params
    params.require(:question).permit(:ansopt2, :question_type_id, :answer_options, :question_name, :form_id, :answers_attributes => [:id, :answer, :question_id, :_destroy])
  end
end
