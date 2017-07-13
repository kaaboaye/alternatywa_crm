class RecommendationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recommendation = Recommendation.new
    @recommendation.member = Member.find params[:member_id]
  end

  def edit
  end
end
