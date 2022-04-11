class V1::AnswersController < ApplicationController
  def index
    answers = Answer.all
    render json: answers
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      render json: answer
    else
      render json: answer.errors
    end
  end

  def update
    # answer = Answer.find_by(id: params[:id])
    if answer.update(answer_params)
      render json: answer
    else
      render json: answer.errors
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.destroy
      render json: answer
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:id, :user_id, :answer, :question_id)
  end

end
