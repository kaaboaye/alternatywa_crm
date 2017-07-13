class RecommendationsController < ApplicationController
  include RecommendationsHelper

  def index
    @recommendations_index = true
    @member = Member.find params[:member_id]
  end

  def show
    @recommendation = Recommendation.find params[:id]
  end

  def new
    @recommendation = Recommendation.new
    @recommendation.member = Member.find params[:member_id]
  end

  def create
    @recommendation = Recommendation.new recommendation_params
    @recommendation.member = Member.find params[:member_id]

    if @recommendation.save
      redirect_to member_recommendation_path(@recommendation.member, @recommendation)
    else
      render 'new'
    end
  end

  def update
    @recommendation = Recommendation.find params[:id]

    if @recommendation.update recommendation_params
      redirect_to member_recommendation_path(@recommendation.member, @recommendation)
    else
      render 'show'
    end
  end

  def destroy
    recommendation = Recommendation.find params[:id]
    recommendation.destroy

    if params[:root] == "true"
      redirect_to member_recommendations_path(recommendation.member)
    else
      redirect_to member_path(recommendation.member)
    end
  end

private
  def recommendation_params
    params.require(:recommendation).permit :note
  end
end
